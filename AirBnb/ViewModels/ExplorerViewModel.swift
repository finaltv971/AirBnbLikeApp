//
//  ExplorerViewModel.swift
//  AirBnb
//
//  Created by Anthony Baucal on 27/09/2024.
//

import Foundation

class ExplorerViewModel : ObservableObject{
    @Published var logements = [Logement]()
    private var cpLogements = [Logement]()
    @Published var filtre: RechercheFiltre = RechercheFiltre(
        destination: "",
        dateSejour: DateInterval(start: Date(), duration: 86400))
    
    private let service : Utils
    
    init(service : Utils){
        self.service = service
        Task{
            await fetchLogements()
        }
    }
    @MainActor
    func fetchLogements() async {
        do{
            self.logements = try await service.fetchLogements()
            self.cpLogements = logements
        }catch{
            print(" \(error.localizedDescription)")
        }
    }
    
    func recherche(){
        let filtre = logements.filter({
            $0.ville.lowercased() == self.filtre.destination.lowercased() ||
            $0.departement.lowercased() == self.filtre.destination.lowercased()
        })
        self.logements = filtre.isEmpty ? cpLogements : filtre
    }
}

