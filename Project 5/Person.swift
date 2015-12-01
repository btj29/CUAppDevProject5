//
//  Person.swift
//  Project 5
//
//  Created by Bernard JIANG on 27/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class Person: NSObject {

    var first: String
    var last: String
    var phone: String
    var emails: [String]
    var photo: UIImage? = nil
    
    func fullName() -> String {
        return "\(first) \(last)"
    }
    
    init(first: String, last: String, phone: String, emails: [String], photo: String) {
        self.first = first
        self.last = last
        self.phone = phone
        self.emails = emails
        
        let url = NSURL(string: photo)!
        guard let photo = NSData(contentsOfURL: url) else { return }
        guard let image = UIImage(data: photo) else { return }
        self.photo = image
    }
}
