//
//  SearchFactsViewController.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Softbuilder Hibrido on 28/06/21.
//

import UIKit

class SearchFactsViewController: UIViewController {
    var chuckManager = ChuckManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        chuckManager.fetchFacts("Playstation")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
