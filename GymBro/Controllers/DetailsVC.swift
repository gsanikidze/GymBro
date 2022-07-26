//
//  DetailsVC.swift
//  GymBro
//
//  Created by sano on 7/26/22.
//

import Foundation

extension Details {
    class ViewController: ObservableObject {
        @Published var videos: [YoutubeVideo] = []
        
        func fetchVideos(_ workout: Workout) {
            let query = [
                "q": "workout \(workout.name!)",
                "part": "snippet,id",
                "regionCode": "US",
                "maxResults": "50",
                "order": "date"
            ]
            
            Service.getRequest(endpoint: "\(Constants.YOUTUBE_API_BASE_URL)/search", headers: Constants.YOUTUBE_API_HEADERS, query: query) { data in
                do {
                    let parsedData = try JSONDecoder().decode(YoutubeResult.self, from: data)
                    
                    self.videos = parsedData.items
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
