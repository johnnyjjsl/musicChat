//
//  message.swift
//  musicChat
//
//  Created by Johnny Sanchez on 9/11/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var isChatBot: Bool
}
