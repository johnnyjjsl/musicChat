//
//  messageRetriever.swift
//  musicChat
//
//  Created by Johnny Sanchez on 9/12/23.
//

import Foundation

class messageRetriever: ObservableObject {
    
    var answerText: [String] = []
    
    init() {
        getMessages()
    }
    
    struct textResponse: Codable {
        let songs: [Songs]
    }
    
    struct StringValue: Codable {
        let value: String
        
        private enum CodingKeys: String, CodingKey {
            case value = "stringValue"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case songs = "documents"
    }
    
    struct Songs: Codable {
        let id: String
        let text: String
        
        private enum SongsKeys: String, CodingKey {
            case fields
        }
        
        private enum FieldsKeys: String, CodingKey {
            case isChatBot
            case id
            case text
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: SongsKeys.self)
            let fieldContainer = try container.nestedContainer(keyedBy: FieldsKeys.self, forKey: .fields)
            text = try fieldContainer.decode(StringValue.self, forKey: .text).value
            id = try fieldContainer.decode(StringValue.self, forKey: .id).value
        }
    }
    
    func getMessages() {
        let url = "https://firestore.googleapis.com/v1/projects/musicchat-fd0af/databases/(default)/documents/years"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data, error == nil else {
                fatalError("No data found")
            }
            
            let response = try? JSONDecoder().decode(textResponse.self, from: data)
            if let response = response {
                self.answerText.append(response.songs[0].text)
            }
        }
        
    }
}
