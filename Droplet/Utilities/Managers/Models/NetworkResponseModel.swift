//
//  ResponseGlobal.swift
//  Droplet
//
//  Created by Turner Naef on 1/5/24.
//

import Foundation

//MARK: Server standard response model - data object not included but passed in through variable T
// T must conform to decodable but it allows for all server response models to conform to ResponseGlobal and then alter the data field
struct ResponseGlobal<T: Decodable>: Decodable {
    let code: Int
    let message: String
    let status: Bool
    let timestamp: Int64
    
    let data: T
}

struct ResponseGlobalNoData: Decodable {
    let code: Int
    let message: String
    let status: Bool
    let timestamp: Int64
}

//MARK: Server Root Response model
struct ServerRootResponse: Decodable {
    struct Data: Decodable {
        let versionData: String
        
        enum CodingKeys: String, CodingKey {
            case versionData = "versionData"
        }
    }
}

//MARK: Register Response Model
struct RegisterUserResponse: Decodable {
    struct Data: Decodable {
        let auth: Auth
        
        struct Auth: Decodable {
            let accessToken: String
            
            enum CodingKeys: String, CodingKey {
                case accessToken = "access_token"
            }
        }
    }
}



//MARK: Authenticate Response Model

//MARK: Complete Workout Response Model
struct CompleteWorkoutResponse: Decodable {
    struct Data: Decodable {
        let message: String
        let user: String
    }
}

//MARK: Error Response Data Model
struct ServerErrorResponse: Decodable, Error {
    struct Data: Decodable {
        let message: String
        let errors: [ErrorDetail]
        
        struct ErrorDetail: Decodable {
            let errorMessages: [String]?
            let defaultMessage: String?
            
            let codes: [String]?
            let arguments: [Argument]?
            let objectName: String?
            let field: String?
            let rejectedValue: String?
            let bindingFailure: Bool?
            let code: String?
        }
        
        struct Argument: Decodable {
            let codes: [String]?
            let arguments: String?
            let defaultMessage: String?
            let code: String?
        }
        
        enum CodingKeys: String, CodingKey {
            case message = "message"
            case errors = "errors"
        }
    }
}


//MARK: Error cases - represented as enums for errors thrown in ServerManager
enum StandardNetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case invalidRequestData
}

enum NetworkAuthError: Error {
    case usernameNotFound
    case usernameAlreadyExists
    case emailNotFound
    case emailAlreadyExists
    case passwordDoesNotMatch
}


/**
 // Code here used for possible expansion in reading/decoding a server response
 // It removes the need to write models for each endpoint
 // However it is extremely complex and for this use would actually have negative affects
 // Data type and amount is not always the same and therefore this code would be extremely exhaustive to hold all cases
 // In its basic form it can interpret nested JSON data from Ints and Strings - does not interpret more nested JSON data - would need more complex code for that and loops (UGH)
 
 
 // CODE
 
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
 
 
 */
