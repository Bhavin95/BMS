//
//  UIImageExtension.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/23/21.
//

import UIKit

extension UIImage {
    
        public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        completion(UIImage(data: data))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }
        }
}
