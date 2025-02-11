//
//  PetImage.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 11.02.2025.
//

import SwiftUI

struct PetImage: View {
    let selectedPet: PetType
    
    var body: some View {
        Image(selectedPet == .dog ? "largeDogImage" : "largeCatImage")
    }
}
