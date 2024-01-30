//
//  RatedMovieModel.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import Foundation

struct RatedMovieModel: Decodable {
    let page: Int
    let results: [Rated_Movie]
}

struct Rated_Movie: Decodable {
    let id: Int
    let name: String
    let poster: String
    let rate: String
    
    enum CodingKeys: String,CodingKey {
        case id
        case name
        case poster = "poster_path"
        case rate = "vote_average"
    }
}
