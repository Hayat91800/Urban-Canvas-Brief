//
//  WelcomeView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 23/06/2026.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var showWelcome: Bool
    
    var body: some View {
        
        TabView {
    
            PickerView()
                .tabItem { Label("Oeuvres", systemImage: "photo.artframe")}
            
            AuteursView()
                .tabItem { Label("Auteurs", systemImage: "person.circle")}
            
            MissionView()
                .tabItem {Label("Mission", systemImage: "dot.scope")}

        }
        .background(.backgroundGray)
       
    }
}

#Preview {
    ContentView(showWelcome: .constant(true))
}

