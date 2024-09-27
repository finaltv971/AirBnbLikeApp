//
//  Favoris.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import SwiftUI

struct Favoris: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading,spacing: 4){
                    Text("Connexion à mes favoris")
                        .font(.headline)
                    
                    Text("Creer, editer, consulter ma liste de favoris")
                        .font(.caption)
                    
                    
                }
                Button{
                    
                }label: {
                    Text("Login")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }.padding(.top)
                Spacer()
            }.padding()
            .navigationTitle("Favoris")
        }
    }
}
   
#Preview {
    Favoris()
}
