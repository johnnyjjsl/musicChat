//
//  Text.swift
//  musicChat
//
//  Created by Johnny Sanchez on 9/11/23.
//

import SwiftUI

struct TextMessage: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: message.isChatBot ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.isChatBot ? .green: .blue)
                    .cornerRadius(30)
            }.frame(maxWidth: 300, alignment: message.isChatBot ? .leading: .trailing)
        }
    }
}

struct TextMessage_Previews: PreviewProvider {
    static var previews: some View {
        TextMessage(message: Message(id: "00000", text: "Hello World!", isChatBot: false))
    }
}
