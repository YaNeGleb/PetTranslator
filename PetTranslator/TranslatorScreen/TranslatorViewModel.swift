//
//  TranslatorViewModel.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import Foundation
import SwiftUI

class TranslatorViewModel: ObservableObject {
    @Published var translationState: TranslationState = .idle
    @Published var translationResult: TranslationResult?
    @Published var isTranslatingToPet: Bool = true
    @Published var selectedPet: PetType = .dog
    @Published var isResultViewVisible: Bool = false
    @Published var isMicrophoneAlertVisible: Bool = false
    
    // MARK: - Public Methods
    
    func toggleTranslationDirection() {
        isTranslatingToPet.toggle()
    }
    
    func startTranslationIfPermissionGranted() async {
        guard await hasMicrophoneAccess() else {
            await showMicrophonePermissionAlert()
            return
        }
        await beginRecording()
    }
    
    func selectPet(_ pet: PetType) {
        selectedPet = pet
    }
    
    func settingsButtonTapped() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Private Methods
    
    private func hasMicrophoneAccess() async -> Bool {
        await AudioPermissionManager.shared.requestMicrophoneAccess()
    }
    
    private func beginRecording() async {
        guard translationState == .idle else { return }
        await updateTranslationState(.recording)
        
        // Simulate requests
        try? await Task.sleep(for: .seconds(2))
        
        await startTranslationProcess()
    }
    
    private func startTranslationProcess() async {
        await updateTranslationState(.translating)
        
        // Simulate requests
        try? await Task.sleep(for: .seconds(2))
        
        await generateTranslationResult()
    }
    
    private func generateTranslationResult() async {
        if isTranslatingToPet {
            // Simulate showing a translated audio result
            await showTranslationResult(audio: URL(fileURLWithPath: "someTranslatedAudioFile"))
        } else {
            // Array of possible translated text options
            let translations = [
                "I’m hungry, feed me!",
                "What are you doing, human?"
            ]
            
            // Randomly select one translation
            let randomTranslation = translations.randomElement() ?? "Default translation"

            await showTranslationResult(text: randomTranslation)
        }
        
        await updateTranslationState(.idle)
    }
    
    // MARK: - UI Updates
    
    @MainActor
    private func showMicrophonePermissionAlert() {
        isMicrophoneAlertVisible = true
    }
    
    @MainActor
    private func updateTranslationState(_ newState: TranslationState) {
        translationState = newState
    }
    
    @MainActor
    private func showTranslationResult(text: String? = nil, audio: URL? = nil) {
        if let text = text {
            translationResult = .text(text)
        }
        if let audio = audio {
            translationResult = .audio(audio)
        }
        isResultViewVisible.toggle()
    }
}
