//
//  ViewController.swift
//  AppleCalculator
//
//  Created by Mehmet Yumurtacı on 6/13/23.
//

import UIKit

enum Operation : String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case null = "Null"
    case percentage = "%"
    case minusPlus = "+/-"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
   
    var runningNumber = ""
    var leftValue = ""
    var rigthValue = ""
    var result = ""
    var currentOperation : Operation = .null
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.outputLabel.text = "0"
       
    }

    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rigthValue = ""
        currentOperation = .null
        outputLabel.text = "0"
    }
    
    @IBAction func minusPlusPressed(_ sender: RoundButton) {
        operation(operation: .minusPlus)
    }
    
    
    @IBAction func percentagePressed(_ sender: RoundButton) {
        operation(operation: .percentage)
    }
    
    
    @IBAction func commaPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7{
            runningNumber += ","
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .divide)
    }
    
    func operation(operation : Operation) {
        if currentOperation != .null {
            if runningNumber != "" {
                rigthValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .add {
                    result = "\(Double(leftValue)! + Double(rigthValue)!)"
                }else if currentOperation == .subtract {
                    result = "\(Double(leftValue)! - Double(rigthValue)!)"
                }else if currentOperation == .multiply {
                    result = "\(Double(leftValue)! * Double(rigthValue)!)"
                }else if currentOperation == .divide {
                    result = "\(Double(leftValue)! / Double(rigthValue)!)"
                }else if currentOperation == .percentage {
                    result = "\((Double(leftValue)! * Double(rigthValue)!) / 100)"
                }else if currentOperation == .minusPlus {
                    result = "\(Double(outputLabel.text!)! * -1)"
                }
                leftValue = result
                if (Double(result))!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
                
            
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

