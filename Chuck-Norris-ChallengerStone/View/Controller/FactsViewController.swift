//
//  FactsViewController.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Softbuilder Hibrido on 28/06/21.
//

import UIKit

class FactsViewController: UITableViewController {
    @IBOutlet weak var searchFact: UITextField!
    var facts = [Result]()
    
    lazy var viewModel: ChuckViewModel = {
        let obj = ChuckViewModel()
        obj.delegate = self
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFact.delegate = self
        tableView.register(UINib(nibName: "FactCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! FactCell
        cell.descriptionFact.text = facts[indexPath.row].value
        return cell
    }
    
}

extension FactsViewController: ChuckDelegate {
    func finishFetchFacts(facts: [Result]) {
        DispatchQueue.main.async {
            self.facts.append(contentsOf: facts)
            self.tableView.reloadData()
        }
    }
    
    func failFetchingFacts(errorMessage: String) {
        print(errorMessage)
    }
}

extension FactsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchFact.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            self.facts.removeAll()
            self.tableView.reloadData()
            textField.placeholder = "Search fact"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.viewModel.fetchFacts(searchFact.text ?? "")
    }
}
