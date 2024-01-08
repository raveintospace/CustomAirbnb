//
//  FavoritesDataService.swift
//  CustomAirbnb
//
//  Created by Uri on 8/1/24.
//

import Foundation
import CoreData

final class FavoritesDataService {
    
    // MARK: - Core Data configuration
    
    private let container: NSPersistentContainer
    private let containerName: String = "FavoritesContainer"
    private let entityName: String = "FavoriteEntity"
    
    @Published var savedEntities: [FavoriteEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                debugPrint("Error loading Core Data: \(error)")
            }
            self.getFavorites()
        }
    }
    
    // MARK: - Private methods, only called inside the class
    private func getFavorites() {
        let request = NSFetchRequest<FavoriteEntity>(entityName: entityName)
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            debugPrint("Error fetching Favorite Entities: \(error)")
        }
    }
    
    private func add(listing: Listing) {
        let entity = FavoriteEntity(context: container.viewContext)
        entity.listingID = listing.id
        applyChanges()
    }
    
    private func delete(entity: FavoriteEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            debugPrint("Error saving to Core Data: \(error)")
        }
    }
    
    // save current listings to favorites and get the info from it after being updated
    private func applyChanges() {
        save()
        getFavorites()
    }
}
