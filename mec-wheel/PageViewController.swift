//
//  PageViewController.swift
//  mec-wheel
//
//  Created by jason on 1/6/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class ConditionDetailsPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    let conditionsContent = sharedConditionContent
    
    var parentConditionLabel: UINavigationItem!
    var parentSubConditionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dataSource = self
        
        let vc = viewControllerForCondition(condition: sharedConditionContent.conditionDisplayed)
        
        setViewControllers([vc!], direction: .forward, animated: true, completion: nil)
        
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func newViewController(index: Int) -> UIViewController {
        return viewControllerAtIndex(index: index)!
    }

    
    // MARK: - Navigation
    func viewControllerAtIndex(index: Int) -> RatingTableViewController? {
        if index == NSNotFound {
            return nil
        }
        //print("starting parentSubConditionLabel value \(parentSubConditionLabel.text)")
        
        if conditionsContent.conditions[index].parentCondition != nil {
            let parentCondition = conditionsContent.conditions[conditionsContent.conditions[index].parentCondition!]
            parentConditionLabel.title = parentCondition.name
        } else {
            parentConditionLabel.title = "Condition"
        }
        
        parentSubConditionLabel.attributedText = getSubConditionWithNotesSymbols(condition: conditionsContent.conditions[index])
        if (conditionsContent.conditions[index].notes != nil ){
            parentSubConditionLabel.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            parentSubConditionLabel.addGestureRecognizer(tap)
        } else {
            parentSubConditionLabel.isUserInteractionEnabled = false
        }
        
        //print("new parentSubConditionLabel value \(parentSubConditionLabel.text)")
        if let ratingViewController = storyboard?.instantiateViewController(withIdentifier: "RatingTableViewController") as? RatingTableViewController {
            ratingViewController.currentCondition = conditionsContent.conditions[index]
            return ratingViewController
        }
        return nil
    }
    
    func viewControllerForCondition(condition: Condition) -> RatingTableViewController? {
        if condition.parentCondition != nil {
            let parentCondition = sharedConditionContent.conditions[condition.parentCondition!]
            parentConditionLabel.title = parentCondition.name
        } else {
            parentConditionLabel.title = "Condition"
        }
        
        parentSubConditionLabel.attributedText = getSubConditionWithNotesSymbols(condition: condition)
        if condition.notes != nil {
            parentSubConditionLabel.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            parentSubConditionLabel.addGestureRecognizer(tap)
        } else {
            parentSubConditionLabel.isUserInteractionEnabled = false
        }
        
        //print("new parentSubConditionLabel value \(parentSubConditionLabel.text)")
        if let ratingViewController = storyboard?.instantiateViewController(withIdentifier: "RatingTableViewController") as? RatingTableViewController {
            ratingViewController.currentCondition = condition
            return ratingViewController
        }
        return nil

    }
    
    func nextCondition() {
        let nextCondition = conditionsContent.nextDisplayCondition()
        let vc = viewControllerForCondition(condition: nextCondition)
        setViewControllers([vc!], direction: .forward, animated: true, completion: nil)

    }
    
    func previousCondition() {
        let prevCondition = conditionsContent.prevDisplayCondition()
        let vc = viewControllerForCondition(condition: prevCondition)
        setViewControllers([vc!], direction: .reverse, animated: true, completion: nil)
    }
    
    func reloadCondition() {
        let currentCondition = conditionsContent.conditionDisplayed
        let vc = viewControllerForCondition(condition: currentCondition)
        
        var direction: UIPageViewControllerNavigationDirection
        
        if conditionsContent.currentRatingType == "Initiation" {
            direction = .reverse
        } else {
            direction = .forward
        }
        
        setViewControllers([vc!], direction: direction, animated: true, completion: nil)
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        //print("Subcondition title was tapped")
        performSegue(withIdentifier: "SubconditionNotesSegue", sender: Any?.self)
        
        /*
        if let noteDetailVC = storyboard?.instantiateViewController(withIdentifier: "NoteDetailViewController") as? NoteDetailViewController {
            noteDetailVC.notes = conditionsContent.conditions[conditionsContent.currentIndex].notes
            present(noteDetailVC, animated: true)
        }
    */
    }
    
    func getSubConditionWithNotesSymbols(condition: Condition) -> NSMutableAttributedString {
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
        var notesSymbols = ""
        if condition.notes != nil {
            for note in condition.notes! {
                notesSymbols += note.name
            }
        }
        
        let returnString = NSMutableAttributedString(string: condition.name)
        let symbolsString = NSMutableAttributedString(string: notesSymbols)
        
        symbolsString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:8], range: NSRange(location: 0, length: symbolsString.length))
        
        returnString.append(symbolsString)

        return returnString
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "SubconditionNotesSegue" {
            guard let noteDetailVC = segue.destination as? NoteDetailViewController else {
                fatalError("SubconditionNotesSegue error")
            }
            
            noteDetailVC.notes = conditionsContent.conditionDisplayed.notes
        }
    }
    
//    func conditionDidChange(direction: Int) {
//        changeCurrentIndex(changeBy: direction)
//        setViewControllers([newViewController(index: currentIndex)], direction: .forward, animated: true, completion: nil)
//    }
 
}

extension ConditionDetailsPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //print("Begin viewControllerBeforeViewController")
        //print("initial index \(conditionsContent.currentIndex)")
    
        //print("index after change\(conditionsContent.currentIndex)")
        //print("End viewControllerBeforeViewController")
        return self.viewControllerForCondition(condition: sharedConditionContent.prevDisplayCondition())
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //print("Begin viewControllerAfterViewController")
        //print("initial index \(conditionsContent.currentIndex)")
        //conditionsContent.changeCurrentIndex(changeBy: 1)
        //print("index after change\(conditionsContent.currentIndex)")
        //print("End viewControllerAfterViewController")
        return self.viewControllerForCondition(condition: sharedConditionContent.nextDisplayCondition())
        
    }
}

protocol ConditionDetailsPageViewControllerDelegate: class {
    func sendConditionToParent(condition: Condition)
}
