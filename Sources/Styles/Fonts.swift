//
//  Fonts.swift
//  Mindie
//
//  Created by Benjamin Sage on 2/21/23.
//

import SwiftUI

extension Font {
    static let logo = Font.custom(.zapf, size: 30)
    static let opening = Font.custom(.zapf, size: 40)
    
    static let xs = lab(11)
    static let small = lab(14)
    static let medium = lab(16)
    static let large = lab(18)
    static let xl = lab(20)
    static let xxl = lab(43)
    
    static func lab(_ size: CGFloat) -> Font {
        Font.custom(.lab, size: size)
    }
    
    static func zapf(_ size: CGFloat) -> Font {
        Font.custom(.zapf, size: size)
    }
}

extension UIFont {
    static let number = UIFont(name: "Lab Grotesque", size: 43)
    static let phoneNumber = UIFont(name: "Lab Grotesque", size: 20)
}

extension String {
    static let satoshi = "Satoshi"
    static let zapf = "Zapf Humanist 601"
    static let lab = "Lab Grotesque"
}

// MARK: - Font registration

extension UIFont {
    // This static block ensures that the registration happens only once
    private static let _fontRegistration: Void = {
        registerCustomFonts()
    }()
    
    // Call this function to trigger the static initializer
    static func ensureCustomFontsAreRegistered() {
        _ = _fontRegistration
    }
    
    static func registerCustomFonts() {
        guard let fontURLs = Bundle.module.urls(forResourcesWithExtension: "ttf", subdirectory: "Fonts") else {
            print("Failed to find font URLs")
            return
        }

        for url in fontURLs {
            registerFont(with: url)
        }
    }
    
    private static func registerFont(with url: URL) {
        guard let data = try? Data(contentsOf: url),
              let provider = CGDataProvider(data: data as CFData),
              let font = CGFont(provider) else {
            print("Failed to register font at URL: \(url)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Error registering font: \(String(describing: error?.takeRetainedValue()))")
        }
    }
}
