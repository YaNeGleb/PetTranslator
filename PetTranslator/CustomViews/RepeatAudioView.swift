//
//  RepeatAudioView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 10.02.2025.
//

import SwiftUI

struct RepeatAudioView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image("rotateRight")
                
                Text("Repeat")
                    .foregroundStyle(.black)
                    .font(.customFont(font: .konkhmer, style: .regular, size: 12))
            }
            .padding(.vertical, 16)
        }
        .frame(maxWidth: .infinity)
        .background(.lightPurple)
        .cornerRadius(16)
        .padding(.horizontal, 50)
        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 5)
    }
}

#Preview {
    RepeatAudioView()
}
