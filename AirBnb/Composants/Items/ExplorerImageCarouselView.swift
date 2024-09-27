//
//  ExplorerImageCarouselView.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import SwiftUI

struct ExplorerImageCarouselView: View {
    let logement : Logement
    
    var body: some View {
        TabView {
            ForEach(logement.imageLogement, id: \.self){ image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ExplorerImageCarouselView(logement: DataPreview.donnees.listesItem[0])
}
