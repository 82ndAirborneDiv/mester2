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
    var chc, pop, dmpa, implants, lngiud, cuiud: Rating?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch sharedConditionContent.currentRatingType {
            case "Initiation":
                chc = currentCondition.chcInitiation!
                pop = currentCondition.popInitiation!
                dmpa = currentCondition.dmpaInitiation!
                implants = currentCondition.implantsInitiation!
                lngiud = currentCondition.lngiudInitiation!
                cuiud = currentCondition.cuiudInitiation!
            case "Continuation":
                chc = currentCondition.chcContinuation!
                pop = currentCondition.popContinuation!
                dmpa = currentCondition.dmpaContinuation!
                implants = currentCondition.implantsContinuation!
                lngiud = currentCondition.lngiudContinuation!
                cuiud = currentCondition.cuiudContinuation!
        default:
                break
        }
        
        chcRating.attributedText = getRatingWithNotesSymbols(rating: chc!)
        popRating.attributedText = getRatingWithNotesSymbols(rating: pop!)
        dmpaRating.attributedText = getRatingWithNotesSymbols(rating: dmpa!)
        implantsRating.attributedText = getRatingWithNotesSymbols(rating: implants!)
        lngiudRating.attributedText = getRatingWithNotesSymbols(rating: lngiud!)
        cuiudRating.attributedText = getRatingWithNotesSymbols(rating: cuiud!)

        chcCell.isUserInteractionEnabled = chc?.notes != nil
        popCell.isUserInteractionEnabled = pop?.notes != nil
        dmpaCell.isUserInteractionEnabled = dmpa?.notes != nil
        implantsCell.isUserInteractionEnabled = implants?.notes != nil
        lngiudCell.isUserInteractionEnabled = lngiud?.notes != nil
        cuiudCell.isUserInteractionEnabled = cuiud?.notes != nil

    }

    func getRatingWithNotesSymbols(rating: Rating) -> NSMutableAttributedString {
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
        var notesSymbols = ""
        if rating.notes != nil {
            for note in rating.notes! {
                notesSymbols += note.name
            }
        }
        if rating.rating == "" {
            return NSMutableAttributedString(string: notesSymbols)
        }
        
        let returnString = NSMutableAttributedString(string: rating.rating)
        let symbolsString = NSMutableAttributedString(string: notesSymbols)
        
        symbolsString.setAttributes([NSAttributedString.Key.font:fontSuper!,NSAttributedString.Key.baselineOffset:8], range: NSRange(location: 0, length: symbolsString.length))
        
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
            notesForSelectedCell = (chc?.notes)!
        case 1:
            notesForSelectedCell = (pop?.notes)!
        case 2:
            notesForSelectedCell = (dmpa?.notes)!
        case 3:
            notesForSelectedCell = (implants?.notes)!
        case 4:
            notesForSelectedCell = (lngiud?.notes)!
        case 5:
            notesForSelectedCell = (cuiud?.notes)!
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
