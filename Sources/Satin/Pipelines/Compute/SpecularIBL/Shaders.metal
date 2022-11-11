#include "Library/Pbr/ImportanceSampling.metal"
#include "Library/Pbr/Distribution/DistributionGGX.metal"
#include "Library/Rotate.metal"

static constant float4 rotations[6] = {
    float4(0.0, 1.0, 0.0, HALF_PI),
    float4(0.0, 1.0, 0.0, -HALF_PI),
    float4(1.0, 0.0, 0.0, -HALF_PI),
    float4(1.0, 0.0, 0.0, HALF_PI),
    float4(0.0, 0.0, 1.0, 0.0),
    float4(0.0, 1.0, 0.0, PI)
};

#define SAMPLE_COUNT 1024u

typedef struct {
    int2 size;
} SpecularIBLUniforms;

constexpr sampler cubeSampler(mag_filter::linear, min_filter::linear, mip_filter::linear);

kernel void specularIBLUpdate(
    uint2 gid [[thread_position_in_grid]],
    texture2d<float, access::write> tex0 [[texture(ComputeTextureCustom0)]],
    texture2d<float, access::write> tex1 [[texture(ComputeTextureCustom1)]],
    texture2d<float, access::write> tex2 [[texture(ComputeTextureCustom2)]],
    texture2d<float, access::write> tex3 [[texture(ComputeTextureCustom3)]],
    texture2d<float, access::write> tex4 [[texture(ComputeTextureCustom4)]],
    texture2d<float, access::write> tex5 [[texture(ComputeTextureCustom5)]],
    texturecube<float, access::sample> ref [[texture(ComputeTextureCustom6)]],
    constant SpecularIBLUniforms &uniforms [[buffer(ComputeBufferUniforms)]],
    constant float &roughness [[buffer(ComputeBufferCustom0)]])
{
    if (gid.x >= tex0.get_width() || gid.y >= tex0.get_height()) {
        return;
    }

    const texture2d<float, access::write> tex[6] = { tex0, tex1, tex2, tex3, tex4, tex5 };
    const float2 size = float2(tex0.get_width(), tex0.get_height());
    const float2 uv = (float2(gid) + 0.5) / size;

    float2 ruv = 2.0 * uv - 1.0;
    ruv.y *= -1.0;

    for (int face = 0; face < 6; face++) {
        const float4 rotation = rotations[face];
        const float3 N = normalize(float3(ruv, 1.0) * rotateAxisAngle(rotation.xyz, rotation.w));

        // make the simplyfying assumption that V equals R equals the normal
        const float3 R = N;
        const float3 V = R;

        float3 prefilteredColor = float3(0.0, 0.0, 0.0);
        float totalWeight = 0.0;

        for (uint i = 0u; i < SAMPLE_COUNT; ++i) {
            // generates a sample vector that's biased towards the preferred alignment direction (importance sampling).
            float2 Xi = hammersley(i, SAMPLE_COUNT);
            float3 H = importanceSampleGGX(Xi, N, roughness);
            float3 L = normalize(2.0 * dot(V, H) * H - V);

            const float NdotL = max(dot(N, L), 0.0);
            if (NdotL > 0.0) {
                // sample from the environment's mip level based on roughness/pdf

                const float NdotH = max(dot(N, H), 0.0);
                const float HdotV = max(dot(H, V), 0.0);
                const float D = distributionGGX(NdotH, roughness);
                const float pdf = max((D * NdotH / (4.0 * HdotV)) + 0.0001, 0.0001);

                const float resolution = float(ref.get_width()); // resolution of source cubemap (per face)
                const float saTexel = 4.0 * PI / (6.0 * resolution * resolution);
                const float saSample = 1.0 / (float(SAMPLE_COUNT) * pdf + 0.0001);

                const float mipLevel = roughness == 0.0 ? 0.0 : 0.5 * log2(saSample / saTexel);

                prefilteredColor += ref.sample(cubeSampler, L, level(mipLevel)).rgb * NdotL;
                totalWeight += NdotL;
            }
        }

        prefilteredColor = prefilteredColor / totalWeight;
        tex[face].write(float4(prefilteredColor, 1.0), gid);
    }
}
