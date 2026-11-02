//
//  MissionView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 26/06/2026.
//
//  V5 : Mission de découverte.
//

import SwiftUI

struct MissionView: View {

    @State private var mission: [Lieu] = []
    @State private var consultees: Set<UUID> = []     // œuvres dont la fiche a été ouverte
    @State private var decouvertes: Set<UUID> = []    // œuvres marquées "découverte"

    private var nombreDecouvertes: Int {
        mission.filter { decouvertes.contains($0.id) }.count
    }

    private var missionTerminee: Bool {
        !mission.isEmpty && nombreDecouvertes == mission.count
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {

                    // 5.7 Suivi de progression
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(nombreDecouvertes) œuvre\(nombreDecouvertes > 1 ? "s" : "") découverte\(nombreDecouvertes > 1 ? "s" : "") sur \(mission.count)")
                            .font(.headline)

                        ProgressView(value: Double(nombreDecouvertes), total: Double(max(mission.count, 1)))
                            .tint(.mainOrange)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .clipShape(.rect(cornerRadius: 22))

                    // 5.8 Fin de mission
                    if missionTerminee {
                        VStack(spacing: 8) {
                            Image(systemName: "trophy.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.yellow)
                            Text("Mission terminée ! Vous avez découvert \(mission.count) œuvres urbaines.")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.mainOrange.opacity(0.15))
                        .clipShape(.rect(cornerRadius: 22))
                        .transition(.scale.combined(with: .opacity))
                    }

                    // 5.5 Cartes numérotées
                    ForEach(Array(mission.enumerated()), id: \.element.id) { index, oeuvre in
                        CarteMission(
                            numero: index + 1,
                            oeuvre: oeuvre,
                            estConsultee: consultees.contains(oeuvre.id),
                            estDecouverte: decouvertes.contains(oeuvre.id),
                            onMarquer: {
                                withAnimation { basculerDecouverte(oeuvre) }
                            }
                        )
                    }

                    // 5.9 Nouvelle mission
                    Button {
                        withAnimation { nouvelleMission() }
                    } label: {
                        Label("Nouvelle mission", systemImage: "arrow.triangle.2.circlepath")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.mainOrange)
                    .controlSize(.large)
                }
                .padding()
            }
            .background(Color.backgroundGray)
            .navigationTitle("Mission")
            // 5.6 Ouverture de la fiche détail
            .navigationDestination(for: Lieu.self) { oeuvre in
                DetailsView(lieu: oeuvre)
                    .onAppear { consultees.insert(oeuvre.id) }
            }
            .onAppear {
                if mission.isEmpty {
                    nouvelleMission()
                }
            }
        }
    }

    private func basculerDecouverte(_ oeuvre: Lieu) {
        if decouvertes.contains(oeuvre.id) {
            decouvertes.remove(oeuvre.id)
        } else {
            decouvertes.insert(oeuvre.id)
        }
    }

    /// 5.3 / 5.9 Génère une nouvelle sélection et remet la progression à zéro
    private func nouvelleMission() {
        mission = Mission.generer(depuis: Lieu.streetArts)
        consultees = []
        decouvertes = []
    }
}

/// Carte d'une œuvre de la mission
struct CarteMission: View {
    let numero: Int
    let oeuvre: Lieu
    let estConsultee: Bool
    let estDecouverte: Bool
    var onMarquer: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            NavigationLink(value: oeuvre) {
                HStack(spacing: 12) {
                    ZStack(alignment: .topLeading) {
                        Image(oeuvre.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(.rect(cornerRadius: 16))

                        // Numéro de la carte
                        Text("\(numero)")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.mainOrange)
                            .clipShape(Circle())
                            .offset(x: -8, y: -8)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(oeuvre.nom)
                            .font(.headline)
                            .foregroundStyle(.mainOrange)
                        Text(oeuvre.type)
                            .font(.subheadline)
                        Text(oeuvre.auteur)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Label(oeuvre.adresse, systemImage: "mappin")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                    .multilineTextAlignment(.leading)

                    Spacer(minLength: 0)

                    Image(systemName: "chevron.right")
                        .foregroundStyle(.secondary)
                }
            }
            .buttonStyle(.plain)

            // Marquer comme "découverte" (possible après avoir consulté la fiche)
            Button(action: onMarquer) {
                Label(estDecouverte ? "Découverte ✓" : "Marquer comme découverte",
                      systemImage: estDecouverte ? "checkmark.seal.fill" : "seal")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .tint(estDecouverte ? Color.green : Color.mainOrange)
            .disabled(!estConsultee && !estDecouverte)

            if !estConsultee && !estDecouverte {
                Text("Ouvrez la fiche de l'œuvre pour pouvoir la marquer.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(estDecouverte ? Color.green.opacity(0.08) : Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 22))
    }
}

#Preview {
    MissionView()
}
