//
//  Font + Extensions.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 09.02.2025.
//

import SwiftUI

extension Font {
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CGFloat) -> Font {
            
            let fontName: String = font.rawValue + style.rawValue
            
            return Font.custom(fontName, size: size)
        }
}
