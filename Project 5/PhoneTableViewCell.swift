//
//  PhoneTableViewCell.swift
//  Project 5
//
//  Created by Bernard JIANG on 30/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class PhoneTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDetails(person: Person) {
        phoneLabel.text = person.phone
    }
    
}
