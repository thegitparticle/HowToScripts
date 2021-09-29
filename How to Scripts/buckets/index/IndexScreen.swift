//
//  IndexScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import SwiftUI

struct IndexScreen: View {
	var body: some View {
		NavigationView {
			VStack {
				Text("How to? Scripts").font(.largeTitle)
				Spacer()
				LazyVStack {
					ForEach(indexList, id: \.self) { item in
						indexItemComponent(itemHere: item)
					}
				}
			}
		}
	}
}

struct indexItemComponent: View {
	var itemHere: indexItem

	var body: some View {
		NavigationLink(destination: ScriptPlayScreen(screen: itemHere.screenName)) {
			VStack {
				Text("Row \(itemHere.name)").bold().foregroundColor(.white)
			}.foregroundColor(.clear).padding().frame(maxWidth: .infinity).background(Color.blue.opacity(0.5)).cornerRadius(15)
		}
	}
}

struct IndexScreen_Previews: PreviewProvider {
	static var previews: some View {
		IndexScreen()
	}
}
