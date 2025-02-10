//
//  RootView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel: RootViewModel

    var body: some View {
        VStack {
            switch viewModel.selectedTab {
            case .translator:
                ModuleBuilder.createTranslatorScreen()
            case .clicker:
                ModuleBuilder.createClickerScreen()
            }
            
            Spacer()
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .overlay(alignment: .bottom) {
            CustomTabBar(selectedTab: $viewModel.selectedTab, tabScreens: viewModel.tabScreens)
        }
    }
}

#Preview {
    RootView(viewModel: RootViewModel())
}
