//
//  HeaderTableViewCell.swift
//  Project 5
//
//  Created by Bernard JIANG on 30/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var bkgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

    func setDetails(headerText: String) {
        headerLabel.text = headerText
    }
}
