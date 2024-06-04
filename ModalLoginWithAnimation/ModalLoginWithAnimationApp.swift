//
//  ModalLoginWithAnimationApp.swift
//  ModalLoginWithAnimation
//
//  Created by KARMANI Aziza on 11/09/2023.
//

import SwiftUI

@main
struct ModalLoginWithAnimationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
