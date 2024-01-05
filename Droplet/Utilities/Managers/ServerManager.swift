//
//  ServerManager.swift
//  Droplet
//
//  Created by Turner Naef on 12/30/23.
//

import Foundation
import UIKit

final class ServerManager {
    
    static let shared = ServerManager()
    
    static let serverURL = "http://localhost:8080/FitNetServer/api/v1/"
    
    //MARK: Server Endpoints
    private let rootStatusEndpoint = serverURL + "root-status"
    private let registerEndpoint = serverURL + "auth/register"
    private let authEndpoint = serverURL + "auth/authenticate"
    private let completedWorkoutEndpoint = serverURL + "user-workout/"
    
    private init() {}
    
    //MARK: Basic validation of Data, Response and Error
    func handleResponse(data: Data?, response: URLResponse?, error:Error?) -> Data? {
        if let _ = error {
            print("Error - error trying to complete fetch to server")
            return nil
        }
        
        guard let response = response as? HTTPURLResponse else {
            print("Error - error trying to fetch response from server")
            return nil
        }
        
        if response.statusCode == 403 {
            print("Error - received 403 Forbidden status code")
            return nil
        }
        
        guard response.statusCode == 200 else {
            print("Error - received unexpected status code: \(response.statusCode)")
            return nil
        }
        
        guard let data = data else {
            print("Error - error trying to get data from response")
            return nil
        }
        
        return data
    }
    
    //MARK: Root status endpoint service - GET
    func rootStatusCheckService() {
        //MARK: Check if actual URL
        guard let url = URL(string: rootStatusEndpoint) else {
            print("Error - Invalid server URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = self.handleResponse(data: data, response: response, error: error) else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ResponseGlobal.self, from: data)
                print(decodedResponse)
            } catch {
                print("Error - data corrupted")
                return
            }
        }
        
        task.resume()
        
        return
    }
    
    //MARK: Register endpoint service - POST
    
    //MARK: Authenticate endpoint service - POST
    
    //MARK: User Completed Workouts endpoint service - GET
    func getUserCompletedWorkoutsService() {
        //MARK: Check if actual URL
        guard let url = URL(string: completedWorkoutEndpoint + "user-workouts") else {
            print("Error - Invalid server URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmVMaWZ0cyIsImlhdCI6MTcwNDQ5NDE1OSwiZXhwIjoxNzA0NTgwNTU5fQ.THtk9daJobQWnaR1OYyAMWIYLCQJgUBt_0BR5Z64Un0")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = self.handleResponse(data: data, response: response, error: error) else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ResponseGlobal.self, from: data)
                print(decodedResponse)
            } catch {
                print("Error - data corrupted")
                return
            }
        }
        
        task.resume()
        
        return
    }
}
