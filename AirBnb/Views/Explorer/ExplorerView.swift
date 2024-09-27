//
//  ExplorerView.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import SwiftUI

struct ExplorerView: View {
    
    @State private var destinationSearchViewVisible = false
    @StateObject var viewModel = ExplorerViewModel(service: Utils())
    var body: some View {
        
        NavigationStack{
            
            if destinationSearchViewVisible{
                
                DestinationSearchView(afficher: $destinationSearchViewVisible, modelView: viewModel)
                    
            }else{
                
                ScrollView{
                     
                    SearchFilterBar(destination: $viewModel.filtre.destination)
                        .onTapGesture {
                            withAnimation(.snappy){
                                destinationSearchViewVisible.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.logements){ listing in
                            
                            NavigationLink(value: listing){
                                ExplorerItemView(logement: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }.padding()
                }
                .navigationDestination(for: Logement.self){ item in
                    ExplorerDetailItemView(logement: item)
                        .navigationBarBackButtonHidden()
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    ExplorerView()
}
