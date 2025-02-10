//
//  ModuleBuilder.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 09.02.2025.
//

import SwiftUI

struct ModuleBuilder {
    static func createTranslatorScreen() -> TranslatorView {
        let viewModel = TranslatorViewModel()
        let view = TranslatorView(viewModel: viewModel)
        return view
    }
    
    static func createClickerScreen() -> SettingsView {
        let viewModel = SettingsViewModel()
        let view = SettingsView(viewModel: viewModel)
        return view
    }
}
