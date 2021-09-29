//
//  SceneDelegate.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import Foundation
import SwiftUI
import CoreData

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//	var window: UIWindow?
//
//	// MARK: - Core Data stack
//
//	lazy var persistentContainer: NSPersistentContainer = {
//		let container = NSPersistentContainer(name: "SpaceCrafts")
//		container.loadPersistentStores { _, error in
//			if let error = error as NSError? {
//				// You should add your own error handling code here.
//				fatalError("Unresolved error \(error), \(error.userInfo)")
//			}
//		}
//		return container
//	}()
//
//	// MARK: - Core Data Saving support
//
//	func saveContext() {
//		let context = persistentContainer.viewContext
//		if context.hasChanges {
//			do {
//				try context.save()
//			} catch {
//				// The context couldn't be saved.
//				// You should add your own error handling here.
//				let nserror = error as NSError
//				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//			}
//		}
//	}
//}
