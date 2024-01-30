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
    
    func fetchTrendMovieImages(completehandler: @escaping(([Movie]) -> Void)){
        let url = "https://api.themoviedb.org/3/trending/movie/week?language=ko-KR"
        
        let header: HTTPHeaders = ["Authorization": APIkey.TMDB]
        
        AF.request(url, headers: header).responseDecodable(of: TrendModel.self) { response in
            switch response.result {
            case .success(let success):
//                print("success", success)
                completehandler(success.results)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}
