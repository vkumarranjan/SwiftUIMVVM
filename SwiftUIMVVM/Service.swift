//
//  Service.swift
//  SwiftUIMVVM
//
//  Created by Vinay Nation on 08/08/21.
//

import Foundation

protocol DataService {
    func getUsers(completion: @escaping ([User]) -> Void)
}

class AppDataService: DataService {
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        DispatchQueue.main.async {
        completion([
            User(id: 1, name: "Vinay"),
            User(id: 2, name: "Radha"),
            User(id: 3, name: "Dimpi")
        ])
      }
    }
}
