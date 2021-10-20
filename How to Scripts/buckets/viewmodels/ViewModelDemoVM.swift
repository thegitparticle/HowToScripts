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
	
	@Published var spacecraftsList = [SpaceCraft]()
	
	private var cancellable: AnyCancellable?
	
	init(spacecraftPublisher: AnyPublisher<[SpaceCraft], Never> = SpaceCraftStore.shared.spacecrafts.eraseToAnyPublisher()) {
		print("debugcoredata us`erdetailspublisher init workng before channcellable")
		cancellable = spacecraftPublisher.sink { [unowned self] spacecrafts in
			self.spacecraftsList = spacecrafts
		}
		print("debugcoredata userdetailspublisher init workng after channcellable")
		getDetailsFromApi()
	}
	
	func addSpaceCraft(craft: GetCallsData) {
		SpaceCraftStore.shared.add(id: craft.id ?? 0, name: craft.name ?? "")
	}
	
	func deleteCourse(craft: GetCallsData) {
		SpaceCraftStore.shared.delete(id: craft.id ?? 0, name: craft.name ?? "")
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
						for item in decodedResponse.spacecrafts {
							self.addSpaceCraft(craft: item)
						}
					}
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
