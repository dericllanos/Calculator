//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Frederic Rey Llanos on 22/04/2022.
//

import UIKit

class ViewController: UIViewController {
    // LABELS
    @IBOutlet weak var operationValue: UILabel!
    @IBOutlet weak var Output: UILabel!
    
    var Input = ""
    var counter = 1
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }
    //CUSTOM FUNCTIONS
    func clearAll() {
        Input = ""
        operationValue.text = ""
        //Output.text = ""
    }
    
    func addInput(value: String) {
        Input += value
        operationValue.text = Input
    }
    
    func formatOutput(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in Input {
            if specialCharacter(char: char) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for i in funcCharIndexes {
            if i==0 || i==Input.count-1 {
                return false
            }
            
            if previous != -1 {
                if i-previous == 1 {
                    return false
                }
            }
            previous = i
        }
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if char == "*" {
            return true
        }
        if char == "/" {
            return true
        }
        if char == "+" {
            return true
        }
        else {
            return false
        }
    }
    
    //FUNCTION BUTTONS
    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func posNegative(_ sender: Any) {
        counter += 1
        if counter%2>0 {
            num = Int(Input) ?? 0
            Input = String(num * -1)
        }
        operationValue.text = Input
    }
    
    @IBAction func Percentage(_ sender: Any) {
        addInput(value: "%")
    }
    
    @IBAction func decimal(_ sender: Any) {
        addInput(value: ".")
    }
    
    @IBAction func Equals(_ sender: Any) {
        if validInput() {
            if !Input.contains(".") {
                Input += ".00"
            }
            let outputPercent = Input.replacingOccurrences(of: "%", with: "*0.01")
            let Expression = NSExpression(format: outputPercent)
            let result = Expression.expressionValue(with: nil, context: nil) as! Double
            let outputString = formatOutput(result: result)
            Input = outputString
            operationValue.text = outputString
        }
        else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Error",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func Add(_ sender: Any) {
        addInput(value: "+")
    }
    
    @IBAction func Subtract(_ sender: Any) {
        addInput(value: "-")
    }
    
    @IBAction func Multiply(_ sender: Any) {
        addInput(value: "*")
    }
    
    @IBAction func Divide(_ sender: Any) {
        addInput(value: "/")
    }
    //NUMBER BUTTONS
    @IBAction func Zero(_ sender: Any) {
        addInput(value: "0")
    }
    
    @IBAction func One(_ sender: Any) {
        addInput(value: "1")
    }
    
    @IBAction func Two(_ sender: Any) {
        addInput(value: "2")
    }
    
    @IBAction func Three(_ sender: Any) {
        addInput(value: "3")
    }
    
    @IBAction func Four(_ sender: Any) {
        addInput(value: "4")
    }
    
    @IBAction func Five(_ sender: Any) {
        addInput(value: "5")
    }
    
    @IBAction func Six(_ sender: Any) {
        addInput(value: "6")
    }
    
    @IBAction func Seven(_ sender: Any) {
        addInput(value: "7")
    }
    
    @IBAction func Eight(_ sender: Any) {
        addInput(value: "8")
    }
    
    @IBAction func Nine(_ sender: Any) {
        addInput(value: "9")
    }
}

