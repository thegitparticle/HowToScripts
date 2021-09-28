//
//  GetCallsApi.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import Foundation


//class GetCallsApi {
//
//	static func loadData(url: URL, completion: @escaping ([GetCallsResponse`]?) -> ()) {
//
//		URLSession.shared.dataTask(with: url) { data, response, error in
//
//			guard let data = data, error == nil else {
//				completion(nil)
//				return
//			}
//
//			if let response  = try? JSONDecoder().decode([GetCallsResponse].self, from: data) {
//				DispatchQueue.main.async {
//					completion(response)
//				}
//			}
//		}.resume()
//	}
//}
