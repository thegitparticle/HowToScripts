//
//  LoginFlowMainScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import SwiftUI

struct LoginFlowMainScreen: View {
	
	@State private var loginState = UserDefaults.standard.integer(forKey: "LoginState")
	
    var body: some View {
		NavigationView {
		if (loginState != 0) {
			HomeScreen()
		} else {
			WelcomeScreen()
		}
		}
		.navigationBarHidden(true)
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginFlowMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginFlowMainScreen()
    }
}
