//
//  musicChatApp.swift
//  musicChat
//
//  Created by Johnny Sanchez on 9/11/23.
//

import SwiftUI
import Firebase

@main
struct musicChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
