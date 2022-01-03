//
//  CalculatorViewController.swift
//  TipsyIOS13
//
//  Created by MoonLight on 03/01/2022.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var BillValueTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipPct = 0.10
    var splitNum = 2.0
    var totalNum = 0.0
    @IBAction func TipChanged(_ sender: UIButton) {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        tipPct = Double(String(sender.currentTitle!.dropLast()))! / 100
        BillValueTextField.endEditing(true)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNum = sender.value
        splitNumberLabel.text = String(format: "%.0f", splitNum)
        BillValueTextField.endEditing(true)
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let newString = (BillValueTextField.text)!.replacingOccurrences(of: ",", with: ".")
        let billvalue = Double(newString) ?? 0.0
        self.performSegue(withIdentifier: "ChuyenTab", sender: self)
        totalNum = ((1.0 + tipPct) * billvalue) / 5
        print(totalNum)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChuyenTab"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalll = totalNum
            destinationVC.tipPct = tipPct
            destinationVC.peopleNum = splitNum
        }
    }
}

