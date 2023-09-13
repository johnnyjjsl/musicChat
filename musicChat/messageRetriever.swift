//
//  messageRetriever.swift
//  musicChat
//
//  Created by Johnny Sanchez on 9/12/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class messageRetriever: ObservableObject {
    @Published private(set) var botMessages: [Message] = []
    let db = Firestore.firestore()
    
    init() {
        getMessage()
    }
    
    func getMessage() {
        db.collection("years").addSnapshotListener{ querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Something went wrong.")
                return
            }
            
            self.botMessages = documents.compactMap{ document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Something went wrong.")
                    return nil
                }
            }
        }
    }
    
    func sendResponse(message: String, bots: [Message]) -> String {
        for bot in bots {
            let yearNum = bot.text.firstIndex(of: "!")!
            let year = bot.text[...(yearNum)]
            if year == message {
                return bot.text
            }
        }
        return "Enter a valid year."
    }
}
