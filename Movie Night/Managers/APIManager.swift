//
//  APIManager.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/11/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

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
        
        func params(_ page: Int = 1) -> [String: Any] {
            switch self {
            case .nowPlayingMovies:
                return ["api_key": shared.apiKey, "page": page as Any, "region": "US"]
            case .popularMovies:
                return EndPoints.nowPlayingMovies.params(page)
            case .topRatedMovies:
                return EndPoints.nowPlayingMovies.params(page)
            case .upcomming:
                return EndPoints.nowPlayingMovies.params(page)
            case .airingToday:
                return EndPoints.nowPlayingMovies.params(page)
            case .onTv:
                return EndPoints.nowPlayingMovies.params(page)
            case .popularOnTV:
                return EndPoints.nowPlayingMovies.params(page)
            case .topRatedOnTV:
                return EndPoints.nowPlayingMovies.params(page)
            }
        }
    }
    
    enum PosterQuality: String {
        case low = "w185"
        case high = "w342"
        case veryHigh = "w500"
        
        var value: String { return self.rawValue }
    }
    
    // MARK: - Singelton instance
    
    static let shared = APIManager()
    
    // MARK: - Initializers
    
    private init() {}
    
    // Mark: - Movies APIRequests
    
    static func fetchData<T: Decodable>(in page: Int = 1, _ endPoint: EndPoints, _ completionHandler: @escaping (_ data: T?, _ error: Error?)->()) {
        guard let url = createRequestUrl(endPoint) else { return }
        Alamofire.request(url, method: .get, parameters: endPoint.params(page), encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, error)
            case .success:
                guard let data = response.data else { return }
                guard let requestedData = try? JSONDecoder().decode(T.self, from: data) else { return }
                completionHandler(requestedData, nil)
            }
        }
    }
    
    // MARK: - Class Methods
    
    private static func createRequestUrl(_ endPoint: EndPoints) -> URL? {
        return URL(string: shared.apiHost+endPoint.rawValue)
    }
    
    static func createPhotoUrl(from path: String?, with quality: PosterQuality) -> URL? {
        guard let path = path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/\(quality.value)\(path)")
    }
    
}
