
//
//  Contracts.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

protocol ElmaNetworkServiceProtocol {
    func getServices(completion: @escaping (Result<ServicesResponse, Error>) -> Void)
}
