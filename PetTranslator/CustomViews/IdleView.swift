//
//  IdleView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 11.02.2025.
//

import SwiftUI

struct IdleView: View {
    @ObservedObject var viewModel: TranslatorViewModel

    var body: some View {
        VStack(spacing: 0) {
                Text("Translator")
                    .font(.customFont(font: .konkhmer, style: .regular, size: 32))
                    .padding(.top, 12)
                    .padding(.horizontal, 20)
                
                HStack {
                    TranslationTarget(isTranslatingToPet: viewModel.isTranslatingToPet)
                        .frame(maxWidth: .infinity)

                    Button(action: viewModel.toggleTranslationDirection) {
                        Image("arrowSwapHorizontal")
                    }

                    TranslationTarget(isTranslatingToPet: !viewModel.isTranslatingToPet)
                        .frame(maxWidth: .infinity)
                }
                .padding(.top, 12)
                .padding(.horizontal, 40)
            
            HStack(spacing: 35) {
                Button {
                    Task {
                        await viewModel.startTranslationIfPermissionGranted()
                    }
                } label: {
                    RecordingIndicatorView(state: viewModel.translationState)
                }
                .foregroundStyle(.black)

                PetSelectionView(selectedPet: viewModel.selectedPet, onSelect: viewModel.selectPet)
            }
            .padding(.top, 58)
            .padding(.horizontal, 35)

            PetImage(selectedPet: viewModel.selectedPet)
                .padding(.top, 51)
        }
    }
}
