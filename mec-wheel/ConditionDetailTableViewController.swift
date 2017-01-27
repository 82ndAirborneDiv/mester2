//
//  ViewController.swift
//  mec-wheel
//
//  Created by jason on 12/29/16.
//  Copyright © 2016 jason. All rights reserved.
//

import UIKit

class ConditionDetailTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var hasNotes = true
    var itemsDict : [String: [String]] = ["No restriction": ["Cu-IUD", "LNG-IUD", "Implant", "POP", "CHC"], "Advantages outweigh risks": ["DMPA"]]
    var itemsDictHeaders = ["No restriction", "Advantages outweigh risks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cystic fibrosis"
        if hasNotes {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
        
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections in tableView is \(itemsDict.count)")
        return itemsDictHeaders.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsDict[itemsDictHeaders[section]]!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
        let tableSection = itemsDict[itemsDictHeaders[indexPath.section]]!
        let tableItem = tableSection[indexPath.row]
        
        cell.textLabel?.text = tableItem

//        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return itemsDictHeaders[section]
    }
    //MARK: Private methods
}

