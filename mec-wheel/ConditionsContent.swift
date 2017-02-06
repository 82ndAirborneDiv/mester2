//
//  ConditionsController.swift
//  mec-wheel
//
//  Created by jason on 1/13/17.
//  Copyright © 2017 jason. All rights reserved.
//

import Foundation

let sharedConditionContent = ConditionsContent()

class ConditionsContent {
    
    
    var conditions = [Condition]()
    var parentConditionsProp = [Condition]()
    var currentIndex = 0
    
    var conditionDisplayed: Condition
    var currentRatingType: String
    
    func changeCurrentIndex(changeBy: Int){
        //print("changeIndex: index before change \(currentIndex)")

        currentIndex = currentIndex + changeBy
        
        //print("changeIndex: index after change before logic \(currentIndex)")

        
        if(currentIndex < 0){
            currentIndex = conditions.count - 1
        }
        if(currentIndex > conditions.count - 1){
            currentIndex = 0
        }
        
        //print("changeIndex: index after change after logic \(currentIndex)")

    }
    
    func nextDisplayCondition() -> Condition {
        var nextCondition: Condition?
        if conditionDisplayed.parentCondition != nil {
            let parentCondition = conditions[conditionDisplayed.parentCondition!]
            let childConditions = parentCondition.childConditions
            var nextConditionIndex = (childConditions?.index(of: conditionDisplayed)!)! + 1
            
            if nextConditionIndex > (childConditions?.count)! - 1 {
                nextConditionIndex = conditionDisplayed.parentCondition! + 1
                if nextConditionIndex > conditions.count - 1 {
                    nextConditionIndex = 0
                }
                
                nextCondition = conditions[nextConditionIndex]
                if (nextCondition?.hasChildren)! {
                    nextCondition = nextCondition?.childConditions![0]
                }
            } else {
                nextCondition = childConditions?[nextConditionIndex]
            }
        } else {
            var nextConditionIndex = conditions.index(of: conditionDisplayed)! + 1
            if nextConditionIndex > conditions.count {
                nextConditionIndex = 0
            }
            
            nextCondition = conditions[nextConditionIndex]
            if (nextCondition?.hasChildren)! {
                nextCondition = nextCondition?.childConditions![0]
            }
        }
        conditionDisplayed = nextCondition!
        return nextCondition!
    }
    
    func prevDisplayCondition() -> Condition {
        var prevCondition: Condition?
        if conditionDisplayed.parentCondition != nil {
            let parentCondition = conditions[conditionDisplayed.parentCondition!]
            let childConditions = parentCondition.childConditions
            var prevConditionIndex = (childConditions?.index(of: conditionDisplayed)!)! - 1
            
            if prevConditionIndex < 0 {
                prevConditionIndex = conditionDisplayed.parentCondition! - 1
                if prevConditionIndex < 0 {
                    prevConditionIndex = conditions.count - 1
                }
                
                prevCondition = conditions[prevConditionIndex]
                if (prevCondition?.hasChildren)! {
                    prevCondition = prevCondition?.childConditions![(prevCondition?.childConditions!.count)! - 1]
                }
            } else {
                prevCondition = childConditions?[prevConditionIndex]
            }
        } else {
            var prevConditionIndex = conditions.index(of: conditionDisplayed)! - 1
            if prevConditionIndex < 0 {
                prevConditionIndex = conditions.count - 1
            }
            
            prevCondition = conditions[prevConditionIndex]
            if (prevCondition?.hasChildren)! {
                prevCondition = prevCondition?.childConditions![(prevCondition?.childConditions!.count)! - 1]
            }
        }
        conditionDisplayed = prevCondition!
        return prevCondition!
    }

    func getCondition(for index: Int) -> Condition{
        var condition = conditions[index]
        if condition.hasChildren {
            condition = (condition.childConditions?[0])!
        }
        conditionDisplayed = condition
        return condition
    }
    
    func getFirstChildOrDisplayCondition(condition: Condition) -> Condition {
        var displayCondition = condition
        if displayCondition.hasChildren {
            displayCondition = (condition.childConditions?[0])!
        }
        conditionDisplayed = displayCondition
        return displayCondition
    }
    
    func getNextSubCondition() -> Condition {
        return conditions[2]
    }
    
