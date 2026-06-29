//
//  MapView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 23/06/2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var sheet = false
    @State private var selectedLieu: Lieu?
    @State private var SelectedFilter = TypeFilter.Tous
    let lieux : [Lieu]
    
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 46.232193 , longitude: 2.209667),
            span: MKCoordinateSpan(latitudeDelta: 6.0, longitudeDelta: 6.0)
        )
    )
    
    var filter: [Lieu] {
        if SelectedFilter == .Tous {
            return Lieu.streetArts
        } else {
            return Lieu.streetArts.filter { lieu in
                lieu.type == SelectedFilter.rawValue
                
            }
        }
    }

    var body: some View {
        
        NavigationStack {
            
            Map(position: $position, selection: $selectedLieu) {
                ForEach (lieux, id:\.id) { unLieu in
                    Marker(unLieu.nom, coordinate: CLLocationCoordinate2D(latitude: unLieu.latitude, longitude: unLieu.longitude))
                        .tint(.mainOrange)
                        .tag(unLieu)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: selectedLieu) {
                        if selectedLieu != nil {
                            sheet = true
                        }
                    }
            
            .sheet(isPresented: $sheet, onDismiss: { selectedLieu = nil }) {
                if let lieu = selectedLieu {
                    VStack {
                        HStack {
                            Button { sheet = false } label: {
                                Image(systemName: "xmark.circle").tint(.gray)
                            }
                            .padding()
                            
                            Text(lieu.nom)
                                .font(.headline)
                                .padding()
                            
                            Button {
                                if let currentIndex = lieux.firstIndex(where: {$0.id == lieu.id}) {
                                    let nextIndex = (currentIndex + 1) % lieux.count
                                    selectedLieu = lieux [nextIndex]
                                }
                            } label: {Image(systemName: "greaterthan.circle.fill").tint(.mainOrange)}
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    ScrollView {
                            
                            Image(lieu.image)
                                .resizable()
                                .padding(.top, -65)
                                .opacity(0.5)
                                .frame(width: 411, height: 250)
                                .scaledToFit()
                                .padding()
                            
                            Text(lieu.details)
                            .padding(.leading, 50)
                            .padding(.trailing, 50)
                    }
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}


#Preview {
    MapView(lieux: [
        Lieu(
            ville: "Paris",
            nom: "Liberté Egalité Fraternité",
            image: .parisLiberté,
            details: "Réalisée par l’artiste eL Seed, cette fresque monumentale met à l'honneur son style unique, le « calligraffiti », qui réinvente la calligraphie arabe au service de messages universels. Intitulée « Liberté, égalité, fraternité », cette œuvre colorée fait directement écho aux valeurs de la République française et dialogue, par-delà le boulevard, avec la célèbre Marianne de Shepard Fairey située juste en face.",
            type: "Calligraphie",
            condition: "Bonne",
            date: "Avril 2007",
            auteur: "El Seed",
            latitude: 48.8341,
            longitude: 2.3629,
            localisation: """
            128 Boulevard Vincent Auriol, 75013 Paris
            (Latitude: 48.8341, Longitude: 2.3629)
            """
        )
    ])
}
