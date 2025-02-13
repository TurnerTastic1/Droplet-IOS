//
//  ServerManager.swift
//  Droplet
//
//  Created by Turner Naef on 12/30/23.
//

import Foundation
import UIKit

final class ServerManager: ObservableObject {
    
    static let shared = ServerManager()
    
    //MARK: Server status
    @Published var serverStatus: Bool = true
    
    //MARK: Server URL
    private static let serverURL = "http://localhost:8080/FitNetServer/api/v1/"
    
    //MARK: Server Endpoints
    private let rootStatusEndpoint = serverURL + "root-status"
    private let registerEndpoint = serverURL + "auth/register"
    private let authEndpoint = serverURL + "auth/authenticate"
    private let completeWorkoutEndpoint = serverURL + "user-workout/complete-workout"
    
    private init() {}
    
    //MARK: Basic validation of Data, Response and Error
    private func handleResponse(data: Data?, response: URLResponse?, error:Error?) -> Data? {
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
    func rootStatusCheckService(completed: @escaping (Result<ResponseGlobal<ServerRootResponse.Data>, StandardNetworkError>) -> Void) {
        //MARK: Check if actual URL
        guard let url = URL(string: rootStatusEndpoint) else {
            print("Error - Invalid server URL")
            completed(.failure(.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = self.handleResponse(data: data, response: response, error: error) else {
                completed(.failure(.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ResponseGlobal<ServerRootResponse.Data>.self, from: data)
                self.serverStatus = decodedResponse.status
                print(decodedResponse)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
                print("Error - data corrupted")
                return
            }
        }
        
        task.resume()
        
        return
    }
    
    //MARK: Register endpoint service - POST
    func registerNewUserService(registerItem: RegisterItem, completed: @escaping (Result<ResponseGlobal<RegisterUserResponse.Data>, StandardNetworkError>) -> Void) {
        //MARK: Check if actual URL
        guard let url = URL(string: registerEndpoint) else {
            print("Error - Invalid server URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(registerItem)
            request.httpBody = jsonData
        } catch {
            completed(.failure(.invalidRequestData))
            print("Error - could not encode request")
            return
        }
        
        // Set Content-Type
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let resData = self.handleResponse(data: data, response: response, error: error) else {
                
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(ResponseGlobal<ServerErrorResponse.Data>.self, from: data ?? Data())
                    print(decodedResponse)
                } catch {
                    print("Could not parse error data")
                }
                
                completed(.failure(.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ResponseGlobal<RegisterUserResponse.Data>.self, from: resData)
                self.serverStatus = decodedResponse.status
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
                print("Error - data corrupted")
                return
            }
        }
        
        task.resume()
        
        return
    }
    
    //MARK: Authenticate endpoint service - POST
    
    //MARK: Complete A Workout endpoint service - POST
    func completeWorkoutService(completedWorkoutItem: CompletedWorkout, jwtToken: String, completed: @escaping (Result<ResponseGlobal<CompleteWorkoutResponse.Data>, StandardNetworkError>) -> Void) {
        //MARK: Check if actual URL
        guard let url = URL(string: completeWorkoutEndpoint) else {
            print("Error - Invalid server URL")
            return
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        //MARK: Check if token is present - add to request if it is
        guard !jwtToken.isEmpty else {
            print("Invalid or missing token")
            completed(.failure(.invalidRequestData))
            return
        }
        
        request.addValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(completedWorkoutItem)
            request.httpBody = jsonData
        } catch {
            print("Error - could not encode request")
            completed(.failure(.invalidRequestData))
            return
        }
        
        // Set Content-Type
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let resData = self.handleResponse(data: data, response: response, error: error) else {
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(ResponseGlobal<ServerErrorResponse.Data>.self, from: data ?? Data())
                    print(decodedResponse)
                } catch {
                    print("Could not parse error data")
                }
                
                completed(.failure(.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ResponseGlobal<CompleteWorkoutResponse.Data>.self, from: resData)
                self.serverStatus = decodedResponse.status
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
                print("Error - data corrupted")
                return
            }
        }
        
        task.resume()
        
        return
    }
    
    //MARK: User Completed Workouts endpoint service - GET
    func getUserCompletedWorkoutsService() {
        //MARK: Check if actual URL
        guard let url = URL(string: completeWorkoutEndpoint + "user-workouts") else {
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
                let decodedResponse = try decoder.decode(ResponseGlobal<ServerRootResponse.Data>.self, from: data)
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
