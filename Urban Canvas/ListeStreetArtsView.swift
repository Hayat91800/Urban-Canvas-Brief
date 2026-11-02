//
//  ListeStreetArtsView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 22/06/2026.
//
//  V1.1 : liste verticale des œuvres (nom, image miniature, lieu).
//

import SwiftUI

struct Liste_Street_arts: View {

    let lieux: [Lieu]

    var body: some View {
        List {
            ForEach(lieux) { lieu in
                NavigationLink(value: lieu) {
                    HStack(spacing: 12) {

                        Image(lieu.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {

                            Text(lieu.nom)
                                .font(.headline)

                            HStack(spacing: 4) {
                                Image(systemName: "mappin.circle.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(.mainOrange)

                                Text(lieu.ville)
                                    .foregroundStyle(.secondText)
                            }

                            Text(lieu.type)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .alignmentGuide(.listRowSeparatorLeading) { _ in
                    return 0 // Aligne le séparateur sur le bord avant
                }
            }
        }
        .overlay {
            if lieux.isEmpty {
                ContentUnavailableView("Aucune œuvre", systemImage: "paintbrush", description: Text("Aucune œuvre pour ce type d'art."))
            }
        }
    }
}

#Preview {
    NavigationStack {
        Liste_Street_arts(lieux: Lieu.streetArts)
            .navigationDestination(for: Lieu.self) { DetailsView(lieu: $0) }
    }
}
