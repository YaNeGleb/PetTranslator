//
//  TabItem.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 10.02.2025.
//

import Foundation

enum TabItem: CaseIterable {
    case translator, clicker

    var title: String {
        switch self {
        case .translator: return "Translator"
        case .clicker: return "Clicker"
        }
    }

    var icon: String {
        switch self {
        case .translator: return "messages"
        case .clicker: return "gear"
        }
    }
}
