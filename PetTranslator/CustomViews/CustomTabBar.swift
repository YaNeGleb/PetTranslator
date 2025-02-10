//
//  CustomTabBar.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 06.02.2025.
//

import SwiftUI
import Lottie

struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    let tabScreens: [TabItem]

    var body: some View {
        HStack(spacing: 42) {
            ForEach(TabItem.allCases, id: \.self) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab)
            }
        }
        .padding(.vertical, 19)
        .padding(.horizontal, 24)
        .background(.white)
        .cornerRadius(16)
    }
}

struct TabButton: View {
    let tab: TabItem
    @Binding var selectedTab: TabItem

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = tab
            }
        }) {
            VStack(spacing: 4) {
                Image(tab.icon)
                    .opacity(selectedTab == tab ? 1 : 0.5)
                Text(tab.title)
                    .font(.customFont(font: .konkhmer, style: .regular, size: 12))
                    .foregroundColor(selectedTab == tab ? .black : .gray)
            }
        }
    }
}


