//
//  DataPreview.swift
//  AirBnb
//
//  Created by Anthony Baucal on 27/09/2024.
//

import Foundation

class DataPreview{
    static let donnees = DataPreview()
    
    var listesItem : [Logement] = [
        .init(
            id : UUID().uuidString,
            idProprietaire : UUID().uuidString,
            nomProprietaire : "John Doe",
            ppProprietaire : "person.crop.circle",
            nmChambre : Int.random(in: 1..<4),
            nbSdb : Int.random(in:1..<4),
            nbInvite : Int.random(in:1..<4),
            nbLit : Int.random(in:1..<4),
            prixNuite: Int.random(in:35..<80),
            coordonneesGeo : CoordonneesGeo(longitude: Double.random(in:10.0 ..< 20.0), latitude: Double.random(in:10.0 ..< 20.0)),
            ville :["paris", "rennes", "nantes", "dijon", "avignon", "marseille"].randomElement()!,
            adresse : ["One", "Fish", "Two", "Fishes", "Red", "Blue"].randomElement()!,
            departement : ["ile de france", "aviron", "rhone", "alpes", "gironde", "creuse"].randomElement()!,
            titre : ["villa ...", "appartement...", "maison ...", "maison de ville ..."].randomElement()!,
            note :Double.random(in: 2..<5),
            imageLogement: ["listing-1","listing-2","listing-3","listing-4"],
            services:[.verifAuto,.superHost],
            comodites:[.wifi,.tv,.piscine],
            typeLogement:.villa
        ),
        .init(
            id : UUID().uuidString,
            idProprietaire : UUID().uuidString,
            nomProprietaire : "John Doe",
            ppProprietaire : "person.crop.circle",
            nmChambre : Int.random(in: 1..<4),
            nbSdb : Int.random(in:1..<4),
            nbInvite : Int.random(in:1..<4),
            nbLit : Int.random(in:1..<4),
            prixNuite: Int.random(in:35..<80),
            coordonneesGeo : CoordonneesGeo(longitude: Double.random(in:10.0 ..< 20.0), latitude: Double.random(in:10.0 ..< 20.0)),
            ville :["paris", "rennes", "nantes", "dijon", "avignon", "marseille"].randomElement()!,
            adresse : ["One", "Fish", "Two", "Fishes", "Red", "Blue"].randomElement()!,
            departement : ["ile de france", "aviron", "rhone", "alpes", "gironde", "creuse"].randomElement()!,
            titre : ["villa ...", "appartement...", "maison ...", "maison de ville ..."].randomElement()!,
            note :Double.random(in: 2..<5),
            imageLogement: ["listing-1","listing-2","listing-3","listing-4"],
            services:[.verifAuto,.superHost],
            comodites:[.wifi,.tv,.piscine],
            typeLogement:.villa
        ),
        .init(
            id : UUID().uuidString,
            idProprietaire : UUID().uuidString,
            nomProprietaire : "John Doe",
            ppProprietaire : "person.crop.circle",
            nmChambre : Int.random(in: 1..<4),
            nbSdb : Int.random(in:1..<4),
            nbInvite : Int.random(in:1..<4),
            nbLit : Int.random(in:1..<4),
            prixNuite: Int.random(in:35..<80),
            coordonneesGeo : CoordonneesGeo(longitude: Double.random(in:10.0 ..< 20.0), latitude: Double.random(in:10.0 ..< 20.0)),
            ville :["paris", "rennes", "nantes", "dijon", "avignon", "marseille"].randomElement()!,
            adresse : ["One", "Fish", "Two", "Fishes", "Red", "Blue"].randomElement()!,
            departement : ["ile de france", "aviron", "rhone", "alpes", "gironde", "creuse"].randomElement()!,
            titre : ["villa ...", "appartement...", "maison ...", "maison de ville ..."].randomElement()!,
            note :Double.random(in: 2..<5),
            imageLogement: ["listing-1","listing-2","listing-3","listing-4"],
            services:[.verifAuto,.superHost],
            comodites:[.wifi,.tv,.piscine],
            typeLogement:.villa
        ),
        .init(
            id : UUID().uuidString,
            idProprietaire : UUID().uuidString,
            nomProprietaire : "John Doe",
            ppProprietaire : "person.crop.circle",
            nmChambre : Int.random(in: 1..<4),
            nbSdb : Int.random(in:1..<4),
            nbInvite : Int.random(in:1..<4),
            nbLit : Int.random(in:1..<4),
            prixNuite: Int.random(in:35..<80),
            coordonneesGeo : CoordonneesGeo(longitude: Double.random(in:10.0 ..< 20.0), latitude: Double.random(in:10.0 ..< 20.0)),
            ville :["paris", "rennes", "nantes", "dijon", "avignon", "marseille"].randomElement()!,
            adresse : ["One", "Fish", "Two", "Fishes", "Red", "Blue"].randomElement()!,
            departement : ["ile de france", "aviron", "rhone", "alpes", "gironde", "creuse"].randomElement()!,
            titre : ["villa ...", "appartement...", "maison ...", "maison de ville ..."].randomElement()!,
            note :Double.random(in: 2..<5),
            imageLogement: ["listing-1","listing-2","listing-3","listing-4"],
            services:[.verifAuto,.superHost],
            comodites:[.wifi,.tv,.piscine],
            typeLogement:.villa
        ),
        .init(
            id : UUID().uuidString,
            idProprietaire : UUID().uuidString,
            nomProprietaire : "John Doe",
            ppProprietaire : "person.crop.circle",
            nmChambre : Int.random(in: 1..<4),
            nbSdb : Int.random(in:1..<4),
            nbInvite : Int.random(in:1..<4),
            nbLit : Int.random(in:1..<4),
            prixNuite: Int.random(in:35..<80),
            coordonneesGeo : CoordonneesGeo(longitude: Double.random(in:10.0 ..< 20.0), latitude: Double.random(in:10.0 ..< 20.0)),
            ville :["paris", "rennes", "nantes", "dijon", "avignon", "marseille"].randomElement()!,
            adresse : ["One", "Fish", "Two", "Fishes", "Red", "Blue"].randomElement()!,
            departement : ["ile de france", "aviron", "rhone", "alpes", "gironde", "creuse"].randomElement()!,
            titre : ["villa ...", "appartement...", "maison ...", "maison de ville ..."].randomElement()!,
            note :Double.random(in: 2..<5),
            imageLogement: ["listing-1","listing-2","listing-3","listing-4"],
            services:[.verifAuto,.superHost],
            comodites:[.wifi,.tv,.piscine],
            typeLogement:.villa
        ),
    ]
}

