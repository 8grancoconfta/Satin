//
//  Defines.swift
//  Satin
//
//  Created by Reza Ali on 7/23/19.
//  Copyright © 2022 Reza Ali. All rights reserved.
//

import simd

public let maxBuffersInFlight = 3

public let worldForwardDirection = simd_make_float3(0, 0, 1)
public let worldUpDirection = simd_make_float3(0, 1, 0)
public let worldRightDirection = simd_make_float3(1, 0, 0)

public enum Blending: Codable {
    case disabled
    case alpha
    case additive
    case subtract
    case custom
}

public enum LightType: Int {
    case directional = 0
    case point = 1
    case spot = 2
}

public enum VertexAttribute: Int, CaseIterable {
    case Position = 0
    case Normal = 1
    case Texcoord = 2
    case Tangent = 3
    case Bitangent = 4
    case Color = 5
    case Custom0 = 6
    case Custom1 = 7
    case Custom2 = 8
    case Custom3 = 9
    case Custom4 = 10
    case Custom5 = 11
    case Custom6 = 12
    case Custom7 = 13
    case Custom8 = 14
    case Custom9 = 15
    case Custom10 = 16
    case Custom11 = 17

    public var description: String {
        return String(describing: self)
    }

    public var name: String {
        switch self {
        case .Position:
            return "position"
        case .Normal:
            return "normal"
        case .Texcoord:
            return "uv"
        case .Tangent:
            return "tangent"
        case .Bitangent:
            return "bitangent"
        case .Color:
            return "color"
        case .Custom0:
            return "custom0"
        case .Custom1:
            return "custom1"
        case .Custom2:
            return "custom2"
        case .Custom3:
            return "custom3"
        case .Custom4:
            return "custom4"
        case .Custom5:
            return "custom5"
        case .Custom6:
            return "custom6"
        case .Custom7:
            return "custom7"
        case .Custom8:
            return "custom8"
        case .Custom9:
            return "custom9"
        case .Custom10:
            return "custom10"
        case .Custom11:
            return "custom11"
        }
    }

    public var shaderDefine: String {
        switch self {
        case .Position:
            return "HAS_POSITION"
        case .Normal:
            return "HAS_NORMAL"
        case .Texcoord:
            return "HAS_UV"
        case .Tangent:
            return "HAS_TANGENT"
        case .Bitangent:
            return "HAS_BITANGENT"
        case .Color:
            return "HAS_COLOR"
        case .Custom0:
            return "HAS_CUSTOM0"
        case .Custom1:
            return "HAS_CUSTOM1"
        case .Custom2:
            return "HAS_CUSTOM2"
        case .Custom3:
            return "HAS_CUSTOM3"
        case .Custom4:
            return "HAS_CUSTOM4"
        case .Custom5:
            return "HAS_CUSTOM5"
        case .Custom6:
            return "HAS_CUSTOM6"
        case .Custom7:
            return "HAS_CUSTOM7"
        case .Custom8:
            return "HAS_CUSTOM8"
        case .Custom9:
            return "HAS_CUSTOM9"
        case .Custom10:
            return "HAS_CUSTOM10"
        case .Custom11:
            return "HAS_CUSTOM11"
        }
    }
}

public enum VertexBufferIndex: Int {
    case Vertices = 0
    case Generics = 1
    case VertexUniforms = 2
    case InstanceMatrixUniforms = 3
    case MaterialUniforms = 4
    case ShadowMatrices = 5
    case Custom0 = 6
    case Custom1 = 7
    case Custom2 = 8
    case Custom3 = 9
    case Custom4 = 10
    case Custom5 = 11
    case Custom6 = 12
    case Custom7 = 13
    case Custom8 = 14
    case Custom9 = 15
    case Custom10 = 16
}

public enum VertexTextureIndex: Int {
    case Custom0 = 0
    case Custom1 = 1
    case Custom2 = 2
    case Custom3 = 3
    case Custom4 = 4
    case Custom5 = 5
    case Custom6 = 6
    case Custom7 = 7
    case Custom8 = 8
    case Custom9 = 9
    case Custom10 = 10
}

public enum FragmentConstantIndex: Int {
    case Custom0 = 0
}

public enum FragmentBufferIndex: Int {
    case MaterialUniforms = 0
    case Lighting = 1
    case Shadows = 2
    case Custom0 = 3
    case Custom1 = 4
    case Custom2 = 5
    case Custom3 = 6
    case Custom4 = 7
    case Custom5 = 8
    case Custom6 = 9
    case Custom7 = 10
    case Custom8 = 11
    case Custom9 = 12
    case Custom10 = 13
}

public enum FragmentTextureIndex: Int {
    case Custom0 = 0
    case Custom1 = 1
    case Custom2 = 2
    case Custom3 = 3
    case Custom4 = 4
    case Custom5 = 5
    case Custom6 = 6
    case Custom7 = 7
    case Custom8 = 8
    case Custom9 = 9
    case Custom10 = 10
    case Shadow0 = 17
    case Shadow1 = 18
    case Shadow2 = 19
    case Shadow3 = 20
    case Shadow4 = 21
    case Shadow5 = 22
    case Shadow6 = 23
    case Shadow7 = 24
}

