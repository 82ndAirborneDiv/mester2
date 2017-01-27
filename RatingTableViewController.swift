//
//  RatingTableViewController.swift
//  mec-wheel
//
//  Created by jason on 1/19/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController {
    @IBOutlet weak var chcRating: UILabel!
    @IBOutlet weak var popRating: UILabel!
    @IBOutlet weak var dmpaRating: UILabel!
    @IBOutlet weak var implantsRating: UILabel!
    @IBOutlet weak var lngiudRating: UILabel!
    @IBOutlet weak var cuiudRating: UILabel!

    @IBOutlet weak var chcCell: UITableViewCell!
    @IBOutlet weak var popCell: UITableViewCell!
    @IBOutlet weak var dmpaCell: UITableViewCell!
    @IBOutlet weak var implantsCell: UITableViewCell!
    @IBOutlet weak var lngiudCell: UITableViewCell!
    @IBOutlet weak var cuiudCell: UITableViewCell!
    
    var notesForSelectedCell: [Note] = []
    var currentCondition = Condition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chcRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.chcRating!)
        popRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.popRating!)
        dmpaRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.dmpaRating!)
        implantsRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.implantsRating!)
        lngiudRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.lngiudRating!)
        cuiudRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.cuiudRating!)

        if (currentCondition.chcRating?.notes?.isEmpty)! {
            chcCell.isUserInteractionEnabled = false
        }
        
        if (currentCondition.popRating?.notes?.isEmpty)! {
            popCell.isUserInteractionEnabled = false
        }
        
        
        if (currentCondition.dmpaRating?.notes?.isEmpty)! {
            dmpaCell.isUserInteractionEnabled = false
        }
        
        if (currentCondition.implantsRating?.notes?.isEmpty)! {
            implantsCell.isUserInteractionEnabled = false
        }
        
        if (currentCondition.lngiudRating?.notes?.isEmpty)! {
            lngiudCell.isUserInteractionEnabled = false
        }
        
        if (currentCondition.cuiudRating?.notes?.isEmpty)! {
            cuiudCell.isUserInteractionEnabled = false
        }

        
        // Do any additional setup after loading the view.
    }

    func getRatingWithNotesSymbols(rating: Rating) -> NSMutableAttributedString {
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
        var notesSymbols = ""
        for note in rating.notes! {
            notesSymbols += note.name
        }
        
        if rating.rating == "" {
            return NSMutableAttributedString(string: notesSymbols)
        }
        
        let returnString = NSMutableAttributedString(string: rating.rating)
        let symbolsString = NSMutableAttributedString(string: notesSymbols)
        
        symbolsString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:8], range: NSRange(location: 0, length: symbolsString.length))
        
        returnString.append(symbolsString)
        
        return returnString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            notesForSelectedCell = (currentCondition.chcRating?.notes)!
        case 1:
            notesForSelectedCell = (currentCondition.popRating?.notes)!
        case 2:
            notesForSelectedCell = (currentCondition.dmpaRating?.notes)!
        case 3:
            notesForSelectedCell = (currentCondition.implantsRating?.notes)!
        case 4:
            notesForSelectedCell = (currentCondition.lngiudRating?.notes)!
        case 5:
            notesForSelectedCell = (currentCondition.cuiudRating?.notes)!
        default:
            break
        }
        
        
        performSegue(withIdentifier: "MethodNotesSegue", sender: UITableViewCell.self)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let vc = segue.destination as? NoteDetailViewController else {
            fatalError("error")
        }
        
        switch segue.identifier {
        case "MethodNotesSegue"?:
            vc.notes = notesForSelectedCell
        default:
            break
        }
    }
    

}
