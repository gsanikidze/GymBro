//
//  Services.swift
//  GymBro
//
//  Created by sano on 7/22/22.
//

import Foundation

struct Service {
    static func getRequest(endpoint: String, headers: [String: String]? = [:], query: [String: String]? = nil, onSuccess: @escaping (_ rawData: Data) -> Void) {
        var url: URL
        
        if query != nil {
            var urlSt: String = ""
            
            for (key, value) in query! {
                let queryVal = "\(key)=\(value.replacingOccurrences(of: " ", with: "%20"))"
                
                if urlSt.isEmpty {
                    urlSt += "\(endpoint)?\(queryVal)"
                } else {
                    urlSt += "&\(queryVal)"
                }
            }
            
            url = URL(string: urlSt)!
        } else {
            url = URL(string: endpoint)!
        }
        
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
