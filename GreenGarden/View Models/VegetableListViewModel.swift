//
//  VegetableListViewModel.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import Foundation

@MainActor
class VegetableListViewModel: ObservableObject {
    
    @Published var vegetables: [VegetableViewModel] = []
    
    func getAll() async {
        
        do {
            let vegetables = try await Webservice().getAllVegetables(url: Constants.Urls.getAllVegetables)
            self.vegetables = vegetables.map(VegetableViewModel.init)
        } catch {
            print(error)
        }
        
    }
    
}

struct VegetableViewModel {
    
    fileprivate let vegetable: Vegetable
    
    var id: Int {
        vegetable.vegetableId
    }
    
    var name: String {
        vegetable.name
    }
    
    var description: String {
        vegetable.description
    }
    
    var thumbnailUrl: URL? {
        URL(string: vegetable.thumbnailImage)
    }
    
    var seedDepth: String {
        vegetable.seedDepth
    }
    
    var growingSoilTemperature: String {
        vegetable.growingSoilTemp
    }
    
    var sowingDescription: String {
        vegetable.sowingDescription
    }
    
    var growingDescription: String {
        vegetable.growingDescription
    }
}

extension VegetableViewModel {
    
    static func `default`() -> VegetableViewModel {
        
        let vegetable = Vegetable(vegetableId: 1, name: "Avocado", description: "The avocado is a tree native to Mexico and Central America. Avocados are commercially valuable and are cultivated in tropical and Mediterranean climates throughout the world. They have green-skinned, fleshy body that may be pear-shaped, egg-shaped or spherical", thumbnailImage: "http://www.highoncoding.com/vegetableimages/avocado.png", seedDepth: "1/2 below seed height", growingSoilTemp: "60-85F", sowingDescription: "Put a tooth pick in Avocado seem and suspend upside down in a glass of water. Make sure the glass gets direct sunlight. The roots will start to appear in 2-6 weeks. When the roots are thick then plant it in the rich soil.", growingDescription: "Avocado trees usually requires water 2-3 times per week. Put mulch around the trees to make sure that the moisture stays inside the soil. Nitrogen rich fertilizers can also be applied to the tree in batches of 1/2 - 1 pound.")
        
        return VegetableViewModel(vegetable: vegetable)
        
    }
    
}
