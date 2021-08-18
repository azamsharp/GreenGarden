//
//  CoreDataManager.swift
//  CoreDataManager
//
//  Created by Mohammad Azam on 8/2/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "GreenGardenModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
           return persistentContainer.newBackgroundContext()
    }
    
    func save() throws {
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    func importData() async throws {
        
        func removeAllData() {
            
            let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Vegetable")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            
            do {
                try viewContext.execute(deleteRequest)
            } catch {
                print(error)
            }
        }
        
        let vegetableDTOs = try await Webservice().getAllVegetables(url: Constants.Urls.getAllVegetables)
        
        // remove existing data
        removeAllData()
        
        // insert vegetables in the database
        for vegetableDTO in vegetableDTOs {
            
            try await backgroundContext.perform {
                let vegetable = Vegetable(context: self.viewContext)
                vegetable.vegetableId = Int32(vegetableDTO.vegetableId)
                vegetable.name = vegetableDTO.name
                vegetable.vegetableDescription = vegetableDTO.description
                vegetable.seedDepth = vegetableDTO.seedDepth
                vegetable.thumbnailImage = vegetableDTO.thumbnailImage
                vegetable.growingSoilTemp = vegetableDTO.growingSoilTemp
                vegetable.sowingDescription = vegetableDTO.sowingDescription
                vegetable.growingDescription = vegetableDTO.growingDescription
                try self.save()
            }
            
        }
        
        
    }
    
}
