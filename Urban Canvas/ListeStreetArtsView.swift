//
//  Liste Street arts.swift
//  Urban Canvas
//
//  Created by apprenant144 on 22/06/2026.
//

import SwiftUI

struct Liste_Street_arts: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var type = "Tous"
    @State private var SelectedFilter = TypeFilter.Tous
    @State private var showFilter = false
    @State private var selection = 0
    
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
                        
            List {
                ForEach(filter) {lieu in
                    NavigationLink {
                        DetailsView(lieu: lieu)
                    } label: {
                    HStack {
                        
                        Image(lieu.image)
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            
                            Text(lieu.nom)
                                .font(.headline)
                            
                            HStack {
                                
                                Image(systemName: "mappin.circle.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(.secondText)
                                
                                Text(lieu.ville)
                                    .foregroundStyle(.secondText)
                            }
                        }
                        }
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { _ in
                        return 0 // Aligne le separateur sur le bord avant
                    }
                }
            }
            .navigationTitle("Liste des Street arts")
            .toolbar {

                ToolbarItem(placement: .topBarTrailing)
                {
                    Button{
                        showFilter = true
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    .confirmationDialog("Liste des filtres", isPresented: $showFilter, titleVisibility: .visible) {
                        ForEach(TypeFilter.allFilters, id: \.self)
                        {
                            filter in
                            Button(filter.rawValue) {
                                withAnimation {
                                    SelectedFilter = filter
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    Liste_Street_arts()
}

