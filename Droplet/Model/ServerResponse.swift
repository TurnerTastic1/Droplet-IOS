//
//  ResponseGlobal.swift
//  Droplet
//
//  Created by Turner Naef on 1/5/24.
//

import Foundation

//MARK: Root Response model
//struct RootStatusResponse: Codable {
//    let code: Int
//    let message: String
//    let status: Bool
//    let data: Data
//    
//    struct Data: Codable {
//        let version: String
//    }
//}
//
//struct rootDataClass: Codable {
//    let version: String
//}

//MARK: Register

//MARK: Authenticate

struct ResponseGlobal: Decodable {
    let code: Int
    let message: String
    let status: Bool
    let data: [String: Any]
    
    enum CodingKeys: String, CodingKey {
        case code, message, status, data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(Int.self, forKey: .code)
        message = try container.decode(String.self, forKey: .message)
        status = try container.decode(Bool.self, forKey: .status)
        let dataContainer = try container.nestedContainer(keyedBy: GenericCodingKeys.self, forKey: .data)
        var dataDict: [String: Any] = [:]
        for key in dataContainer.allKeys {
            if let intValue = try? dataContainer.decode(Int.self, forKey: key) {
                dataDict[key.stringValue] = intValue
            } else if let stringValue = try? dataContainer.decode(String.self, forKey: key) {
                dataDict[key.stringValue] = stringValue
            }
            // Add here any other types you want to support
        }
        data = dataDict
    }
}

struct GenericCodingKeys: CodingKey {
    var intValue: Int?
    var stringValue: String

    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "\(intValue)"
    }

    init?(stringValue: String) {
        self.stringValue = stringValue
    }
}
