//
//  SearchFilterBar.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import SwiftUI

struct SearchFilterBar: View {
    @Binding var destination : String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading, spacing: 2) {
                Text(!destination.isEmpty ? destination :"Ou?").font(.footnote).fontWeight(.semibold)

                Text("\(destination.isEmpty ? "Quand? " :"") - Avec qui?")
                    .font(.footnote).foregroundStyle(.gray)
 
            }
            Spacer()
            Button {

            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }.padding()
    }
}

#Preview {
    SearchFilterBar(destination: .constant("alpes"))
}
