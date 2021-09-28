//
//  ScriptPlayScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import SwiftUI

struct ScriptPlayScreen: View {
	let screen: String?
	
    var body: some View {
        Text("scripts are played here")
		if (screen == "GETCallsScreen") {
			GetCallsScreen()
		}
    }
	
	func printSomething () {
		print("something printed by the screen")
	}
}

struct ScriptPlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        ScriptPlayScreen(screen: "GetCallsScreen")
    }
}
