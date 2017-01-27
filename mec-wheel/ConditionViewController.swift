//
//  ConditionViewController.swift
//  mec-wheel
//
//  Created by jason on 1/13/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class ConditionViewController: UIViewController {
    var conditionDetailVC: ConditionDetailsPageViewController?

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var methodsContainerView: UIView!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var subconditionName: UILabel!

    @IBAction func previousSubCondition(_ sender: Any) {
        if (conditionDetailVC != nil) {
            conditionDetailVC?.previousCondition()
        } else {
            print("conditionDetailsVC is nil")
        }
    }
    
    @IBAction func nextSubCondition(_ sender: Any) {
        if (conditionDetailVC != nil) {
            conditionDetailVC?.nextCondition()
        } else {
            print("conditionDetailsVC is nil")
        }
    }
    
    @IBAction func searchConditions(_ sender: Any) {
        performSegue(withIdentifier: "SearchSegue", sender: Any?.self)
    }
    /*
    @IBAction func displayConditionPicker(_ sender: Any) {
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "conditionPicker")
        
        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = conditionName
        popController.popoverPresentationController?.sourceRect = conditionName.bounds
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
    }
    
    // UIPopoverPresentationControllerDelegate method
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
    
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*searchBar.delegate = self
        searchController = UISearchController(searchResultsController: searchResultsController)
        
        searchResultsController = UITableViewController(style: .plain)
        searchResultsController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserFoundCell")
        searchResultsController.tableView.dataSource = self
        searchResultsController.tableView.delegate = self

        
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        
        */
        
        methodsContainerView.layer.shadowOpacity = 0.3
        methodsContainerView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        methodsContainerView.layer.shadowRadius = 1.0
        methodsContainerView.layer.shadowColor = UIColor.black.cgColor
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "conditionDetailsPVCSegue" {
            guard let vc = segue.destination as? ConditionDetailsPageViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            conditionDetailVC = vc
            conditionDetailVC?.parentConditionLabel = navigationTitle
            conditionDetailVC?.parentSubConditionLabel = subconditionName
        }
    }
    
    @IBAction func unwindToConditionView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? SearchResultsTableViewController {
            let condition = sourceViewController.selectedCondition
            conditionDetailVC?.setCondition(index: sharedConditionContent.parentConditionsProp.index(of: condition)!)
        }
    }
}
