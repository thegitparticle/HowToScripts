//
//  IndexScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import SwiftUI

struct IndexScreen: View {
	
	var body: some View {
		Text("How to? Scripts").font(.largeTitle)
		Spacer()
		LazyVStack() {
			ForEach(indexList,id: \.self) { item in
				VStack() {
					Text("Row \(item.name)").bold().foregroundColor(.white)
				}.foregroundColor(.clear).padding().frame(maxWidth: .infinity).background(Color.blue.opacity(0.5)).cornerRadius(15)
			}
		}
	}
}

struct IndexScreen_Previews: PreviewProvider {
	static var previews: some View {
		IndexScreen()
	}
}
