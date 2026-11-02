//
//  ContentView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 23/06/2026.
//
//  V4.1 : navigation principale par onglets (TabView).
//

import SwiftUI

struct ContentView: View {

    @Binding var showWelcome: Bool

    var body: some View {
        TabView {
            // 1er onglet : exploration des œuvres (Liste / Carte)
            PickerView()
                .tabItem { Label("Œuvres", systemImage: "photo.artframe") }

            // 2e onglet : répertoire des auteur·ices
            AuteursView()
                .tabItem { Label("Auteur·ices", systemImage: "person.2.fill") }

            // V5 : mode Mission
            MissionView()
                .tabItem { Label("Mission", systemImage: "dot.scope") }
        }
        .tint(.mainOrange)
    }
}

#Preview {
    ContentView(showWelcome: .constant(true))
}
