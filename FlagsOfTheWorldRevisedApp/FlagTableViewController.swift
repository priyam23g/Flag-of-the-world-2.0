//
//  FlagTableViewController.swift
//  FlagsOfTheWorldRevisedApp
//
//  Created by adil gupta on 17/04/20.
//  Copyright © 2020 priyam. All rights reserved.
//

import UIKit

class FlagTableViewController: UITableViewController {
    
  
    
    var flags: [Flag] = [Flag(flag: "🇦🇺", country: "Australia", region: "Oceania", population: "2.7m"),
                         Flag(flag: "🇺🇸", country: "United States", region: "North America", population: "100m"),
                         Flag(flag: "🇮🇳", country: "India", region: "Asia", population: "7.9b"),
                         Flag(flag: "🇿🇦", country: "South Africa", region: "Africa", population: "1.2m"),
                         Flag(flag: "🇵🇰", country: "Pakistan", region: "Asia", population: "91m"),
                         Flag(flag: "🇬🇧", country:"United Kingdom", region: "Europe", population: "101m"),
                         Flag(flag: "🇵🇪", country: "Peru", region: "South America", population: "2.7m"),
                         Flag(flag: "🇯🇲", country: "Jamaica", region: "Africa", population: "1.1m"),
                         Flag(flag: "🇯🇵", country: "Japan", region: "Asia", population: "107m"),
                         Flag(flag: "🇩🇪", country: "Germany", region: "Europe", population: "97m"),
                         Flag(flag: "🇨🇦", country: "Canada", region: "North America", population: "50m"),
                         Flag(flag: "🇨🇳", country: "China", region: "Asia", population: "10.7b"),
                         Flag(flag: "🇲🇽", country: "Mexico", region: "North America", population: "67m"),
                         Flag(flag: "🇰🇵", country: "North Korea", region: "Asia", population: "10m")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return flags.count
        }
        else {
                return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell", for: indexPath) as! FlagTableViewCell
        let flag = flags[indexPath.row]
        cell.update(with: flag)
        cell.showsReorderControl = true
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flag = flags[indexPath.row]
        print("\(flag.flag) - \(indexPath)")
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            flags.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    

    override func tableView(_ tableView: UITableView,
                            editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedFlag = flags.remove(at: fromIndexPath.row)
        flags.insert(movedFlag, at: to.row)
        tableView.reloadData()

    }

    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditFlag" {
            let indexPath = tableView.indexPathForSelectedRow!
            let flag = flags[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let editAddFlagTableViewController = navController.topViewController as! EditAddFlagTableViewController
            editAddFlagTableViewController.flag = flag
            
        }
    }
    @IBAction func unwindToFlagTableView(segue: UIStoryboardSegue){
        guard segue.identifier == "saveUnwind",
            let sourceViewController = segue.source as? EditAddFlagTableViewController,
            let flag = sourceViewController.flag else {return}
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            flags[selectedIndexPath.row] = flag
            tableView.reloadRows(at:[selectedIndexPath], with: .none)
        }
        else {
            let newIndexPath = IndexPath(row: flags.count, section:0)
            flags.append(flag)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
 

}
