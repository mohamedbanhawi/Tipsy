//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billAmountLabel: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill = Bill(total: 0.0, tipPct: 10, split: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        
        bill.total = Float(billAmountLabel.text!)
        
        print(bill.total ?? 0.0)
        
        splitNumberLabel.text = String(format: "%2d", bill.split ?? 2)
        
        
        twentyPctButton.isSelected = false
        
        
        if (bill.tipPct == 20)
        {
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
        }
        else if (bill.tipPct == 10)
        {
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = true
        }
        else if (bill.tipPct == 0)
        {
            zeroPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = false
            bill.tipPct = 0
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        bill.split = Int(sender.value)
        
        billAmountLabel.endEditing(true)
        
        updateUI()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if (sender.currentTitle == "20%")
        {
            bill.tipPct = 20
        }
        else if (sender.currentTitle == "10%")
        {
            bill.tipPct = 10
        }
        else if (sender.currentTitle == "0%")
        {
            bill.tipPct = 0
        }
        
        billAmountLabel.endEditing(true)
        
        updateUI()
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        updateUI()
        
        performSegue(withIdentifier : "goToResultsView", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToResultsView")
        {
            let resultsVC = segue.destination as! ResultViewController
            
            resultsVC.bill = self.bill
            
        }
    }
    
    
    
    
}

