//
//  ProgressTranslationView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 11.02.2025.
//

import SwiftUI

struct ProgressTranslationView: View {
    @ObservedObject var viewModel: TranslatorViewModel

    var body: some View {
        VStack(spacing: 0) {
            Text("Process of translation...")
                .font(.customFont(font: .konkhmer, style: .regular, size: 16))
                .padding(.top, 343)
                .padding(.horizontal, 40)
            PetImage(selectedPet: viewModel.selectedPet)
                .padding(.top, 63)
        }
    }
}
