//
//  BienImmobilier.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//
import Foundation

struct CoordonneesGeo: Codable, Hashable {

    let longitude: Double
    let latitude: Double

}
struct Logement: Identifiable, Codable, Hashable {

    let id: String
    let idProprietaire: String
    let nomProprietaire: String
    let ppProprietaire: String
    let nmChambre: Int
    let nbSdb: Int
    let nbInvite: Int
    let nbLit: Int
    var prixNuite: Int
    let coordonneesGeo: CoordonneesGeo
    let ville: String
    let adresse: String
    let departement: String
    let titre: String
    private var storedNote: Double
    var note: Double {
        get {
            return (storedNote * 100).rounded() / 100
        }
        set {
            storedNote = newValue
        }
    }

    let imageLogement: [String]
    var services: [ListeServices]
    var comodites: [ListeComodites]
    var typeLogement: TypeLogement

    init(
        id: String, idProprietaire: String, nomProprietaire: String,
        ppProprietaire: String, nmChambre: Int, nbSdb: Int, nbInvite: Int,
        nbLit: Int, prixNuite: Int, coordonneesGeo: CoordonneesGeo,
        ville: String, adresse: String, departement: String, titre: String,
        note: Double, imageLogement: [String], services: [ListeServices],
        comodites: [ListeComodites], typeLogement: TypeLogement
    ) {
        self.id = id
        self.idProprietaire = idProprietaire
        self.nomProprietaire = nomProprietaire
        self.ppProprietaire = ppProprietaire
        self.nmChambre = nmChambre
        self.nbSdb = nbSdb
        self.nbInvite = nbInvite
        self.nbLit = nbLit
        self.prixNuite = prixNuite
        self.coordonneesGeo = coordonneesGeo
        self.ville = ville
        self.adresse = adresse
        self.departement = departement
        self.titre = titre
        self.storedNote = note
        self.imageLogement = imageLogement
        self.services = services
        self.comodites = comodites
        self.typeLogement = typeLogement
    }
}

enum TypeLogement: Int, Codable, Identifiable, Hashable {
    case villa
    case appartement
    case maison
    case maisonVille

    var description: String {
        switch self {
        case .villa: return "Villa"
        case .appartement: return "Appartement"
        case .maison: return "Maison"
        case .maisonVille: return "Maison en ville"
        }
    }

    var id: Int {
        return self.rawValue
    }
}

enum ListeServices: Int, Codable, Identifiable, Hashable {
    case verifAuto
    case superHost

    var titre: String {
        switch self {
        case .verifAuto: return "Verification autonome"
        case .superHost: return "SuperHote"
        }
    }
    var sousTitre: String {
        switch self {
        case .verifAuto: return "Je verifie avec un mdp"
        case .superHost: return "Les superhote sont experimentés ..."
        }
    }
    var nomImage: String {
        switch self {
        case .verifAuto: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    var id: Int {
        return self.rawValue
    }

}

enum ListeComodites: Int, Codable, Identifiable, Hashable {
    case tv
    case cuisine
    case wifi
    case lavelinge
    case piscine
    case balcon
    case alarme
    case bureau

    var titre: String {
        switch self {
        case .tv: return "tv"
        case .cuisine: return "cuisine"
        case .wifi: return "wifi"
        case .lavelinge: return "laveling"
        case .piscine: return "piscine"
        case .balcon: return "balcon"
        case .alarme: return "alarme"
        case .bureau: return "bureau"
        }
    }
    var nomImage: String {
        switch self {
        case .tv: return "tv"
        case .cuisine: return "fork.knife"
        case .wifi: return "wifi"
        case .lavelinge: return "washer"
        case .piscine: return "figure.pool.swim"
        case .balcon: return "building"
        case .alarme: return "checker.shield"
        case .bureau: return "pencil.and.ruler.fill"
        }
    }
    var id: Int {
        return self.rawValue
    }

}
