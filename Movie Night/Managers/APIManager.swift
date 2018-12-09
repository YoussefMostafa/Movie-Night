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
        case popularMovies = "/movie/popular"
        case topRatedMovies = "/movie/top_rated"
        case upcomming = "/movie/upcoming"
        case onTv = "/tv/on_the_air"
        case airingToday = "/tv/airing_today"
        case popularOnTV = "/tv/popular"
        case topRatedOnTV = "/tv/top_rated"
        
        func params() -> [String: Any] {
            switch self {
            case .nowPlayingMovies:
                return ["api_key": shared.apiKey, "page": 1 as Any, "region": "US"]
            case .popularMovies:
                return EndPoints.nowPlayingMovies.params()
            case .topRatedMovies:
                return EndPoints.nowPlayingMovies.params()
            case .upcomming:
                return EndPoints.nowPlayingMovies.params()
            case .airingToday:
                return EndPoints.nowPlayingMovies.params()
            case .onTv:
                return EndPoints.nowPlayingMovies.params()
            case .popularOnTV:
                return EndPoints.nowPlayingMovies.params()
            case .topRatedOnTV:
                return EndPoints.nowPlayingMovies.params()
            }
        }
    }
    
    // MARK: - Singelton instance
    
    static let shared = APIManager()
    
    // MARK: - Initializers
    
    private init() {}
    
    // Mark: - Movies APIRequests
    
    static func fetchData<T: Decodable>(endPoint: EndPoints, _ completionHandler: @escaping (_ ç: T?, _ error: Error?)->()) {
        guard let url = createRequestUrl(endPoint) else { return }
        Alamofire.request(url, method: .get, parameters: endPoint.params(), encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, error)
            case .success:
                guard let data = response.data else { return }
                guard let nowPlayingMovies = try? JSONDecoder().decode(T.self, from: data) else { return }
                completionHandler(nowPlayingMovies, nil)
            }
        }
    }
    
    // MARK: - Class Methods
    
    static func createPhotoUrl(from path: String?) -> URL? {
        guard let path = path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
    
    private static func createRequestUrl(_ endPoint: EndPoints) -> URL? {
        return URL(string: shared.apiHost+endPoint.rawValue)
    }
    
}
