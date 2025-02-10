//
//  SpeechBubbleView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 10.02.2025.
//

import SwiftUI

struct SpeechBubbleView: View {
    let text: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                Text(text)
                    .font(.customFont(font: .konkhmer, style: .regular, size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: 142)
            .background(.lightPurple)
            .containerShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
            
            Triangle()
                .fill(.lightPurple)
                .frame(width: 13, height: 140)
                .rotationEffect(.degrees(30))
                .offset(x: -60, y: 120)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -2, y: 15)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    SpeechBubbleView(text: "Test Text")
        .padding(.horizontal, 50)
}
