//
//  FactsViewController.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Joao Matheus on 28/06/21.
//

import UIKit

class FactsViewController: UITableViewController {
    @IBOutlet weak var searchFact: UITextField!
    
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
        return viewModel.facts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! FactCell
        let fact = viewModel.facts[indexPath.row]
        cell.descriptionFact.text = fact.value
        
        if !fact.categories!.isEmpty {
            cell.categorieFact.text = fact.categories?[0]
        }
        
        return cell
    }
    
}

extension FactsViewController: ChuckDelegate {
    func finishFetchFacts(facts: [Result]) {
        DispatchQueue.main.async {
            self.viewModel.facts.append(contentsOf: facts)
            self.hideActivity()
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
            self.viewModel.facts.removeAll()
            self.tableView.reloadData()
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        showActivity()
        self.viewModel.fetchFacts(searchFact.text ?? "")
    }
}