public enum PBRTexture: Int {
    case baseColor = 0
    case metallic = 1
    case roughness = 2
    case normal = 3
    case emissive = 4
    case specular = 5
    case sheen = 6
    case anisotropy = 7
    case anisotropyAngle = 8
    case bump = 9
    case displacement = 10
    case alpha = 11
    case transmission = 12
    case ambientOcculsion = 13
    case reflection = 14
    case irradiance = 15
    case brdf = 16

    public var shaderDefine: String {
        switch self {
        case .baseColor:
            return "BASE_COLOR_MAP"
        case .metallic:
            return "METALLIC_MAP"
        case .roughness:
            return "ROUGHNESS_MAP"
        case .normal:
            return "NORMAL_MAP"
        case .emissive:
            return "EMISSIVE_MAP"
        case .specular:
            return "SPECULAR_MAP"
        case .sheen:
            return "SHEEN_MAP"
        case .anisotropy:
            return "ANISOTROPY_MAP"
        case .anisotropyAngle:
            return "ANISOTROPY_ANGLE_MAP"
        case .bump:
            return "BUMP_MAP"
        case .displacement:
            return "DISPLACEMENT_MAP"
        case .alpha:
            return "ALPHA_MAP"
        case .transmission:
            return "TRANSMISSION_MAP"
        case .ambientOcculsion:
            return "AMBIENT_OCCULSION_MAP"
        case .reflection:
            return "REFLECTION_MAP"
        case .irradiance:
            return "IRRADIANCE_MAP"
        case .brdf:
            return "BRDF_MAP"
        }
    }

    public var textureType: String {
        switch self {
        case .irradiance, .reflection:
            return "texturecube"
        default:
            return "texture2d"
        }
    }

    public var textureName: String {
        switch self {
        case .baseColor:
            return "baseColorMap"
        case .metallic:
            return "metallicMap"
        case .roughness:
            return "roughnessMap"
        case .normal:
            return "normalMap"
        case .emissive:
            return "emissiveMap"
        case .specular:
            return "specularMap"
        case .sheen:
            return "sheenMap"
        case .anisotropy:
            return "anisotropyMap"
        case .anisotropyAngle:
            return "anisotropyAngleMap"
        case .bump:
            return "bumpMap"
        case .displacement:
            return "displacementMap"
        case .alpha:
            return "alphaMap"
        case .transmission:
            return "transmissionMap"
        case .ambientOcculsion:
            return "ambientOcclusionMap"
        case .reflection:
            return "reflectionMap"
        case .irradiance:
            return "irradianceMap"
        case .brdf:
            return "brdfMap"
        }
    }

    public var textureIndex: String {
        switch self {
        case .baseColor:
            return "PBRTextureBaseColor"
        case .metallic:
            return "PBRTextureMetallic"
        case .roughness:
            return "PBRTextureRoughness"
        case .normal:
            return "PBRTextureNormal"
        case .emissive:
            return "PBRTextureEmissive"
        case .specular:
            return "PBRTextureSpecular"
        case .sheen:
            return "PBRTextureSheen"
        case .anisotropy:
            return "PBRTextureAnisotropy"
        case .anisotropyAngle:
            return "PBRTextureAnisotropyAngle"
        case .bump:
            return "PBRTextureBump"
        case .displacement:
            return "PBRTextureDisplacement"
        case .alpha:
            return "PBRTextureAlpha"
        case .transmission:
            return "PBRTextureTransmission"
        case .ambientOcculsion:
            return "PBRTextureAmbientOcculsion"
        case .reflection:
            return "PBRTextureReflection"
        case .irradiance:
            return "PBRTextureIrradiance"
        case .brdf:
            return "PBRTextureBRDF"
        }
    }
}

public enum FragmentSamplerIndex: Int {
    case Custom0 = 0
    case Custom1 = 1
    case Custom2 = 2
    case Custom3 = 3
    case Custom4 = 4
    case Custom5 = 5
    case Custom6 = 6
    case Custom7 = 7
    case Custom8 = 8
    case Custom9 = 9
    case Custom10 = 10
}

public enum ComputeBufferIndex: Int {
    case Uniforms = 0
    case Custom0 = 1
    case Custom1 = 2
    case Custom2 = 3
    case Custom3 = 4
    case Custom4 = 5
    case Custom5 = 6
    case Custom6 = 7
    case Custom7 = 8
    case Custom8 = 9
    case Custom9 = 10
    case Custom10 = 11
}

public enum ComputeTextureIndex: Int {
    case Custom0 = 0
    case Custom1 = 1
    case Custom2 = 2
    case Custom3 = 3
    case Custom4 = 4
    case Custom5 = 5
    case Custom6 = 6
    case Custom7 = 7
    case Custom8 = 8
    case Custom9 = 9
    case Custom10 = 10
}
