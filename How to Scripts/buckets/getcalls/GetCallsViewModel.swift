//
//  GetCallsViewModel.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import Foundation

//class GetCallsViewModel: ObservableObject, Identifiable {
//
//	@State private var spaceCraftsHere = [GetCallsData]()
//
//	init () {
//		getDetailsFromApi()
//	}
//
//	@Published var listOfCrafts: [GetCallsData] = []
//
//	private var craftItem: GetCallsData?
//
//	var id: String {
//		craftItem?.id ?? ""
//	}
//
//	private func getDetailsFromApi() {
//
//		guard let url = URL(string: "https://isro.vercel.app/api/spacecrafts") else {
//			return
//		}
//
//		let request = URLRequest(url: url)
//
//		URLSession.shared.dataTask(with: request) { data, response, error in
//
//			if let data = data {
//				if let decodedResponse = try? JSONDecoder().decode(GetCallsResponse.self, from: data) {
//
//					DispatchQueue.main.async {
//						self.spaceCraftsHere = decodedResponse.spacecrafts
//					}
//					print(decodedResponse.spacecrafts)
//					return
//				}
//
//				print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//			}
//
//		}.resume()
//
//		// .resume() is needed for the call to work, else it won't execute
//		// by default url calls happen on background thread, although swiftui can update ui based on background threads functions
//		// it is safe to send the decoded json data using DispatchQueue
//
//	}
//}
