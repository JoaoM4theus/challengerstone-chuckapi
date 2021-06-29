//
//  FactCell.swift
//  Chuck-Norris-ChallengerStone
//
//  Created by Joao Matheus on 28/06/21.
//

import UIKit

class FactCell: UITableViewCell {
    @IBOutlet weak var descriptionFact: UILabel!
    @IBOutlet weak var categorieFact: UILabel!
    @IBOutlet weak var viewPrincipal: UIView!
    @IBOutlet weak var viewSeparetor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewPrincipal.layer.cornerRadius = frame.size.height / 20
    }
}
