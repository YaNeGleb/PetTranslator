//
//  RootViewModel.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import Foundation

class RootViewModel: ObservableObject {
    @Published var selectedTab: TabItem = .translator
    let tabScreens: [TabItem] = [.translator, .clicker]
}

