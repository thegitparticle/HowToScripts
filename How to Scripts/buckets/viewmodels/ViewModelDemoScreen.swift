//
//  ViewModelDemoScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import SwiftUI

struct ViewModelDemoScreen: View {
	@StateObject private var viewModel = ViewModelDemoVM()
	
	var body: some View {
		
//		List(viewModel.$spacecrafts)
		
		List(viewModel.spacecraftsList, id: \.id) { item in
			
			VStack(alignment: .leading) {
				Text(item.id ?? "loading ..." )
					.font(.headline)
			}
			
		}
		
		if (viewModel.spacecraftsList.count > 0) {
			Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
		} else {
			Text("still loading, bruh!")
		}
		
	}
}

struct ViewModelDemoScreen_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelDemoScreen()
    }
}
