//
//  Vegetable.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import Foundation

struct Vegetable: Decodable {
    let vegetableId: Int
    let name: String
    let description: String
    let thumbnailImage: String
    
    private enum CodingKeys: String, CodingKey {
        case vegetableId = "VegetableId"
        case name = "Name"
        case description = "Description"
        case thumbnailImage = "ThumbnailImage"
    }
}
