//
//  PetSelectionView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 11.02.2025.
//

import SwiftUI

struct PetSelectionView: View {
    let selectedPet: PetType
    let onSelect: (PetType) -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(PetType.allCases, id: \.self) { pet in
                Button {
                    onSelect(pet)
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(pet == .cat ? .skyBlue : .buttermilkYellow)
                        .frame(width: 70, height: 70)
                        .padding(.horizontal, 18.5)
                        .overlay(Image(pet == .cat ? "smallCatImage" : "smallDogImage"))
                        .opacity(selectedPet == pet ? 1.0 : 0.5)
                }
            }
        }
        .padding(.vertical, 12)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
