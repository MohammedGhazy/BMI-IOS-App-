//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mohamed Ghazy on 8/17/20.
//  Copyright © 2020 Mohamed Ghazy. All rights reserved.
//

import Foundation
import UIKit
struct CalculatorBrain {
    
    var bmi: BMI?
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red:1,green:1,blue:1,alpha:1)
    }
    
    mutating func calculateBmi(height: Float, weight: Float)  {
       let  bmiValue = weight / (height * height)
        if bmiValue > 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat More Pies!",color: #colorLiteral(red:0.4745,green:0.8392,blue: 0.9764, alpha:1))
        }else if bmiValue > 24.9{
            bmi = BMI(value: bmiValue, advice: "Eat More Pies!",color: #colorLiteral(red: 1, green: 0.2650773525, blue: 0.418061018, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!",color: #colorLiteral(red: 0.5281811953, green: 0.5765802264, blue: 0.9138934016, alpha: 1))
        }
    }
}
