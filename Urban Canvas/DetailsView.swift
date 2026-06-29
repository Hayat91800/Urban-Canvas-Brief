//
//  DetailsView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 22/06/2026.
//

import SwiftUI
import MapKit

struct DetailsView: View {
    
    let lieu : Lieu
    
    var body: some View {
        
        ScrollView{
            
            Image(lieu.image)
                .resizable()
                .padding(.top, -65)
                .opacity(0.5)
                .frame(width: 411, height: 250)
                .scaledToFit()
                .padding(.top, -65)
            
            VStack (alignment: .leading, spacing: 16) {
                Text(lieu.nom)
                    .font(.title2.bold())
                    .foregroundStyle(.mainOrange)
                    .padding(.vertical)
                
                
                Text(lieu.details)
                
                Text("""
                **Type:** \(lieu.type)
                **Condition:** \(lieu.condition)
                **Date:** \(lieu.date)
                **Auteur:** \(lieu.auteur)
                **Localisation:** \(lieu.localisation)
                """)
                
                Map {
                    ForEach (Lieu.streetArts, id:\.id) { Lieu in
                        Annotation(lieu.nom, coordinate: CLLocationCoordinate2D(latitude: lieu.latitude, longitude: lieu.longitude)) {
                            ZStack {
                                Image(lieu.image)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(.white, lineWidth: 2))
                            }
                        }
                    }
                }
                .frame(width: 358, height: 157)
                .clipShape(.rect(cornerRadius: 25))
                .navigationTitle(lieu.ville)
                .navigationBarTitleDisplayMode(.inline)
                
            }
            .padding(.horizontal, 50)
        }
        
    }
}

#Preview {
    DetailsView(lieu: Lieu.init(ville: "Paris",
                                nom: "Liberté Egalité Fraternité",
                                image: .parisLiberté,
                                details: "Réalisée par l’artiste eL Seed, cette fresque monumentale met à l'honneur son style unique, le « calligraffiti », qui réinvente la calligraphie arabe au service de messages universels. Intitulée « Liberté, égalité, fraternité », cette œuvre colorée fait directement écho aux valeurs de la République française et dialogue, par-delà le boulevard, avec la célèbre Marianne de Shepard Fairey située juste en face.",
                                type: "Calligraffiti",
                                condition: "Bonne",
                                date: "Avril 2007",
                                auteur: "El Seed",
                                latitude: 48.8341,
                                longitude: 2.3629,
                                localisation: " 128 Boulevard Vincent Auriol, 75013 Paris (Latitude: 48.8341, Longitude: 2.3629)"))
}
