//
//  ChuckManager.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Softbuilder Hibrido on 28/06/21.
//

import Foundation

struct RequestManager {
    static let shared = RequestManager()
    
    func performRequest(with urlString: String){
        //1. Create a URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in

                if error != nil {
                    print("error1")
                    return
                }
                
                if let safeData = data {
                    parseJSON(safeData)
                }
            }
            
            //4. Start the task
            task.resume()
            
        }
    }
    
    func parseJSON(_ chuckData: Data) {
        let decoder = JSONDecoder()
        do {
            if let decodedData = try? decoder.decode(Response.self, from: chuckData) {
                
            }
        }
    }
    
}