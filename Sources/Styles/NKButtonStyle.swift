//
//  File.swift
//  
//
//  Created by Benjamin Sage on 9/12/23.
//

import SwiftUI

struct NKButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var enabled
    
    @Binding var loading: Bool
    var foreground: Color
    var background: Color
    var spaced1: Bool
    var spaced2: Bool
    var height: CGFloat
    var font: Font
    
    init(
        loading: Binding<Bool> = .constant(false),
        foreground: Color = .primary,
        background: Color = .white,
        spaced1: Bool = true,
        spaced2: Bool = true,
        height: CGFloat = 48,
        font: Font = .large
    ) {
        self._loading = loading
        self.foreground = foreground
        self.background = background
        self.spaced1 = spaced1
        self.spaced2 = spaced2
        self.height = height
        self.font = font
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if spaced1 { Spacer() }
            configuration.label
                .font(font)
                .foregroundColor(!enabled ? .mediumGray : foreground)
                .offset(y: -1)
                .opacity(loading ? 0 : 1)
                .overlay {
                    if loading {
                        LoadingView()
                    }
                }
            if spaced2 { Spacer() }
        }
        .onChange(of: configuration.isPressed) { newValue in
            if newValue {
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
        }
        .frame(height: height)
        .background(!enabled ? .lightGray : background)
        .clipShape(Capsule())
        .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
        .animation(.easeOut(duration: 1/10), value: configuration.isPressed)
        .allowsHitTesting(loading ? false : true)
    }
}