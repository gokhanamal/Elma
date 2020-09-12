//
//  ElmaService.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class ElmaNetworkService: ElmaNetworkServiceProtocol {
    enum Endpoints {
       static let baseURL = "https://my-json-server.typicode.com/engincancan/case"
        
       case getServices
       case getService(Int)
        
       var url: URL {
           return URL(string: self.stringValue)!
       }
       
       var stringValue: String {
           switch self {
           case .getServices:
               return Endpoints.baseURL + "/home"
           case .getService(let id):
               return Endpoints.baseURL + "/service/\(id)"
           }
       }
    }
    
    func getServices(completion: @escaping (Result<ServicesResponse, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: Endpoints.getServices.url){(data, _, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ServicesResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func getService(id: Int, completion: @escaping (Result<ServiceDetailsResponse, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: Endpoints.getService(id).url){(data, _, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ServiceDetailsResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
