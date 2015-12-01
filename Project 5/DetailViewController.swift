//
//  DetailViewController.swift
//  Project 5
//
//  Created by Bernard JIANG on 28/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
        
    var person: Person!
    var index: Int!
    var nameCell: NameTableViewCell!
    var phoneCell: PhoneTableViewCell!
    var emailCells: [EmailsTableViewCell] = []
    var addEmailCell: addEmailTableViewCell!
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return person.emails.count + 1
        }
        
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch(indexPath.section) {
        case 0:
            let cell2 = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! NameTableViewCell
            
            cell2.setDetails(person)
            nameCell = cell2
            cell = cell2
            
        case 1:
            let cell2 = tableView.dequeueReusableCellWithIdentifier("PhoneCell", forIndexPath: indexPath) as! PhoneTableViewCell
            
            cell2.setDetails(person)
            phoneCell = cell2
            cell = cell2
            
        case 2:
            if indexPath.row != person.emails.count {
                let cell2 = tableView.dequeueReusableCellWithIdentifier("EmailCell", forIndexPath: indexPath) as! EmailsTableViewCell
                
                cell2.setDetails(person.emails[indexPath.row])
                
                emailCells.append(cell2)
                cell = cell2
            } else {
                let cell2 = tableView.dequeueReusableCellWithIdentifier("addEmail", forIndexPath: indexPath) as! addEmailTableViewCell
                addEmailCell = cell2
                cell = cell2
            }
            
        default:
            break
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! HeaderTableViewCell
        
        
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "NAME"
        
        case 1:
            headerCell.headerLabel.text = "PHONE"
            
        case 2:
            headerCell.headerLabel.text = "EMAIL"
        default:
            break
        }
        
        headerCell.headerLabel.font = headerCell.headerLabel.font.fontWithSize(10)
        headerCell.bkgView.backgroundColor = UIColor(red: 211.0/225.0, green: 211.0/225.0, blue: 211.0/225.0, alpha: 1)
        return headerCell.contentView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 113
        }
        
        return 43
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if (indexPath.section == 2) {
            return true
        }
        return false
    }
*/
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            person.emails.removeAtIndex(indexPath.row)
            emailCells.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 1 {
            phoneCell.phoneLabel.becomeFirstResponder()
        }
        
        if indexPath.section == 2 && indexPath.row != person.emails.count {
            emailCells[indexPath.row].emailLabel.becomeFirstResponder()
        }
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func addEmail(sender: UIButton) {
        person.emails.append(addEmailCell.newEmail.text!)
        emailCells.removeAll()
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "save" {
            person.first = nameCell.fnameLabel.text!
            person.last = nameCell.lnameLabel.text!
            person.photo = nameCell.photoView.image
            person.phone = phoneCell.phoneLabel.text!
            
            var emails: [String] = []
            for cell in emailCells {
                emails.append(cell.emailLabel.text!)
            }
            person.emails = emails
        }
    }
}
