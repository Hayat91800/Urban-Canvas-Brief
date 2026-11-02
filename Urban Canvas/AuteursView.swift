//
//  AuteursView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 26/06/2026.
//
//  V4.2 : répertoire des auteur·ices sous forme de cartes
//  (nom, âge, origines, type d'art de prédilection, photo ou placeholder).
//

import SwiftUI

struct AuteursView: View {

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Artiste.artiste) { auteur in
                        CarteAuteur(auteur: auteur)
                    }
                }
                .padding()
            }
            .background(Color.backgroundGray)
            .navigationTitle("Auteur·ices")
        }
    }
}

struct CarteAuteur: View {
    let auteur: Artiste

    var body: some View {
        VStack(spacing: 8) {
            // Photo de profil, ou image de substitution si absente
            Group {
                if let image = auteur.image {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.mainOrange.opacity(0.5))
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .padding(.top)

            Text(auteur.nom)
                .font(.headline)
                .foregroundStyle(.mainOrange)
                .multilineTextAlignment(.center)
                .lineLimit(2)

            VStack(alignment: .leading, spacing: 4) {
                Label(auteur.age, systemImage: "birthday.cake")
                Label(auteur.origines, systemImage: "globe.europe.africa")
                Label(auteur.style, systemImage: "paintbrush")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal, .bottom])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 22))
    }
}

#Preview {
    AuteursView()
}
