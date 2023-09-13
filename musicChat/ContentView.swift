//
//  ContentView.swift
//  musicChat
//
//  Created by Johnny Sanchez on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State private var mr = messageRetriever()
    @State var messages = ["Type in a year."]
    
    var body: some View {
        VStack {
            HStack {
                Image("playstore").resizable().frame(width: 128, height: 128)
                Text("musicChat").font(.largeTitle).bold()
            }
            
            ScrollView {
                ForEach(messages, id:\.self) { message in
                    if message.contains("user") {
                        let nmessage = message.replacingOccurrences(of: "user", with: "")
                       TextMessage(message: Message(id: "00", text: nmessage, isChatBot: false))
                    } else {
                        TextMessage(message: Message(id: "11", text: message, isChatBot: true))
                    }
                    
                }
            }
            
            HStack {
                TextField("Ask for any year!", text: $messageText)
                    .padding().background(Color.gray.opacity(0.2))
                    .cornerRadius(35).onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image("music note").resizable().frame(width: 80, height: 80)
                }
            }.padding()
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("user" + message)
            self.messageText = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    messages.append(mr.sendResponse(message: message, bots: mr.botMessages))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
