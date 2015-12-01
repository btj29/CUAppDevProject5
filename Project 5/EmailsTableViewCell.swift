//
//  EmailsTableViewCell.swift
//  Project 5
//
//  Created by Bernard JIANG on 30/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class EmailsTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDetails(email: String) {
        emailLabel.text = email

    }
}
