//
//  WelcomeScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import SwiftUI

struct WelcomeScreen: View {
	
	@State private var buttonActive: Bool = false
	
	var body: some View {

			VStack() {
				Text("Welcome to Oasis!")
				Spacer()
				NavigationLink(destination: HomeScreen(),  isActive: $buttonActive) {
					Button(action: {
						UserDefaults.standard.set(true, forKey: "LoginState");
						buttonActive = true
					}) {
						Text("login").foregroundColor(Color.green)
					}
				}
			}
			.navigationBarHidden(true)
	}
}

//private struct ButtonHere: View {
//	var body: some View {
//
//		Button(action: {
//			UserDefaults.standard.set(true, forKey: "LoginState");
//			goesToDetail = true
//		}) {
//			Text("login").foregroundColor(Color.green)
//		}
//
//	}
//}

struct WelcomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeScreen()
	}
}
