//
//  ExplorerDetailItemView.swift.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import MapKit
import SwiftUI

struct ExplorerDetailItemView: View {
    let logement: Logement
    @State private var positionCamera: MapCameraPosition

    @Environment(\.dismiss) var dismiss

    init(logement: Logement) {
        self.logement = logement
        let region = MKCoordinateRegion(
            center:
                CLLocationCoordinate2D(
                    latitude: logement.coordonneesGeo.latitude,
                    longitude: logement.coordonneesGeo.longitude),
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1))

        self._positionCamera = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ExplorerImageCarouselView(logement: logement)
                    .frame(height: 320)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            VStack(alignment: .leading) {
                Text("\(logement.titre), \(logement.ville)")
                    .font(.title)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("\(logement.note)")
                        Text(" - ")
                        Text("28 Avis").underline().fontWeight(.bold)
                    }
                    .foregroundStyle(.black)
                    Text("\(logement.ville), \(logement.departement)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)

            Divider()

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(
                        "Entire \(logement.typeLogement) hosted by \(logement.nomProprietaire)"
                    )
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)

                    HStack(spacing: 2) {
                        Text("\(logement.nbInvite) invités -")
                        Text("\(logement.nbLit) chambres -")
                        Text("\(logement.nbInvite) lits -")
                        Text("\(logement.nbSdb) Sdb")
                    }.font(.caption)
                }
                .frame(width: 300, alignment: .leading)

                Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {

                ForEach(logement.services) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.nomImage)

                        VStack(alignment: .leading) {
                            Text("\(feature.titre)")
                                .font(.footnote)
                                .fontWeight(.semibold)

                            Text(
                                feature.sousTitre
                            )
                            .font(.caption)
                            .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Où dormir?")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1...logement.nbLit, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 6) {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(item)")

                            }
                            .padding(.vertical, 32)
                            .padding(.horizontal, 24)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }

                        }
                    }
                }.scrollTargetBehavior(.paging)
            }.padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Services disponible")
                    .font(.headline)

                ForEach(logement.comodites) { item in

                    HStack {
                        Image(systemName: item.nomImage)
                            .frame(width: 32)
                        Text(item.titre).font(.footnote)
                        Spacer()
                    }
                }
            }.padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Emplacement")
                    .font(.headline)
                Map(position: $positionCamera)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }.padding()

        }.toolbar(.hidden, for: .tabBar)
            .ignoresSafeArea()
            .padding(.bottom, 64)
            .overlay(alignment: .bottom) {
                VStack {

                    Divider().padding(.bottom)

                    HStack {

                        VStack(alignment: .leading) {
                            Text("\(logement.prixNuite * 5) €")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            

                            Text("Hors taxes")
                                .font(.footnote)

                            Text("12 - 20 octobre")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .underline()

                        }
                        Spacer()

                        Button {

                        } label: {
                            Text("Reserver")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                    }.padding(.horizontal, 32)
                }.background(.white)
            }
    }
}

#Preview {
    ExplorerDetailItemView(logement: DataPreview.donnees.listesItem[0])
}
