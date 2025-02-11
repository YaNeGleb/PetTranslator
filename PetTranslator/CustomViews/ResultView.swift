//
//  ResultView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    let selectedPet: PetType
    let result: TranslationResult?
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.dismiss()
                } label: {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                        
                        Image("close")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
                Text("Result")
                    .font(.customFont(font: .konkhmer, style: .regular, size: 32))
                Spacer()
                
                Circle()
                    .fill(.clear)
                    .frame(width: 48, height: 48)
            }
            .padding(.top, 12)
            .padding(.horizontal, 20)
            
            switch result {
            case .audio(_):
                RepeatAudioView()
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 5)
                    .padding(.top, 179)
                
            case .text(let translatedText):
                SpeechBubbleView(text: translatedText)
                    .padding(.top, 91)
                    .padding(.horizontal, 50)
                
            case .none:
                EmptyView()
            }
            
            Image(selectedPet == .dog ? "largeDogImage" : "largeCatImage")
                .padding(.top, 125)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [.paleGray, .lightGreen],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

