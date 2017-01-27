//
//  RatingViewController.swift
//  mec-wheel
//
//  Created by jason on 1/6/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController  {
    // MARK: - Properties
    var noteDetailVC: NoteDetailViewController?
    
    @IBOutlet weak var chcRating: UILabel!
    @IBOutlet weak var popRating: UILabel!
    @IBOutlet weak var dmpaRating: UILabel!
    @IBOutlet weak var implantsRating: UILabel!
    @IBOutlet weak var lngiudRating: UILabel!
    @IBOutlet weak var cuiudRating: UILabel!

    @IBAction func cuiudRatingAction(_ sender: Any) {
        //performSegue(withIdentifier: "noteDetailSegue", sender: cuiudRating)
    }
    
    var currentCondition = Condition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chcRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.chcRating!)
        popRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.popRating!)
        dmpaRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.dmpaRating!)
        implantsRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.implantsRating!)
        lngiudRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.lngiudRating!)
        cuiudRating.attributedText = getRatingWithNotesSymbols(rating: currentCondition.cuiudRating!)
    

        if !(currentCondition.chcRating?.notes?.isEmpty)! {
            chcRating.isUserInteractionEnabled = true
        }
        
        if !(currentCondition.popRating?.notes?.isEmpty)! {
            popRating.isUserInteractionEnabled = true
        }
        
        
        if !(currentCondition.dmpaRating?.notes?.isEmpty)! {
            dmpaRating.isUserInteractionEnabled = true
        }
        
        if !(currentCondition.implantsRating?.notes?.isEmpty)! {
            implantsRating.isUserInteractionEnabled = true
        }
        
        if !(currentCondition.lngiudRating?.notes?.isEmpty)! {
            lngiudRating.isUserInteractionEnabled = true
        }
        
        if !(currentCondition.cuiudRating?.notes?.isEmpty)! {
            cuiudRating.isUserInteractionEnabled = true
        }
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "noteDetailSegue" {
            guard let vc = segue.destination as? NoteDetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            noteDetailVC = vc
            
        }
    }
 

}
