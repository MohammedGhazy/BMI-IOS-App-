//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Mohamed Ghazy on 8/17/20.
//  Copyright © 2020 Mohamed Ghazy. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f",sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBmi(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinaionVC = segue.destination as! ResultViewController
            destinaionVC.bmiValue = calculatorBrain.getBMIValue()
            destinaionVC.advice = calculatorBrain.getAdvice()
            destinaionVC.color = calculatorBrain.getColor()
        }
    }
}

