//
//  CraftNameItem.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import Foundation
import SwiftUI

struct CraftNameItem: View {
	let craftName: String?
	
	var body: some View {
		Text(craftName ?? "loading...")
	}
}
