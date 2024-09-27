//
//  utils.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import Foundation

class Utils{
    
    func fetchLogements() async throws -> [Logement]  {
        return DataPreview.donnees.listesItem
    }
}
