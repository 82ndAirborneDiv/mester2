//
//  SearchResultsTableViewController.swift
//  mec-wheel
//
//  Created by jason on 1/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {
    var resultSearchController:UISearchController? = nil
    
    var filteredTableData = [Condition]()
    var selectedCondition = Condition()

    override func viewDidLoad() {
        super.viewDidLoad()

        resultSearchController = UISearchController(searchResultsController: nil)
        resultSearchController?.searchResultsUpdater = self
        
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for conditions"
        searchBar.barTintColor = #colorLiteral(red: 0.00600755075, green: 0.1100400463, blue: 0.6331768036, alpha: 1)
        searchBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.tableHeaderView = searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = true
        resultSearchController?.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        

        
        //filteredTableData = tabledata
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int
        if (resultSearchController?.isActive)! {
            count = filteredTableData.count
            if count == 0 {
                //Need to return 1 for cellForRowAt to display "No results found"
                return 1
            }
        } else {
            count = sharedConditionContent.conditions.count
        }
        
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        var cellText: String
        
        if (resultSearchController?.isActive)! {
            if filteredTableData.count == 0 {
                cellText = "No results found"
                cell?.isUserInteractionEnabled = false
            } else {
                cell?.isUserInteractionEnabled = true
                cellText = filteredTableData[indexPath.row].name
            }
        } else {
            cellText = sharedConditionContent.conditions[indexPath.row].name
        }
        cell?.textLabel?.text = cellText
        
        return cell!
        
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let cell = sender as? UITableViewCell else {
            return
        }
        if (resultSearchController?.isActive)! {
            selectedCondition = sharedConditionContent.getFirstChildOrDisplayCondition(condition: filteredTableData[(tableView.indexPath(for: cell)?.row)!])
            navigationController?.popViewController(animated: true)
        } else {
            selectedCondition = sharedConditionContent.getCondition(for: (tableView.indexPath(for: cell)?.row)!)
        }
    }
 
    
    // MARK: SearchBarDelegate methods
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        return true
    }
}

extension SearchResultsTableViewController: UISearchResultsUpdating {
    // MARK: SearchResultsUpdating methods
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll()
        let searchText = searchController.searchBar.text
        
        for item in sharedConditionContent.conditions {
            let lowercasedItem = item.name.lowercased()
            let lowercasedSearchText = searchText?.lowercased()
            if lowercasedItem.hasPrefix(lowercasedSearchText!) {
                filteredTableData.append(item)
            }
        }
        self.tableView.reloadData()
    }
}
