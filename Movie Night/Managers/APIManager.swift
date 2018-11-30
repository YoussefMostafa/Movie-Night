//
//  APIManager.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/11/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    // MARK: - API Props
    
    private let apiKey = "80051a6156d39bded7ae1671f1bc3457"
    private let apiHost = "https://api.themoviedb.org/3"
    
    enum EndPoints: String {
        case nowPlayingMovies = "/movie/now_playing"
    }
    
    // MARK: - Singelton instance
    
    static let shared = APIManager()
    
    // MARK: - Attributes
    
    // MARK: - Initializers
    
    private init() {}
    
    // Mark: - Movies APIRequests
    
    static func getUrl(_ endPoint: EndPoints) -> URL? {
        return URL(string: shared.apiHost+endPoint.rawValue)
    }
    
    static func getNowPlayingMovies(page: Int?, _ completionHandler: @escaping (NowPlayingMovies)->()) {
        let params: [String : Any] = ["api_key": shared.apiKey, "page": page as Any]
        guard let url = getUrl(.nowPlayingMovies) else { return }
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success:
                guard let data = response.data else { return }
                guard let nowPlayingMovies = try? JSONDecoder().decode(NowPlayingMovies.self, from: data) else { return }
                completionHandler(nowPlayingMovies)
            }
        }
    }
    
    
}
