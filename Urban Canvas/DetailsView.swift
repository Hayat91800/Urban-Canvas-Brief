//
//  DetailsView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 22/06/2026.
//
//  V1.2 : vue détaillée (titre, description longue, image pleine largeur, type d'art,
//  conditions de conservation, date, auteur·ice et localisation texte).
//

import SwiftUI
import MapKit

struct DetailsView: View {

    let lieu: Lieu

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                // Image pleine largeur
                Image(lieu.image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .clipped()

                VStack(alignment: .leading, spacing: 16) {
                    Text(lieu.nom)
                        .font(.title.bold())
                        .foregroundStyle(.mainOrange)

                    Text(lieu.details)
                        .font(.body)

                    VStack(alignment: .leading, spacing: 10) {
                        InfoLigne(icone: "paintbrush.fill", titre: "Type d'art", valeur: lieu.type)
                        InfoLigne(icone: "shield.lefthalf.filled", titre: "Conservation", valeur: lieu.condition)
                        InfoLigne(icone: "calendar", titre: "Date", valeur: lieu.date)
                        InfoLigne(icone: "person.fill", titre: "Auteur·ice", valeur: lieu.auteur)
                        InfoLigne(icone: "mappin.and.ellipse", titre: "Localisation", valeur: lieu.localisation)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.backgroundGray)
                    .clipShape(.rect(cornerRadius: 22))

                    // Petite carte centrée sur l'œuvre
                    Map(initialPosition: .region(MKCoordinateRegion(
                        center: coordonnees,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))) {
                        Marker(lieu.nom, coordinate: coordonnees)
                            .tint(.mainOrange)
                    }
                    .frame(height: 180)
                    .clipShape(.rect(cornerRadius: 22))
                }
                .padding()
            }
        }
        .navigationTitle(lieu.ville)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var coordonnees: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lieu.latitude, longitude: lieu.longitude)
    }
}

/// Une ligne d'information de la fiche
struct InfoLigne: View {
    let icone: String
    let titre: String
    let valeur: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: icone)
                .foregroundStyle(.mainOrange)
                .frame(width: 22)
            VStack(alignment: .leading, spacing: 2) {
                Text(titre)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(valeur)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailsView(lieu: Lieu.streetArts[0])
    }
}