    init() {
        let notes = [
            "A": Note(name: "A", text: "IUD insertion postpartum = 1 or 2 except purperal sepsis which = 4"),
            "B": Note(name: "B", text: "If not breastfeeding = 1"),
            "C": Note(name: "C", text: "For women without risk factors for VTE, COC/P/R = 2"),
            "D": Note(name: "D", text: "Or other forms of purulent cervicitis"),
            "E": Note(name: "E", text: "Recommendations for both IUDs refer to < 20 yrs"),
            "F": Note(name: "F", text: "If very high likelihood of exposure to gonorrhea or chlamydia = 3"),
            "G": Note(name: "G", text: "For women with mild IBD and no other risk factors for VTE = 2, for women with increased risk of VTE = 3"),
            "H": Note(name: "H", text: "HIV-infected and AIDS, clinically well on ARV therapy = 2; AIDS, not clinically well = 3"),
            "I": Note(name: "I", text: "COC/P/R and < 15 cigarettes/day = 3"),
            "J": Note(name: "J", text: "Refers to Ritonavir-boosted protease inhibitors"),
            "K": Note(name: "K", text: "These recommendations also apply to controlled hypertension. Consult the full US MEC document for a clarification of this recommendation."),
            "L": Note(name: "L", text: "These recommendations also apply to vascular disease"),
            "M": Note(name: "M", text: "If age < 35 yrs then this condition = 2"),
            "N": Note(name: "N", text: "For ≥ 18 years and BMI ≥ 30 kg/m² = 1"),
            "O": Note(name: "O", text: "For nephropathy/retinopathy/neuropathy and other vascular disease or diabetes for > 20 yrs' duration COC/P/R = 3/4 depending on disease severity, and DMPA = 3"),
            "P": Note(name: "P", text: "For patch and ring, this condition = 1"),
            "Q": Note(name: "Q", text: "Includes: phenytoin, carbamazepine, barbiturates, primidone, topiramate, oxcarbazepine. For lamotrigine COCs = 3 • Other methods = 1"),
            "R": Note(name: "R", text: "For women with low risk for recurrent DVT = 3"),
            "S": Note(name: "S", text: "Established on anticoagulant therapy for ≥ 3 months"),
            "T": Note(name: "T", text: "Refers to surgery with prolonged immobilization"),
            "U": Note(name: "U", text: "Focal nodular hyperplasia = 1 or 2 for all methods"),
            "V": Note(name: "V", text: "Category should be assessed according to the number, severity, and combination of risk factors"),
            "W": Note(name: "W", text: "The category should be assessed according to the severity of the condition"),
            "✝": Note(name: "\u{271D}\u{FE0E}", text: "Consult the full US MEC document for a clarification of this recommendation.")
        ]
    
        conditions = [
            Condition(name: "Age", childConditions:
                [
                    Condition(name: "Adolescents < 18 years", chcRating: Rating(rating: "1"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "2"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "2", notes: [notes["E"]!!]), cuiudRating: Rating(rating: "2", notes: [notes["E"]!!]), notes: nil, parentCondition: 0)
                ]
            ),
            Condition(name: "Anatomical Abnormalities", childConditions: [
                Condition(name: "Distorted uterine cavity", chcRating: Rating(rating: ""), popRating: Rating(rating: ""), dmpaRating: Rating(rating: ""), implantsRating: Rating(rating: ""), lngiudRating: Rating(rating: "4"), cuiudRating: Rating(rating: "4"), notes: nil, parentCondition: 1),
                Condition(name: "Other abnormalities", chcRating: Rating(rating: ""), popRating: Rating(rating: ""), dmpaRating: Rating(rating: ""), implantsRating: Rating(rating: ""), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "2"), notes: nil, parentCondition: 1)
                ]
            ),
            Condition(name: "Bariatric Surgery", childConditions:
                [
                    Condition(name: "Restrictive procedures", chcRating: Rating(rating: "1"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 2),
                    Condition(name: "Malabsorbtive procedures", chcRating: Rating(rating: "3", notes: [notes["P"]!!]), popRating: Rating(rating: "3"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 2),
                    ]
            ),
            Condition(name: "Cancers", childConditions:
                [
                    Condition(name: "Breast cancer (current)", chcRating: Rating(rating: "4"), popRating: Rating(rating: "4"), dmpaRating: Rating(rating: "4"), implantsRating: Rating(rating: "4"), lngiudRating: Rating(rating: "4"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 3),
                    Condition(name: "Cervical cancer (pre-treatment)", chcInitiation: Rating(rating: "2"), popInitiation: Rating(rating: "1"), dmpaInitiation: Rating(rating: "2"), implantsInitiation: Rating(rating: "2"), lngiudInitiation: Rating(rating: "4"), cuiudInitiation: Rating(rating: "4"), chcContinuation: Rating(rating: "2"), popContinuation: Rating(rating: "1"), dmpaContinuation: Rating(rating: "2"), implantsContinuation: Rating(rating: "2"), lngiudContinuation: Rating(rating: "2"), cuiudContinuation: Rating(rating: "2", notes: [notes["V"]!!, notes["✝"]!!]),  notes: nil, parentCondition: 3)
                ]
            ),
            Condition(name: "Cardiovascular Disease", childConditions:
                [
                    Condition(name: "Stroke", chcRating: Rating(rating: "4"), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "3"), implantsRating: Rating(rating: "2"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 4),
                    Condition(name: "Ischemic", chcRating: Rating(rating: "4"), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "3"), implantsRating: Rating(rating: "2"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 4),
                    Condition(name: "Multiple risk factors", chcRating: Rating(rating: "3/4", notes: [notes["V"]!!, notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "3", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 4),
                    ]
            ),
            Condition(name: "Deep Vein Thrombosis", childConditions:
                [
                    Condition(name: "History", chcRating: Rating(rating: "4", notes: [notes["R"]!!]), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "2"), implantsRating: Rating(rating: "2"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 5),
                    Condition(name: "Acute", chcRating: Rating(rating: "4"), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "2"), implantsRating: Rating(rating: "2"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "2"), notes: nil, parentCondition: 5),
                    Condition(name: "On therapy", chcRating: Rating(rating: "4", notes: [notes["R"]!!, notes["S"]!!, notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["S"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["S"]!!]), implantsRating: Rating(rating: "2", notes: [notes["S"]!!]), lngiudRating: Rating(rating: "2", notes: [notes["S"]!!]), cuiudRating: Rating(rating: "2", notes: [notes["S"]!!]), notes: nil, parentCondition: 5),
                    Condition(name: "Major surgery", chcRating: Rating(rating: "4"), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "2"), implantsRating: Rating(rating: "2"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "1"), notes: [notes["T"]!!], parentCondition: 5),
                    ]
            ),
            Condition(name: "Diabetes", childConditions:
                [
                    Condition(name: "Current", chcRating: Rating(rating: "2", notes: [notes["O"]!!]), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "2", notes: [notes["O"]!!]), implantsRating: Rating(rating: "2"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 6),
                    ]
            ),
            Condition(name: "Drug Interactions", childConditions:
                [
                    Condition(name: "Rifampicin/rifabutin", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "3", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 7),
                    Condition(name: "Certain anti-convulsants", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "3", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: [notes["Q"]!!], parentCondition: 7),
                    Condition(name: "ARV therapy", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "3", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2/3", notes: [notes["H"]!!, notes["✝"]!!]), cuiudRating: Rating(rating: "2/3", notes: [notes["H"]!!, notes["✝"]!!]), notes: [notes["J"]!!], parentCondition: 7),
                    ]
            ),
            Condition(name: "HIV/AIDS", childConditions:
                [
                    Condition(name: "HIV Infection or AIDS", chcRating: Rating(rating: "1", notes: [notes["✝"]!!]), popRating: Rating(rating: "1", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "1", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "3", notes: [notes["H"]!!]), cuiudRating: Rating(rating: "3", notes: [notes["H"]!!]), notes: nil, parentCondition: 8),
                    ]
            ),
            Condition(name: "Headaches", childConditions:
                [
                    Condition(name: "Migraine without aura", chcRating: Rating(rating: "3", notes: [notes["M"]!!, notes["✝"]!!]), popRating: Rating(rating: "1", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2", notes: [notes["✝"]!!]), cuiudRating: Rating(rating: "1", notes: [notes["✝"]!!]), notes: nil, parentCondition: 9),
                    Condition(name: "Migraine with aura", chcRating: Rating(rating: "4", notes: [notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2", notes: [notes["✝"]!!]), cuiudRating: Rating(rating: "1", notes: [notes["✝"]!!]), notes: nil, parentCondition: 9),
                    ]
            ),
            Condition(name: "Hypertension", childConditions:
                [
                    Condition(name: "140-159/90-99", chcRating: Rating(rating: "3"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "2"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: [notes["K"]!!], parentCondition: 10),
                    Condition(name: "≥160/≥100", chcRating: Rating(rating: "4"), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "3"), implantsRating: Rating(rating: "2"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "1"), notes: [notes["L"]!!], parentCondition: 10),
                    ]
            ),
            Condition(name: "IBD", childConditions:
                [
                    Condition(name: "IBD", chcRating: Rating(rating: "2/3", notes: [notes["G"]!!, notes["✝"]!!]), popRating: Rating(rating: "2"), dmpaRating: Rating(rating: "2"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 11),
                    ]
            ),
            Condition(name: "Liver Diseases", childConditions:
                [
                    Condition(name: "Tumors", chcRating: Rating(rating: "4"), popRating: Rating(rating: "3"), dmpaRating: Rating(rating: "3"), implantsRating: Rating(rating: "3"), lngiudRating: Rating(rating: "3"), cuiudRating: Rating(rating: "1"), notes: [notes["U"]!!], parentCondition: 12),
                    Condition(name: "Severe cirrhosis", chcRating: Rating(rating: "4"), popRating: Rating(rating: "3"), dmpaRating: Rating(rating: "3"), implantsRating: Rating(rating: "3"), lngiudRating: Rating(rating: "3"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 12),
                    Condition(name: "Hepatitis acute / flare", chcRating: Rating(rating: "3/4", notes: [notes["W"]!!, notes["✝"]!!]), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 12),
                    
                    ]
            ),
            Condition(name: "Obesity", childConditions:
                [
                    Condition(name: "Obesity", chcRating: Rating(rating: "2"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "2", notes: [notes["N"]!!]), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 13),
                    ]
            ),
            Condition(name: "PID", childConditions:
                [
                    Condition(name: "Current", chcRating: Rating(rating: "1"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "4"), cuiudRating: Rating(rating: "4"), notes: nil, parentCondition: 14),
                    ]
            ),
            Condition(name: "Postpartum", childConditions:
                [
                    Condition(name: "< 21 days", chcRating: Rating(rating: "4"), popRating: Rating(rating: "2", notes: [notes["B"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["B"]!!]), implantsRating: Rating(rating: "2", notes: [notes["B"]!!]), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: nil, parentCondition: 15),
                    Condition(name: "21-< 30 days breastfeeding", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: nil, parentCondition: 15),
                    Condition(name: "30-42 days breastfeeding", chcRating: Rating(rating: "3", notes: [notes["C"]!!, notes["✝"]!!]), popRating: Rating(rating: "1", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "1", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: nil, parentCondition: 15),
                    Condition(name: "21-42 days not breastfeeding", chcRating: Rating(rating: "3", notes: [notes["C"]!!, notes["✝"]!!]), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: nil, parentCondition: 15),
                    
                    ]
            ),
            Condition(name: "Sexually Transmitted Infections", childConditions:
                [
                    Condition(name: "Gonorrhea Chlamydia", chcRating: Rating(rating: "1"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "4"), cuiudRating: Rating(rating: "4"), notes: [notes["D"]!!], parentCondition: 16),
                    Condition(name: "Other STIs and vaginitis", chcRating: Rating(rating: "1"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "2"), cuiudRating: Rating(rating: "2"), notes: nil, parentCondition: 16),
                    Condition(name: "Increased risk of STI", chcRating: Rating(rating: "1"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "2/3", notes: [notes["F"]!!, notes["✝"]!!]), cuiudRating: Rating(rating: "2/3", notes: [notes["F"]!!, notes["✝"]!!]), notes: nil, parentCondition: 16),
                    ]
            ),
            Condition(name: "Smoking", childConditions:
                [
                    Condition(name: "Age < 35", chcRating: Rating(rating: "2"), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 17),
                    Condition(name: "Age ≥ 35", chcRating: Rating(rating: "4", notes: [notes["I"]!!]), popRating: Rating(rating: "1"), dmpaRating: Rating(rating: "1"), implantsRating: Rating(rating: "1"), lngiudRating: Rating(rating: "1"), cuiudRating: Rating(rating: "1"), notes: nil, parentCondition: 17),
                    
                    ]
            ),
            Condition(name: "Vaginal Bleeding", childConditions:
                [
                    Condition(name: "Unexplained", chcRating: Rating(rating: "2", notes: [notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "3", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "3", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "4", notes: [notes["✝"]!!]), cuiudRating: Rating(rating: "4", notes: [notes["✝"]!!]), notes: nil, parentCondition: 18),
                ]
            )
        ]

        conditionDisplayed = (conditions[0].childConditions?[0])!
        currentRatingType = "Initiation"
    }
}
