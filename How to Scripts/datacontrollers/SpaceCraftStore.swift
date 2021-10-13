//
//  SpaceCraftStore.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import Combine
import CoreData
import os


fileprivate let logger = Logger(subsystem: "com.san.How-to-Scripts", category: "SpaceCraftStore")

class SpaceCraftStore: NSObject, ObservableObject {
	var spacecrafts = CurrentValueSubject<[SpaceCraft], Never>([])
	
	private let spacecraftFetchController: NSFetchedResultsController<SpaceCraft>
	static let shared: SpaceCraftStore = SpaceCraftStore()
	
	private override init() {
		spacecraftFetchController = NSFetchedResultsController(
			fetchRequest: SpaceCraft.Request.all.rawValue,
			managedObjectContext: PersistenceController.shared.container.viewContext,
			sectionNameKeyPath: nil, cacheName: nil
		)
		
		super.init()
		
		spacecraftFetchController.delegate = self
		
		do {
			try spacecraftFetchController.performFetch()
			spacecrafts.value = spacecraftFetchController.fetchedObjects ?? []
		} catch {
			NSLog("Error: could not fetch objects")
		}
	}
	
	func add(id: Int, name: String) {
		let newSpaceCraft = SpaceCraft(context: PersistenceController.shared.container.viewContext)
		newSpaceCraft.setValue(id, forKey: "id")
		newSpaceCraft.setValue(name, forKey: "name")
		saveContext()
	}
	
	func delete(id: Int, name: String) {
		let fetchSpaceCraft: NSFetchRequest<SpaceCraft> = SpaceCraft.fetchRequestWithId(id: id)
		
		do {
			logger.log("Deleting spacecraft")
			guard let hereItem = try PersistenceController.shared.container.viewContext.fetch(fetchSpaceCraft).first else { return }
			PersistenceController.shared.container.viewContext.delete(hereItem)
			saveContext()
			logger.log("Successfully deleted spacecraft")
		} catch {
			debugPrint(error)
		}
	}
	
	private func saveContext() {
		do {
			logger.log("Saving context")
			try PersistenceController.shared.container.viewContext.save()
			logger.log("Successfully saved context")
		} catch {
			logger.error("ERROR: \(error as NSObject)")
		}
	}
}

extension SpaceCraftStore: NSFetchedResultsControllerDelegate {
	public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		guard let spacecrafts = controller.fetchedObjects as? [SpaceCraft] else { return }
		logger.log("Context has changed, reloading spacecrafts")
		self.spacecrafts.value = spacecrafts
	}
}
