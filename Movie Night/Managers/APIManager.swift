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
        func params() -> [String: Any] {
            switch self {
            case .nowPlayingMovies:
                return ["api_key": shared.apiKey, "page": 1 as Any]
            }
        }
    }
    
    // MARK: - Singelton instance
    
    static let shared = APIManager()
    
    // MARK: - Initializers
    
    private init() {}
    
    // Mark: - Movies APIRequests
    
    private static func createUrl(_ endPoint: EndPoints) -> URL? {
        return URL(string: shared.apiHost+endPoint.rawValue)
    }
    
    static func fetchData<T: Decodable>(endPoint: EndPoints, _ completionHandler: @escaping (_ ç: T?, _ error: Error?)->()) {
        guard let url = createUrl(endPoint) else { return }
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
    
    
}
