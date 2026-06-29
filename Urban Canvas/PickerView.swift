//
//  PickerView.swift
//  Urban Canvas
//
//  Created by apprenant144 on 24/06/2026.
//

import SwiftUI

struct PickerView: View {
    
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
    
    @State private var selectedContent = Content.liste
    
    
    var body: some View {
        NavigationStack {
            VStack {
        
                switch selectedContent {
                case .liste:
                   Liste_Street_arts()
                case .carte:
                    MapView(lieux: filter)
                } 
            }
            .toolbar {
                
                ToolbarItem (placement: .principal) {
                    Picker("", selection: $selectedContent) {
                        ForEach(Content.allCases, id: \.self) {item in
                            Text(item.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 250)
                    .padding()
                }

            }

        }
    }
}

#Preview {
    PickerView()
}
