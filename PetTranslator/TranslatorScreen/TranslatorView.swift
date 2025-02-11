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
                IdleView(viewModel: viewModel)
            case .translating:
                ProgressTranslationView(viewModel: viewModel)
            }
            Spacer()
        }
        .animation(.easeInOut(duration: 0.3), value: viewModel.translationState)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(colors: [.paleGray, .lightGreen],
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .fullScreenCover(isPresented: $viewModel.isResultViewVisible) {
            ResultView(selectedPet: viewModel.selectedPet,
                       result: viewModel.translationResult)
        }
        .alert("Enable Microphone Access", isPresented: $viewModel.isMicrophoneAlertVisible) {
            Button("Settings") {
                viewModel.settingsButtonTapped()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please allow access to your microphone to use the app's features")
        }
    }
}

struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView(viewModel: TranslatorViewModel())
    }
}

