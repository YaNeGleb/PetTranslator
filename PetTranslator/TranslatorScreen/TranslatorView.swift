//
//  TranslatorView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    @StateObject var viewModel: TranslatorViewModel

    var body: some View {
        VStack {
            switch viewModel.translationState {
            case .idle, .recording:
                VStack(spacing: 12) {
                    Text("Translator")
                        .font(.customFont(font: .konkhmer, style: .regular, size: 32))
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                    HStack {
                        TranslationLabel(isTranslatingToPet: viewModel.isTranslatingToPet)
                            .frame(maxWidth: .infinity)
                        
                        Button {
                            viewModel.toggleTranslationDirection()
                        } label: {
                            Image("arrowSwapHorizontal")
                        }
                        
                        TranslationLabel(isTranslatingToPet: !viewModel.isTranslatingToPet)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 40)
                }
                
                HStack(spacing: 35) {
                    Button {
                        Task { await viewModel.startTranslationIfPermissionGranted() }
                    } label: {
                        SpeechRecordingView(state: viewModel.translationState)
                    }
                    .foregroundStyle(.black)

                    PetSelectionView(selectedPet: viewModel.selectedPet, onSelect: viewModel.selectPet)
                }
                .padding(.top, 58)
                .padding(.horizontal, 35)
                
                
                PetImage(selectedPet: viewModel.selectedPet)
                    .padding(.top, 51)
                
            case .translating:
                VStack {
                    Text("Process of translation...")
                        .font(.customFont(font: .konkhmer, style: .regular, size: 16))
                        .padding(.top, 343)
                        .padding(.horizontal, 40)
                    PetImage(selectedPet: viewModel.selectedPet)
                        .padding(.top, 63)
                }
            }
            Spacer()
        }
        .animation(.easeInOut(duration: 0.3), value: viewModel.translationState)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [.paleGray, .lightGreen],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .fullScreenCover(isPresented: $viewModel.isResultViewVisible) {
            ResultView(selectedPet: viewModel.selectedPet, result: viewModel.translationResult)
        }
        .alert("Enable Microphone Access", isPresented: $viewModel.isMicrophoneAlertVisible) {
            Button("Settings") { viewModel.settingsButtonTapped() }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please allow access to your microphone to use the app's features")
        }
    }
}

// MARK: - Pet Selection
private struct PetSelectionView: View {
    let selectedPet: PetType
    let onSelect: (PetType) -> Void

    var body: some View {
        VStack(spacing: 12) {
            ForEach(PetType.allCases, id: \.self) { pet in
                Button { onSelect(pet) } label: {
                    PetSelectionButton(pet: pet, isSelected: selectedPet == pet)
                }
            }
        }
        .padding(.vertical, 12)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

// MARK: - Pet Image
private struct PetImage: View {
    let selectedPet: PetType

    var body: some View {
        Image(selectedPet == .dog ? "largeDogImage" : "largeCatImage")
    }
}

// MARK: - Reusable Components
private struct PetSelectionButton: View {
    let pet: PetType
    let isSelected: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(pet == .cat ? .skyBlue : .buttermilkYellow)
            .frame(width: 70, height: 70)
            .padding(.horizontal, 18.5)
            .overlay(Image(pet == .cat ? "smallCatImage" : "smallDogImage"))
            .opacity(isSelected ? 1.0 : 0.5)
    }
}

private struct TranslationLabel: View {
    let isTranslatingToPet: Bool

    var body: some View {
        Text(isTranslatingToPet ? "HUMAN" : "PET")
            .font(.customFont(font: .konkhmer, style: .regular, size: 16))
            .lineLimit(1)
            .minimumScaleFactor(0.01)
            .padding(.vertical, 16)
    }
}

struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView(viewModel: TranslatorViewModel())
    }
}
