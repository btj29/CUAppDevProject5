//
//  NameTableViewCell.swift
//  Project 5
//
//  Created by Bernard JIANG on 30/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var fnameLabel: UITextField!
    @IBOutlet weak var lnameLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        photoView.layer.cornerRadius = 10
        photoView.clipsToBounds = true
        // Configure the view for the selected state
    }

    func setDetails(person: Person) {
        photoView.image = person.photo
        fnameLabel.text = person.first
        lnameLabel.text = person.last
    }
    
}
