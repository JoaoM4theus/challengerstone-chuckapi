//
//  ChuckViewModels.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Softbuilder Hibrido on 28/06/21.
//

import Foundation

protocol ChuckDelegate: AnyObject {
    func finishFetchFacts(facts: [Result])
    func failFetchingFacts(errorMessage: String)
}

class ChuckViewModel {
    let chuckURL = ChuckAPIURL.getFact.rawValue
    weak var delegate: ChuckDelegate?
    
    func fetchFacts(_ result: String){
        let urlString = "\(chuckURL)=\(result)"
        RequestManager.shared.performRequest(with: urlString) { [weak self] (data, error) in
            guard let data = data else { return }
            if error == nil {
                let decoder = JSONDecoder()
                if let response = try? decoder.decode(Response.self, from: data) {
                    let facts = response.result
                    print(facts)
                    self?.delegate?.finishFetchFacts(facts: facts)
                }
            } else {
                self?.delegate?.failFetchingFacts(errorMessage: "Nenhum fato foi encontrado. Tente novamente!")
            }
        }
        
    }
}
