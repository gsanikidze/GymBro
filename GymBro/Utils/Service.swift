//
//  Services.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation

struct Service {
    static func getRequest(endpoint: String, headers: [String: String]? = [:], onSuccess: @escaping (_ rawData: Data) -> Void) {
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        
        if headers != nil {
            for (key, val) in headers! {
                request.setValue(val, forHTTPHeaderField: key)
            }
        }
        
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
