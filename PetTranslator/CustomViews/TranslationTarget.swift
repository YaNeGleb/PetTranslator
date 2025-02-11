//
//  TranslationTarget.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 11.02.2025.
//

import SwiftUI

struct TranslationTarget: View {
    let isTranslatingToPet: Bool

    var body: some View {
        Text(isTranslatingToPet ? "HUMAN" : "PET")
            .font(.customFont(font: .konkhmer, style: .regular, size: 16))
            .lineLimit(1)
            .minimumScaleFactor(0.01)
            .padding(.vertical, 16)
    }
}
