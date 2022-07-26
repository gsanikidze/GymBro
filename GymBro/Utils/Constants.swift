//
//  Constants.swift
//  GymBro
//
//  Created by sano on 7/24/22.
//

import Foundation

struct Constants {
    static let EXERCISE_API_KEY = Bundle.main.object(forInfoDictionaryKey: "EXERCISE_RAPID_API_KEY") as! String
    static let EXERCISE_API_BASE_URL = "https://exercisedb.p.rapidapi.com/exercises"
    
    static let EXERCISE_API_HEADERS = [
        "X-RapidAPI-Key": Constants.EXERCISE_API_KEY,
        "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
    ]
}
