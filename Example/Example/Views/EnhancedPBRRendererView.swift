//
//  EnhancedPBRRendererView.swift
//  Example
//
//  Created by Reza Ali on 8/12/22.
//  Copyright © 2022 Hi-Rez. All rights reserved.
//

import Forge
import SwiftUI

struct EnhancedPBRRendererView: View {
    var body: some View {
        ForgeView(renderer: EnhancedPBRRenderer())
            .ignoresSafeArea()
            .navigationTitle("Enhanced PBR")
    }
}

struct EnhancedPBRRendererView_Previews: PreviewProvider {
    static var previews: some View {
        EnhancedPBRRendererView()
    }
}
