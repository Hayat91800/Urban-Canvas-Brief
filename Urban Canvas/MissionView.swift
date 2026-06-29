//
//  DecouverteView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 26/06/2026.
//

import SwiftUI

struct MissionView: View {
    
    @State private var randomMissions: [Lieu] = []
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color(.backgroundGray)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    ForEach(randomMissions) { target in
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(target.nom)
                                .font(.title)
                                .foregroundStyle(.mainOrange)
                                .fontWeight(.bold)
                            
                            HStack{
                                Image(target.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .frame(maxWidth: .infinity)
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(target.type)
                                    Text(target.auteur)
                                    Text(target.localisation)
                                }
                            }
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(22)
                    }
                    .padding()
                }
                .navigationTitle("Missions")
                .onAppear{
                    if randomMissions.isEmpty {
                        randomMissions = Array(Lieu.streetArts.shuffled().prefix(5))
                    }
                }
            }
        }
    }
}

#Preview {
    MissionView()
}
