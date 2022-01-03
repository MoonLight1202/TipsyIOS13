//
//  ResultsViewController.swift
//  TipsyIOS13
//
//  Created by MoonLight on 03/01/2022.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalll = 0.0
    var peopleNum = 0.0
    var tipPct = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalll)
        settingsLabel.text = "Split between \(String(format: "%.0f",peopleNum)) people, with \(String(format: "%.0f",tipPct * 100)) %"
    }
    @IBAction func RecalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
