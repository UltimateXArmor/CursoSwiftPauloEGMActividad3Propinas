//
//  ViewController.swift
//  CursoSwiftPauloEGMActividad3Propinas
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var sliderPercent: UISlider!
    @IBOutlet weak var lblPercent: UILabel!
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func percentChangedAction(_ sender: Any) {
        let value = roundf(self.sliderPercent.value / 5.0) * 5.0
        self.sliderPercent.value = value
        
        self.lblPercent.text = "\(value) %"
        self.calcTips()
    }
    
    @IBAction func editingBillAction(_ sender: Any) {
        self.calcTips()
    }
    @IBAction func numberChanged(_ sender: Any) {
        self.calcTips()
    }
    
    func calcTips(){
        if let number = Float(self.billTextField.text ?? "0") {
            let percent = roundf(self.sliderPercent.value)
            let tip = number * percent  / 100.0
            let total = tip + number
            
            self.lblTip.text = "$\(tip)"
            self.lblTotal.text = "$\(total)"
        }
    }
}

