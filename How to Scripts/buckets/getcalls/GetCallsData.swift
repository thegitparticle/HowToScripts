//
//  GetCallsData.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import Foundation

struct GetCallsResponse: Codable {
	var spacecrafts: [GetCallsData]
}

struct GetCallsData: Codable {
	var id: String?
}
