//
//  API_manager.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import Foundation
import Alamofire

class APImanager {
    
    static let shared = APImanager()
    let header: HTTPHeaders = ["Authorization": APIkey.TMDB]
    let baseUrl: String = "https://api.themoviedb.org/3/trending/tv/"
    
    func fetchTVImages(url: String,completehandler: @escaping(([TV]) -> Void)){
        
        let url = baseUrl + "\(url)"
        
        let header = header
        
        AF.request(url, headers: header).responseDecodable(of: TrendModel.self) { response in
            switch response.result {
            case .success(let success):
                print("success", success)
                completehandler(success.results)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
    
//    func fetchRatedMovies(){
//        let url = "https://api.themoviedb.org/3/tv/top_rated"
//        
//        let header:
//    }
}
