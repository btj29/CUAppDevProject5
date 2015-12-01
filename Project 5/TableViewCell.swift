//
//  TableViewCell.swift
//  Project 5
//
//  Created by Bernard JIANG on 27/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        pictureView.layer.cornerRadius = 10
        pictureView.clipsToBounds = true
    }
    
    func setPerson(person: Person) {
        nameLabel.text = person.fullName()
        phoneLabel.text = person.phone
        emailsLabel.text = person.emails.joinWithSeparator(", ")
        pictureView.image = person.photo
    }

}
