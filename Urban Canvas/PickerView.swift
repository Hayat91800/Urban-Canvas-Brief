//
//  PickerView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 24/06/2026.
//
//  Écran principal du 1er onglet : bascule Liste / Carte (V3) + filtre par type d'art (V2).
//

import SwiftUI

struct PickerView: View {

    @State private var selectedFilter = TypeFilter.Tous
    @State private var selectedContent = ModeAffichage.liste

    /// Œuvres affichées : le filtre s'applique à la liste ET à la carte
    private var oeuvresFiltrees: [Lieu] {
        selectedFilter.appliquer(sur: Lieu.streetArts)
    }

    var body: some View {
        NavigationStack {
            Group {
                switch selectedContent {
                case .liste:
                    Liste_Street_arts(lieux: oeuvresFiltrees)
                case .carte:
                    MapView(lieux: oeuvresFiltrees)
                }
            }
            .navigationTitle(selectedContent == .liste ? "Œuvres" : "Carte")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Lieu.self) { lieu in
                DetailsView(lieu: lieu)
            }
            .toolbar {
                // Segmented Control en haut de l'écran
                ToolbarItem(placement: .principal) {
                    Picker("Affichage", selection: $selectedContent) {
                        ForEach(ModeAffichage.allCases, id: \.self) { mode in
                            Text(mode.rawValue).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 220)
                }

                // Bouton de filtrage en haut à droite
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Type d'art", selection: $selectedFilter) {
                            ForEach(TypeFilter.allFilters, id: \.self) { filtre in
                                Text(filtre.rawValue).tag(filtre)
                            }
                        }
                    } label: {
                        Image(systemName: selectedFilter == .Tous
                              ? "line.3.horizontal.decrease.circle"
                              : "line.3.horizontal.decrease.circle.fill")
                    }
                    .tint(.mainOrange)
                }
            }
            .animation(.default, value: selectedFilter)
        }
    }
}

#Preview {
    PickerView()
}
