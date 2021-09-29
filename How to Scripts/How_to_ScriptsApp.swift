//
//  How_to_ScriptsApp.swift
//  How to Scripts
//
//  Created by SAN on 9/28/21.
//

import SwiftUI

@main
struct How_to_ScriptsApp: App {
    let persistenceController = PersistenceController.shared
	
	@Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            IndexScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
		.onChange(of: scenePhase) { _ in
			persistenceController.save()
		}
    }
}
