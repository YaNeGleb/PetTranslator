//
//  SpeechRecordingView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import SwiftUI
import Lottie

struct SpeechRecordingView: View {
    let state: TranslationState
    
    private let animationName = "speakingAnimation"
    private let buttonTextNotStarted = "Start Speak"
    private let buttonTextStarted = "Recording..."
    
    var body: some View {
        VStack(spacing: 24) {
            lottieView
            textLabel
        }
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
    
    @ViewBuilder
    private var lottieView: some View {
        if state == .idle {
            Image("microphone")
             .padding(.top, 44)
             .padding(.horizontal, 54)
        } else {
            LottieView(animation: .named(animationName))
                .playing(loopMode: .autoReverse)
                .resizable()
                .frame(width: 163, height: 95)
                .padding(.top, 19)
                .padding(.horizontal, 7.5)
        }
    }
    
    private var textLabel: some View {
        Text(state == .idle ? buttonTextNotStarted : buttonTextStarted)
            .font(.customFont(font: .konkhmer, style: .regular, size: 16))
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
    }
}

struct SpeechRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechRecordingView(state: .translating)
    }
}


