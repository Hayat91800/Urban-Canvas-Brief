//
//  Auteurs`View.swift
//  Urban Canvas
//
//  Created by apprenant144 on 26/06/2026.
//

import SwiftUI

struct AuteursView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            
            LazyVGrid(columns: columns, spacing: 18) {
                
                ForEach(Artiste.artiste) {auteur in
                    
                    VStack(spacing: 4) {
                        Image(auteur.image)
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .padding()
                        
                        Text(auteur.nom)
                            .font(.headline)
                            .foregroundStyle(.mainOrange)
                            
                        
                        Text("""
                        **Age:** \(auteur.age)
                        **Orgines:** \(auteur.origines)
                        **Style:** \(auteur.style)
                        """)
                        .multilineTextAlignment(.center)
                        .padding()
                        
                        Button("Site web") {
                            
                        }.buttonStyle(.borderedProminent)
                            .tint(.mainOrange)
                            .controlSize(.regular)
                            .padding()
                            
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(22)
            }
            .padding()
        }
        .background(.backgroundGray)
    }
}

#Preview {
    AuteursView()
}



