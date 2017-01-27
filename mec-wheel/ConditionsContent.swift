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

        let parentConditions = [
                Condition(name: "Cancers", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Vaginal Bleeding", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "PID", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Sexually Transmitted Infections", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "HIV/AIDS", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Age", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Smoking", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Drug Interactions", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Hypertension", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Cardiovascular Disease", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Deep Vein Thrombosis", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Headaches", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Liver Diseases", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Diabetes", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Bariatric Surgery", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Postpartum", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "IBD", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
                Condition(name: "Obesity", chcRating: nil, popRating: nil, dmpaRating: nil, implantsRating: nil, lngiudRating: nil, cuiudRating: nil, notes: [], parentCondition: nil),
        ]
        
        parentConditionsProp = parentConditions
    
        conditions = [
            
//            Condition(name: "", chcRating: Rating(rating: "", notes: []), popRating: Rating(rating: "", notes: []), dmpaRating: Rating(rating: "", notes: []), implantsRating: Rating(rating: "", notes: []), lngiudRating: Rating(rating: "", notes: []), cuiudRating: Rating(rating: "", notes: []), notes: [], parentCondition: parentConditions[]),
            
            Condition(name: "Breast cancer (current)", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "4", notes: []), dmpaRating: Rating(rating: "4", notes: []), implantsRating: Rating(rating: "4", notes: []), lngiudRating: Rating(rating: "4", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[0]),
            Condition(name: "Cervical cancer (pre-treatment)", chcRating: Rating(rating: "2", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "2", notes: []), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "4", notes: []), cuiudRating: Rating(rating: "4", notes: []), notes: [], parentCondition: parentConditions[0]),
            Condition(name: "Unexplained", chcRating: Rating(rating: "2", notes: [notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "3", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "3", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "4", notes: [notes["✝"]!!]), cuiudRating: Rating(rating: "4", notes: [notes["✝"]!!]), notes: [], parentCondition: parentConditions[1]),
            Condition(name: "Current", chcRating: Rating(rating: "1", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "4", notes: []), cuiudRating: Rating(rating: "4", notes: []), notes: [], parentCondition: parentConditions[2]),
            Condition(name: "Gonorrhea Chlamydia", chcRating: Rating(rating: "1", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "4", notes: []), cuiudRating: Rating(rating: "4", notes: []), notes: [notes["D"]!!], parentCondition: parentConditions[3]),
            Condition(name: "Other STIs and vaginitis", chcRating: Rating(rating: "1", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "2", notes: []), notes: [], parentCondition: parentConditions[3]),
            Condition(name: "Increased risk of STI", chcRating: Rating(rating: "1", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "2/3", notes: [notes["F"]!!, notes["✝"]!!]), cuiudRating: Rating(rating: "2/3", notes: [notes["F"]!!, notes["✝"]!!]), notes: [], parentCondition: parentConditions[3]),
            Condition(name: "HIV Infection or AIDS", chcRating: Rating(rating: "1", notes: [notes["✝"]!!]), popRating: Rating(rating: "1", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "1", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "3", notes: [notes["H"]!!]), cuiudRating: Rating(rating: "3", notes: [notes["H"]!!]), notes: [], parentCondition: parentConditions[4]),
            Condition(name: "Adolescents < 18 years", chcRating: Rating(rating: "1", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "2", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "2", notes: [notes["E"]!!]), cuiudRating: Rating(rating: "2", notes: [notes["E"]!!]), notes: [], parentCondition: parentConditions[5]),
            Condition(name: "Age < 35", chcRating: Rating(rating: "2", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[6]),
            Condition(name: "Age ≥ 35", chcRating: Rating(rating: "4", notes: [notes["I"]!!]), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[6]),
            Condition(name: "Rifampicin/rifabutin", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "3", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[7]),
            Condition(name: "Certain anti-convulsants", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "3", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [notes["Q"]!!], parentCondition: parentConditions[7]),
            Condition(name: "ARV therapy", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "3", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2/3", notes: [notes["H"]!!, notes["✝"]!!]), cuiudRating: Rating(rating: "2/3", notes: [notes["H"]!!, notes["✝"]!!]), notes: [notes["J"]!!], parentCondition: parentConditions[7]),
            Condition(name: "140-159/90-99", chcRating: Rating(rating: "3", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "2", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [notes["K"]!!], parentCondition: parentConditions[8]),
            Condition(name: "≥160/≥100", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "3", notes: []), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [notes["L"]!!], parentCondition: parentConditions[8]),
            Condition(name: "Stroke", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "3", notes: []), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[9]),
            Condition(name: "Ischemic", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "3", notes: []), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[9]),
            Condition(name: "Multiple risk factors", chcRating: Rating(rating: "3/4", notes: [notes["V"]!!, notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "3", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[9]),
            Condition(name: "History", chcRating: Rating(rating: "4", notes: [notes["R"]!!]), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "2", notes: []), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[10]),
            Condition(name: "Acute", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "2", notes: []), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "2", notes: []), notes: [], parentCondition: parentConditions[10]),
            Condition(name: "On therapy", chcRating: Rating(rating: "4", notes: [notes["R"]!!, notes["S"]!!, notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["S"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["S"]!!]), implantsRating: Rating(rating: "2", notes: [notes["S"]!!]), lngiudRating: Rating(rating: "2", notes: [notes["S"]!!]), cuiudRating: Rating(rating: "2", notes: [notes["S"]!!]), notes: [], parentCondition: parentConditions[10]),
            Condition(name: "Major surgery", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "2", notes: []), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [notes["T"]!!], parentCondition: parentConditions[10]),
            Condition(name: "Migraine without aura", chcRating: Rating(rating: "3", notes: [notes["M"]!!, notes["✝"]!!]), popRating: Rating(rating: "1", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2", notes: [notes["✝"]!!]), cuiudRating: Rating(rating: "1", notes: [notes["✝"]!!]), notes: [], parentCondition: parentConditions[11]),
            Condition(name: "Migraine with aura", chcRating: Rating(rating: "4", notes: [notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "2", notes: [notes["✝"]!!]), cuiudRating: Rating(rating: "1", notes: [notes["✝"]!!]), notes: [], parentCondition: parentConditions[11]),
            Condition(name: "Tumors", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "3", notes: []), dmpaRating: Rating(rating: "3", notes: []), implantsRating: Rating(rating: "3", notes: []), lngiudRating: Rating(rating: "3", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [notes["U"]!!], parentCondition: parentConditions[12]),
            Condition(name: "Severe cirrhosis", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "3", notes: []), dmpaRating: Rating(rating: "3", notes: []), implantsRating: Rating(rating: "3", notes: []), lngiudRating: Rating(rating: "3", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[12]),
            Condition(name: "Hepatitis acute / flare", chcRating: Rating(rating: "3/4", notes: [notes["W"]!!, notes["✝"]!!]), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[12]),
            Condition(name: "", chcRating: Rating(rating: "2/3", notes: [notes["G"]!!, notes["✝"]!!]), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "2", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[16]),
            Condition(name: "Current", chcRating: Rating(rating: "2", notes: [notes["O"]!!]), popRating: Rating(rating: "2", notes: []), dmpaRating: Rating(rating: "2", notes: [notes["O"]!!]), implantsRating: Rating(rating: "2", notes: []), lngiudRating: Rating(rating: "2", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[13]),
            Condition(name: "", chcRating: Rating(rating: "2", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "2", notes: [notes["N"]!!]), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[17]),
            Condition(name: "Restrictive procedures", chcRating: Rating(rating: "1", notes: []), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[14]),
            Condition(name: "Malabsorbtive procedures", chcRating: Rating(rating: "3", notes: [notes["P"]!!]), popRating: Rating(rating: "3", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "1", notes: []), cuiudRating: Rating(rating: "1", notes: []), notes: [], parentCondition: parentConditions[14]),
            Condition(name: "< 21 days", chcRating: Rating(rating: "4", notes: []), popRating: Rating(rating: "2", notes: [notes["B"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["B"]!!]), implantsRating: Rating(rating: "2", notes: [notes["B"]!!]), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: [], parentCondition: parentConditions[15]),
            Condition(name: "21-< 30 days breastfeeding", chcRating: Rating(rating: "3", notes: [notes["✝"]!!]), popRating: Rating(rating: "2", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "2", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "2", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: [], parentCondition: parentConditions[15]),
            Condition(name: "30-42 days breastfeeding", chcRating: Rating(rating: "3", notes: [notes["C"]!!, notes["✝"]!!]), popRating: Rating(rating: "1", notes: [notes["✝"]!!]), dmpaRating: Rating(rating: "1", notes: [notes["✝"]!!]), implantsRating: Rating(rating: "1", notes: [notes["✝"]!!]), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: [], parentCondition: parentConditions[15]),
            Condition(name: "21-42 days not breastfeeding", chcRating: Rating(rating: "3", notes: [notes["C"]!!, notes["✝"]!!]), popRating: Rating(rating: "1", notes: []), dmpaRating: Rating(rating: "1", notes: []), implantsRating: Rating(rating: "1", notes: []), lngiudRating: Rating(rating: "", notes: [notes["A"]!!]), cuiudRating: Rating(rating: "", notes: [notes["A"]!!]), notes: [], parentCondition: parentConditions[15]),
            
            
            
        ]
        
        conditionDisplayed = conditions[0]
    }
}
