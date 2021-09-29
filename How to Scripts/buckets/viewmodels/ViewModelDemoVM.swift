//
//  ViewModelDemoVM.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import Foundation
import Combine
import SwiftUI

class ViewModelDemoVM: ObservableObject {
	
	@Environment(\.managedObjectContext) var managedObjectContext
	
	@FetchRequest(
		// 2.
		entity: Craft.entity(),
		// 3.
		sortDescriptors: [
			NSSortDescriptor(keyPath: \Craft.id, ascending: true)
		]
		//,predicate: NSPredicate(format: "genre contains 'Action'")
		// 4.
	) var spaceCraftsHere: FetchedResults<Craft>

	
	@Published var spaceCraftsLocal = [GetCallsData]()
	
	init () {
		getDetailsFromApi()
	}
	
	func addCraft(id: String) {
		// 1
		let newCraft = Craft(context: managedObjectContext)
		
		// 2
		newCraft.id = id
		
		// 3
		saveContext()
	}
	
	func saveContext() {
		do {
			try managedObjectContext.save()
		} catch {
			print("Error saving managed object context: \(error)")
		}
	}
	
	private func getDetailsFromApi() {
		
		guard let url = URL(string: "https://isro.vercel.app/api/spacecrafts") else {
			return
		}
		
		let request = URLRequest(url: url)
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			
			if let data = data {
				if let decodedResponse = try? JSONDecoder().decode(GetCallsResponse.self, from: data) {
					
					DispatchQueue.main.async {
						self.spaceCraftsLocal = decodedResponse.spacecrafts
						for item in self.spaceCraftsLocal {
							self.addCraft(id: item.id!)
						}
					}
					print(decodedResponse.spacecrafts)
					return
				}
				
				print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
			}
			
		}.resume()
		
		// .resume() is needed for the call to work, else it won't execute
		// by default url calls happen on background thread, although swiftui can update ui based on background threads functions
		// it is safe to send the decoded json data using DispatchQueue
		
	}
}
