//
//  CapsuleButtonStyle.swift
//
//
//  Created by Benjamin Sage on 9/12/23.
//

import SwiftUI

public struct CapsuleButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var enabled
    
    @Binding var loading: Bool
    
    var foreground: Color
    var background: Color
    var leading: CGFloat?
    var trailing: CGFloat?
    var height: CGFloat
    var width: CGFloat?
    var font: Font?
    
    public init(
        loading: Binding<Bool> = .constant(false),
        foreground: Color = .primary,
        background: Color = .white,
        leading: CGFloat? = .infinity,
        trailing: CGFloat? = .infinity,
        height: CGFloat = 48,
        width: CGFloat? = nil,
        font: Font? = nil
    ) {
        self._loading = loading
        self.foreground = foreground
        self.background = background
        self.leading = leading
        self.trailing = trailing
        self.height = height
        self.width = width
        self.font = font
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
                .frame(width: leading)
            
            configuration.label
                .font(font)
                .foregroundColor(!enabled ? .darkGray : foreground)
                .offset(y: -1)
                .opacity(loading ? 0 : 1)
                .overlay {
                    if loading {
                        LoadingView()
                    }
                }
            
            Spacer()
                .frame(width: trailing)
        }
        .onChange(of: configuration.isPressed) { newValue in
            if newValue {
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
        }
        .frame(width: width, height: height)
        .background(!enabled ? .lightGray : background)
        .clipShape(Capsule())
        .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
        .animation(.easeOut(duration: 1/10), value: configuration.isPressed)
        .allowsHitTesting(loading ? false : true)
    }
}
