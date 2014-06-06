//
//  ViewController.swift
//  Calculator
//
//  Created by Sachin Kesiraju on 6/3/14.
//  Copyright (c) 2014 Sachin Kesiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultLabel : UILabel
    
    var userEnteringNumber :Bool = true
    var operandStack: NSMutableArray = []  //array containing two numbers to equate
    var operationSelected:NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberPressed(sender : AnyObject) {
        
        var digit: NSString = (sender.currentTitle)
        println(digit)
        if(userEnteringNumber == true)
        {
        self.resultLabel.text = self.resultLabel.text.stringByAppendingString(digit)
        }
        else
        {
            self.resultLabel.text = digit
        }
    }

    @IBAction func operationPressed(sender : AnyObject) {
        
        if(self.userEnteringNumber == true)
        {
            var numberCurrentlyDisplayed:NSString = self.resultLabel.text
            println(numberCurrentlyDisplayed)
            operationSelected = (sender.currentTitle)
            self.pushOperand(numberCurrentlyDisplayed.doubleValue)
            self.resultLabel.text = ""
        }
    }
    
    @IBAction func equatePressed(sender : AnyObject) {
        
        var numberShownBeforeEquate:NSString = self.resultLabel.text
        println(numberShownBeforeEquate)
        self.pushOperand(numberShownBeforeEquate.doubleValue)
        self.userEnteringNumber = false
        var result:Double = self.performOperation(operationSelected)
        var resultNumber:NSNumber = result as NSNumber
        println(resultNumber)
        self.resultLabel.text = resultNumber.stringValue
    }
    
    @IBAction func clearScreen (sender :AnyObject)
    {
        self.resultLabel.text = "0"
        operandStack.removeAllObjects()
    }
    
    func pushOperand (operand:Double) //Add numbers to array
    {
        operandStack.addObject(NSNumber.numberWithDouble(operand))
    }
    
    func popOperand () -> Double //returns number to calculate with
    {
        var operandObject:NSNumber = self.operandStack.firstObject as NSNumber
        println(operandObject)
        self.operandStack.removeObjectAtIndex(0)
        var operandObjectString:NSString = operandObject.stringValue
        return (operandObjectString.doubleValue)
    }
    
    func performOperation (operation:NSString) -> Double
    {
        var result:Double = 0
        switch operation
        {
            case "+": result = self.popOperand() + self.popOperand()
            case "-": result = self.popOperand() - self.popOperand()
            case "x": result = self.popOperand() * self.popOperand()
            case "/": result = self.popOperand() / self.popOperand()
            default: break
        }
        self.pushOperand(result)
        println(result)
        return result
    }
}

