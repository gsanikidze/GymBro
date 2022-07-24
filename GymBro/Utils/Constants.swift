//
//  Constants.swift
//  GymBro
//
//  Created by sano on 7/24/22.
//

import Foundation

struct Constants {
    static let API_KEY = Bundle.main.object(forInfoDictionaryKey: "RAPID_API_KEY") as! String
    static let API_BASE_URL = "https://exercisedb.p.rapidapi.com/exercises"
}
