//
//  IndexData.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import Foundation

struct indexItem: Hashable {
	var name: String
	var screenName: String
}

var indexList = [indexItem(name: "GET Calls", screenName: "GETCallsScreen"), indexItem(name: "postcalls", screenName: "POSTCallsScreen"), indexItem(name: "log or out", screenName: "LoginNavScreen"), indexItem(name: "view - viewmodel", screenName: "ViewModelDemoScreen") ,indexItem(name: "custom fonts", screenName: "CustomFontsScreen"), indexItem(name: "theming", screenName: "ThemeScreen"), indexItem(name: "images", screenName: "ImageCacheScreen"), indexItem(name: "Lottie", screenName: "LottieDemoScreen")]
