//
//  SavedTableViewController.swift
//  BoredIdeas
//
//  Created by Елена Даниленко on 23.10.2023.
//

import UIKit
import RealmSwift

class SavedTableViewController: UITableViewController {
    
    var activityArraySaved = UserDefaults.standard.array(forKey: "activityArraySaved") ?? ["Nothing saved"]

    
    @IBAction func deleteAllButton(_ sender: Any) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
        
        activityArraySaved = ["Nothing saved"]
        tableView.reloadData()
        UserDefaults.standard.set([String](),forKey: "activityArraySaved")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if activityArraySaved.isEmpty{
            activityArraySaved = ["Nothing saved"]
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activityArraySaved.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellActivity", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = activityArraySaved[indexPath.row] as? String

        cell.textLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
    

}
