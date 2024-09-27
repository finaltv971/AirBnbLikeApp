//
//  ExplorerItemView.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import SwiftUI

struct ExplorerItemView: View {

    let logement : Logement
    var body: some View {
        VStack(spacing: 8) {
            ExplorerImageCarouselView(logement: logement)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            /*
             AsyncImage(url: URL(string: "")){
                 image in
                 image.resizable()
             }placeholder: {
                 Image(systemName: "photo").resizable()
             }.frame(height: 320)
                 .clipShape(RoundedRectangle(cornerRadius: 10))
             */

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(logement.titre), \(logement.departement)")
                        .fontWeight(.semibold)
                        
                    Text("12 km")
                        .foregroundStyle(.gray)
                        

                    Text("Nov 3- 10 ")
                        .foregroundStyle(.gray)
                        

                    HStack {
                        Text("\(logement.prixNuite) €")
                            .fontWeight(.semibold)
                            

                        Text("nuit")
                            .foregroundStyle(.black)

                    }
                }.foregroundStyle(.black)


                Spacer()

                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("\(logement.note )")
                }.foregroundStyle(.black)
            }.font(.footnote)
        }
    }
}

#Preview {
    ExplorerItemView(logement: DataPreview.donnees.listesItem[0])
}
