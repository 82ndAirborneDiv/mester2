//
//  ConditionPickerViewController.swift
//  mec-wheel
//
//  Created by jason on 1/23/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class ConditionPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sharedConditionContent.conditions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 26
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        let condition = sharedConditionContent.conditions[row]
        var returnString = ""
        if condition.parentCondition != nil {
            returnString += (condition.parentCondition?.name)! + ": "
        }
        returnString += condition.name
        
        let myTitle = NSAttributedString(string: returnString, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 14.0)!,NSForegroundColorAttributeName:UIColor.black])

        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0;
        label.textAlignment = .center
        label.attributedText = myTitle
        label.sizeToFit()
        return label;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        testLabel.text = sharedConditionContent.conditions[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 200
    }
}
