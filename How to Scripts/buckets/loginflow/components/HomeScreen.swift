//
//  HomeScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import SwiftUI

struct HomeScreen: View {
	
	@State private var buttonActive: Bool = false
	
	
	var body: some View {
			VStack() {
				Text("You are now inside the Oasis").bold().font(.headline)
				Spacer()
				NavigationLink(destination: WelcomeScreen(),  isActive: $buttonActive) {
					Button(action: {
						UserDefaults.standard.set(false, forKey: "LoginState");
						buttonActive = true
					}) {
						Text("logout").foregroundColor(Color.red)
					}
				}
			}
			.navigationBarHidden(true)
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreen()
	}
}
