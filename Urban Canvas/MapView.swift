//
//  MapView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 23/06/2026.
//
//  V3 : vue cartographique globale.
//  2.2 Tap sur un point → aperçu partiel (image, titre, début de la description)
//  2.3 Tap sur l'aperçu → vue détail complète
//

import SwiftUI
import MapKit

struct MapView: View {

    let lieux: [Lieu]

    @State private var selectedLieu: Lieu?

    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 46.232193, longitude: 2.209667),
            span: MKCoordinateSpan(latitudeDelta: 8.0, longitudeDelta: 8.0)
        )
    )

    var body: some View {
        Map(position: $position, selection: $selectedLieu) {
            ForEach(lieux) { unLieu in
                Marker(unLieu.nom, systemImage: "paintpalette.fill",
                       coordinate: CLLocationCoordinate2D(latitude: unLieu.latitude, longitude: unLieu.longitude))
                    .tint(.mainOrange)
                    .tag(unLieu)
            }
        }
        .safeAreaInset(edge: .bottom) {
            if let lieu = selectedLieu {
                ApercuOeuvre(lieu: lieu) {
                    withAnimation { selectedLieu = nil }
                }
                .padding()
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .animation(.spring, value: selectedLieu)
        .onChange(of: lieux) { _, nouveauxLieux in
            // Si le filtre masque l'œuvre sélectionnée, on ferme l'aperçu
            if let selectedLieu, !nouveauxLieux.contains(selectedLieu) {
                self.selectedLieu = nil
            }
        }
    }
}

/// Aperçu partiel d'une œuvre affiché sur la carte
struct ApercuOeuvre: View {
    let lieu: Lieu
    var onFermer: () -> Void

    var body: some View {
        NavigationLink(value: lieu) {
            HStack(alignment: .top, spacing: 12) {
                Image(lieu.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(.rect(cornerRadius: 14))

                VStack(alignment: .leading, spacing: 6) {
                    Text(lieu.nom)
                        .font(.headline)
                        .foregroundStyle(.mainOrange)

                    Text(lieu.details)
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)

                    Label("Voir la fiche", systemImage: "chevron.right.circle.fill")
                        .font(.caption.bold())
                        .foregroundStyle(.mainOrange)
                }

                Spacer(minLength: 0)
            }
            .padding()
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 22))
            .overlay(alignment: .topTrailing) {
                Button(action: onFermer) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                .padding(8)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        MapView(lieux: Lieu.streetArts)
            .navigationDestination(for: Lieu.self) { DetailsView(lieu: $0) }
    }
}
