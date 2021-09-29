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
		if (screen == "GETCallsScreen") {
			GetCallsScreen()
		} else if (screen == "LoginNavScreen") {
			LoginFlowMainScreen()
		} else if (screen == "ViewModelDemoScreen") {
			ViewModelDemoScreen()
		} else if (screen == "ImageCacheScreen") {
			ImageCacheScreen()
		}
    }
}

struct ScriptPlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        ScriptPlayScreen(screen: "GetCallsScreen")
    }
}
