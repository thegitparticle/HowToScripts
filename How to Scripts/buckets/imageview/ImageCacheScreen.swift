//
//  ImageCacheScreen.swift
//  How to Scripts
//
//  Created by SAN on 9/29/21.
//

import SwiftUI
import Kingfisher

struct ImageCacheScreen: View {
	var body: some View {
		NavigationView {
		ScrollView{
			VStack() {
				Text("images below").bold()
				KFImage.url(URL(string: "https://i.imgur.com/Du05lL3.jpeg")!)
				KFImage.url(URL(string: "https://i.imgur.com/3LXoTY3.jpeg")!)
				KFAnimatedImage.url(URL(string: "https://aye-media-bucket.s3.us-west-2.amazonaws.com/default_chat_images/default_ok.gif")!)
			}
		}
		}.transition(.opacity)
	}
}

// https://i.imgur.com/Du05lL3.jpeg
// https://i.imgur.com/3LXoTY3.jpeg
// https://i.imgur.com/tsGnAsV.mp4

struct ImageCacheScreen_Previews: PreviewProvider {
	static var previews: some View {
		ImageCacheScreen()
	}
}
