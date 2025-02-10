//
//  SettingsView.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Settings")
                .font(.customFont(font: .konkhmer, style: .regular, size: 32))
                .padding(.horizontal, 20)
                .padding(.top, 12)
            
            VStack(spacing: 14) {
                ForEach(viewModel.settingsItems, id: \.self) { item in
                    Button {
                        viewModel.handleSelection(item)
                    } label: {
                        HStack(spacing: 12) {
                            Text(item.rawValue)
                                .font(.customFont(font: .konkhmer, style: .regular, size: 16))
                                .padding(.vertical, 14)
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .padding(.vertical, 13)
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal, 16)
                        .background(.lightPurple)
                        .cornerRadius(20)
                        .padding(.horizontal, 16)
                    }
                }
            }
            .padding(.top, 12)
            
            Spacer()
        }
        .background(
            LinearGradient(
                colors: [.paleGray, .lightGreen],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel())
    }
}
