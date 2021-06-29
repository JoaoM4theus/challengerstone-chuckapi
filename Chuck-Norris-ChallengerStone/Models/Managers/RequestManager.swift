//
//  ChuckManager.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Softbuilder Hibrido on 28/06/21.
//

import Foundation

struct RequestManager {
    static let shared = RequestManager()
    
    func performRequest(with urlString: String, completion: @escaping (Data?, String?) -> Void ){
        if let request = URL(string: urlString) {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: request) { (data, response, error) in
                guard let _ = error else {
                    completion(data, nil)
                    return
                }
                completion(nil, error.debugDescription)
            }
            
            task.resume()
            
        }
    }
}
