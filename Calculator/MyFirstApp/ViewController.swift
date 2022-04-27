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
    
    var Input = ""
    var counter = 0
    var operation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }
    
    //CUSTOM FUNCTIONS
    func clearAll() {
        Input = ""
        operationValue.text = "0"
        counter = 0
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
            counter += 1
            return String(result)
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
        var num = Double(Input) ?? 0.0
        num = num * -1
        Input = formatOutput(result: num)
        operationValue.text = Input
    }
    
    @IBAction func Percentage(_ sender: Any) {
        var percentage = Double(Input) ?? 0.0
        percentage = percentage * 0.01
        Input = formatOutput(result: percentage)
        operationValue.text = Input
    }
    
    @IBAction func decimal(_ sender: Any) {
        if counter == 0
        {
            addInput(value: ".")
            counter += 1
        }
    }
    
    @IBAction func Equals(_ sender: Any) {
        if validInput() {
            if !Input.contains(".") {
                Input += ".00"
            }
            else if Input.contains(".") {
                let check = Input.components(separatedBy: ".")
                let check2 = Input.components(separatedBy: operation)
                let after = check[1]
                let after1 = check2[0]
                
                var word = Input
                
                if after.isEmpty || after1.isEmpty {
                    word = word.replacingOccurrences(of: ".", with: ".0")
                    Input = word
                    counter = 0
                }
            }
            
            let Expression = NSExpression(format: Input)
            let result = Expression.expressionValue(with: nil, context: nil) as! Double
            Input = formatOutput(result: result)
            operationValue.text = Input
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
        operation = "+"
        addInput(value: "+")
        counter = 0
    }
    
    @IBAction func Subtract(_ sender: Any) {
        operation = "-"
        addInput(value: "-")
        counter = 0
    }
    
    @IBAction func Multiply(_ sender: Any) {
        operation = "*"
        addInput(value: "*")
        counter = 0
    }
    
    @IBAction func Divide(_ sender: Any) {
        operation = "/"
        addInput(value: "/")
        counter = 0
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

