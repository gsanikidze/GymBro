//
//  Services.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation

struct Service {
    static func getRequest(_ endpoint: String, _ onSuccess: @escaping (_ rawData: Data) -> Void) {
        let url = URL(string: "\(Constants.API_BASE_URL)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.setValue(Constants.API_KEY, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("exercisedb.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        let task = URLSession.shared.dataTask(with: request) { data, res, error in
            if (error != nil) {
                print(error!.localizedDescription)
                return
            }
            
            if let rawData = data {
                onSuccess(rawData)
            }
        }
        
        task.resume()
    }
}
