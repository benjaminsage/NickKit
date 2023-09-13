//
//  Fonts.swift
//  Mindie
//
//  Created by Benjamin Sage on 2/21/23.
//

import SwiftUI

extension Font {
    public static let xs = lab(11)
    public static let small = lab(14)
    public static let medium = lab(16)
    public static let large = lab(18)
    public static let xl = lab(20)
    public static let xxl = lab(43)
    
    public static let logo = custom(.zapf, size: 30)
    public static let opening = custom(.zapf, size: 40)
    
    public static func lab(_ size: CGFloat) -> Font {
        custom(.lab, size: size)
    }
    public static func zapf(_ size: CGFloat) -> Font {
        custom(.zapf, size: size)
    }
}

extension UIFont {
    static let number = UIFont(name: .lab, size: 43)
    static let phoneNumber = UIFont(name: .lab, size: 20)
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
    public static func ensureCustomFontsAreRegistered() {
        _ = _fontRegistration
    }
    
    private static func registerCustomFonts() {
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
