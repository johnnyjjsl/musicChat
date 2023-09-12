//
//  ContentView.swift
//  musicChat
//
//  Created by Johnny Sanchez on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    var messages = ["Show me songs from 1963", "How was the year 1979?", "1980"]
    var body: some View {
        VStack {
            HStack {
                Image("playstore").resizable().frame(width: 128, height: 128)
                Text("musicChat").font(.largeTitle).bold()
            }
            ScrollView {
                ForEach(messages, id: \.self) {
                    text in TextMessage(message: Message(id: "0000", text: text, isChatBot: false))
                }
            }
            
            HStack {
                TextField("Ask for any year!", text: $messageText)
                    .padding().background(Color.gray.opacity(0.2))
                    .cornerRadius(10).onSubmit {
                    
                }
                
                Button {
                    
                } label: {
                    Image("music note").resizable().frame(width: 80, height: 80)
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
