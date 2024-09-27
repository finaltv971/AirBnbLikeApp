//
//  DestinationSearchView.swift
//  AirBnb
//
//  Created by Anthony Baucal on 27/09/2024.
//

import SwiftUI

enum DestinationSearchOption {
    case destination
    case date
    case invite
}

struct DestinationSearchView: View {
    @Binding var afficher: Bool
    
    @StateObject var modelView : ExplorerViewModel
    
    @State private var optionSelectionner: DestinationSearchOption =
        .destination
   
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date().addingTimeInterval(86400)
    
    var body: some View {
        VStack(spacing: 32) {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        if modelView.filtre.destination.isEmpty{
                            modelView.recherche()
                        }
                        afficher.toggle()
                        
                    }

                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                if(!modelView.filtre.destination.isEmpty){
                    Button {
                        withAnimation(.snappy) {
                            modelView.filtre.reset()
                            startDate = Date()
                            endDate = Date().addingTimeInterval(86400)
                            modelView.recherche()
                            afficher.toggle()
                        }
                    } label: {
                        Text("Clear").foregroundStyle(.black)
                    }
                }
                
            }.padding()

            VStack(alignment: .leading) {
                if optionSelectionner == .destination {

                    Text("Ou ?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField(
                            "Recherche de destination",
                            text: $modelView.filtre.destination
                        )
                        .font(.subheadline)
                        .onSubmit {
                            withAnimation(.easeIn){
                                modelView.recherche()
                                afficher.toggle()
                            }
                        }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedSearchItemView(
                        titre: "Destination?", descript: "Quand")
                }
            }
            .modifier(CollapsedSearchItemViewModifier())
            .frame(height: optionSelectionner == .destination ? 120 : 64)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    optionSelectionner = .destination
                }
            }

            VStack(alignment: .leading) {
                if optionSelectionner == .date {
                    Text("Quand partez-vous?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker(
                            "De", selection: $modelView.filtre.dateSejour.start,
                            displayedComponents: .date)
                        Divider()

                        DatePicker(
                            "A", selection: $modelView.filtre.dateSejour.end,
                            displayedComponents: .date)

                    }.foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)

                } else {
                    CollapsedSearchItemView(titre: "Quand?", descript: "date")
                }
            }
            .modifier(CollapsedSearchItemViewModifier())
            .frame(height: optionSelectionner == .date ? 120 : 64)
            
            .onTapGesture {
                withAnimation(.easeInOut) {
                    optionSelectionner = .date
                }
            }

            VStack(alignment: .leading) {
                if optionSelectionner == .invite {
                    Text("Qui vient?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper {
                        Text("\(modelView.filtre.invite) invité(s)")
                    } onIncrement: {
                        modelView.filtre.plus()
                    } onDecrement: {
                        modelView.filtre.moins()
                    }

                } else {
                    CollapsedSearchItemView(titre: "Qui?", descript: "invité")
                }
            }
            .modifier(CollapsedSearchItemViewModifier())
            .frame(height: optionSelectionner == .invite ? 120 : 64)
            
            .onTapGesture {
                withAnimation(.easeInOut) {
                    optionSelectionner = .invite
                }
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    DestinationSearchView(afficher: .constant(false),modelView: ExplorerViewModel(service: Utils()))
}

struct CollapsedSearchItemViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
    }
}
struct CollapsedSearchItemView: View {
    let titre: String
    let descript: String
    var body: some View {
        VStack {
            HStack {
                Text(titre)
                    .foregroundStyle(.gray)
                Spacer()
                Text(descript)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
