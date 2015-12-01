//
//  ViewController.swift
//  Project 5
//
//  Created by Bernard JIANG on 27/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

//let JSON_URL = "https://raw.githubusercontent.com/cuappdev/trainingProgramResources/master/Lecture5JSON.json"
let JSON_URL = "https://raw.githubusercontent.com/btj29/CUAppDevProject5/master/JSON_File.json"

class ViewController: UIViewController, UITableViewDataSource {

    var people: [Person] = []
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func saveToMainViewController (segue:UIStoryboardSegue) {
        let source = segue.sourceViewController as! DetailViewController
        
        people[source.index] = source.person
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getData()
        //tableView.reloadData()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(refreshControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getData() {
        let url = NSURL(string: JSON_URL)!
        
        guard let jsonData = NSData(contentsOfURL: url) else {
            return
        }
        
        guard let jsonArray = (try? NSJSONSerialization.JSONObjectWithData(jsonData, options: [])) as? [AnyObject] else {
            return
        }
        
        for obj in jsonArray {
            let first = obj["fname"] as? String ?? ""
            let last = obj["lname"] as? String ?? ""
            let phone = obj["phone"] as? String ?? ""
            var emails: [String] = []
            if let oneEmail = obj["email"] as? String {
                emails.append(oneEmail)
            } else {
                emails = obj["email"] as? [String] ?? []
            }
            let picture = obj["picture"] as? String ?? ""
            
            let person = Person(first: first, last: last, phone: phone, emails: emails, photo: picture)
            
            people.append(person)
            tableView.reloadData()
        }
    }
    
    func refresh(sender: UIRefreshControl) {
        getData()
        //tableView.reloadData()
        sender.endRefreshing()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        cell.setPerson(people[indexPath.row])
        
        return cell
    }

    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            people.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            let destination = segue.destinationViewController as! DetailViewController
            
            destination.person = people[tableView.indexPathForSelectedRow!.row]
            destination.index = tableView.indexPathForSelectedRow!.row
        }
    }
}

