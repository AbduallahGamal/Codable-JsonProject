//
//  NetwokJson.swift
//  Codable+JsonProject
//
//  Created by Abdalla on 2/22/20.
//  Copyright © 2020 edu.data. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func getDataFromServer(path: String, callback: @escaping ((Data) -> ())) {
        
        let serverUrl = "https://restcountries.eu/rest/v2/"
        
        let url = URL(string: serverUrl + "lang/ar")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                //self.handleClientError(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print(response as Any)
                    //self.handleServerError(response)
                    return
            }
            if let data = data{
                _ = String(data: data, encoding: .utf8)
                callback(data)
            }
        }
        task.resume()
    }
}
