//
//  UIImageViewExt.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 2/17/19.
//  Copyright © 2019 UsefDev. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloadImage(_ path: String?) {
        
        guard let path = path else { return}
        guard let url = APIManager.createPhotoUrl(from: path, with: .high) else { return }
        
        let cache = NSCache<NSString, UIImage>()
        if let image = cache.object(forKey: NSString.init(string: url.absoluteString)) {
            self.image = image
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            if let error = error {
                print("\n\(error.localizedDescription)\n")
                return
            }
            if let image = UIImage(data: data!) {
                cache.setObject(image, forKey: NSString.init(string: url.absoluteString))
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            }.resume()
    }
    
    
}
