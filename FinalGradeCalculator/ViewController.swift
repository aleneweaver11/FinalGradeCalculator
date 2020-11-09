//
//  ViewController.swift
//  FinalGradeCalculator
//
//  Created by  on 10/16/20.
//  Copyright © 2020 AubreyApps. All rights reserved.
//

import UIKit

//class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
class ViewController: UIViewController {
    @IBOutlet weak var textCurrGrade: UITextField!
    @IBOutlet weak var textFinalExamPct: UITextField!
    @IBOutlet weak var textDesiredGrade: UITextField!
    @IBOutlet weak var labelFinalExamGrade: UILabel!
    @IBOutlet weak var letterGradeSelect: UISegmentedControl!
    @IBOutlet weak var labelExtraCredit: UILabel!
    
    override func viewDidLoad() {        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func segControlGrade(_ sender: UISegmentedControl)
    {
        switch letterGradeSelect.selectedSegmentIndex
        {
        case 0:
            textDesiredGrade.text = "90"
        case 1:
            textDesiredGrade.text = "80"
        case 2:
            textDesiredGrade.text = "70"
        case 3:
            textDesiredGrade.text = "60"
        default:
            textDesiredGrade.text = "90"
        }
    }
    @IBAction func calcFinalExamGrade(_ sender: UIButton)
    {
        let currClassGrade: Double
        guard let tempText1 = textCurrGrade.text else { return }
        currClassGrade = Double(tempText1)!
        
        let finalExamPct: Double
        guard let tempText2 = textFinalExamPct.text else { return }
        finalExamPct = Double(tempText2)!
        
        let desiredFinalGrade: Double
        guard let tempText3 = textDesiredGrade.text else { return }
        desiredFinalGrade = Double(tempText3)!
        
        //calculate the total class percent
        let classPct: Double
        classPct = 100.0 - finalExamPct
        
        //calculate the total class score
        let totalClassScoreFactor: Double
        totalClassScoreFactor = currClassGrade * ((classPct/100))
        
        //calculate the difference betweeing the Final Desired Class grade and the "totalClassScore
        let totalFinalExamScoreFactor: Double
        totalFinalExamScoreFactor = desiredFinalGrade - totalClassScoreFactor
        
        //finally figure out the grade needed on the final exam and then round it up
        var finalExamGrade: Double
        finalExamGrade = ((totalFinalExamScoreFactor)/(finalExamPct/100))
        finalExamGrade.round(.up)
    
        labelFinalExamGrade.text = String(finalExamGrade)
            
        if finalExamGrade <= 100.0 {
            view.backgroundColor = UIColor.green
            labelExtraCredit.text = ""
        } else {
            view.backgroundColor = UIColor.red
            labelExtraCredit.text = "Ask for Extra Credit"
        }
        
        }
    }
    
