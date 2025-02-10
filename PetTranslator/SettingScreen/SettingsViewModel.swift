//
//  SettingsViewModel.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var settingsItems: [SettingsOption] = SettingsOption.allCases
    
    func handleSelection(_ option: SettingsOption) {
        switch option {
        case .rateUs:
            // Open App Store review page
            break
        case .shareApp:
            // Share app link
            break
        case .contactUs:
            // Open contact form or email
            break
        case .restorePurchases:
            // Restore in-app purchases
            break
        case .privacyPolicy:
            // Open privacy policy URL
            break
        case .termsOfUse:
            // Open terms of use URL
            break
        }
    }
}
