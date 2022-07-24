//
//  Services.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation

//https://exercisedb.p.rapidapi.com/exercises
//https://exercisedb.p.rapidapi.com/exercises

struct Service {
    static func getRequest(_ endpoint: String, _ onSuccess: @escaping (_ rawData: Data) -> Void) {
        var urlString = Constants.API_BASE_URL
        
        if (!endpoint.isEmpty) {
            urlString += "/\(endpoint)"
        }
        
        let url = URL(string: urlString)!
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
