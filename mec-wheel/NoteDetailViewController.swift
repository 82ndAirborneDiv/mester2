//
//  NoteDetailViewController.swift
//  mec-wheel
//
//  Created by jason on 1/19/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var noteTitle: UILabel!
    
    var notes: [Note]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if notes != nil {
            var noteText = ""
            
            for note in notes! {
                noteText += note.name
                noteText += "\n"
                noteText += note.text
                noteText += "\n\n"
            }
            noteTitle.text = noteText
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
