//
//  ViewController.swift
//  pizzaDemo version 2
//  adds a model class to demonstrate class
//
//  Created by Steven Lipton on 6/8/14.
//  Copyright (c) 2014 Steven Lipton. All rights reserved.
//
//

import UIKit

/* --------

Our model for MVC
keeps data  and calcualtions
about pizzas

note: for ease in copying I left this in one file
you can make a seperate file and use import instead.

------------*/
class Pizza
{
    let pi = 3.1415926
    
    var pizzaDiameter = 0.0
    let maxPizza = 24.0
    var pizzaType = "Cheese"
    
    var radius : Double {  //computed property
    get{   //must define a getter
        return pizzaDiameter/2.0
    }
    set(newRadius){ //optionally define a setter
        pizzaDiameter = newRadius * 2.0
    }
    }
    
    var area :  Double {
    get{
        return pizzaArea()
    }
    }
    
    
    func pizzaArea() -> Double{
        return radius * radius * pi
    }
    
    func diameterFromString(aString:NSString) -> Double {
        switch aString {
        case "Personal":
            return 8.0
        case "10\"":
            return 10.0
        case "12\"":
            return 12.0
        case "16\"","15\"":
            return 16.0
        case "18\"":
            return 18.0
        case "24\"":
            return 24.0
        default:
            return 0.0
        }
    }
    
    
}


/*----------

The View Controller

-----------------*/

class ViewController: UIViewController {
    
    let pizza = Pizza()
    let clearString = "I Like Pizza!"
    
    @IBOutlet var resultsDisplayLabel : UILabel
    
    @IBAction func pizzaType(sender : UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        pizza.pizzaType = sender.titleForSegmentAtIndex(index)
        displayPizza()
    }
    
    func displayPizza(){
        let displayString = NSString(format:"%6.1f inch %@ Pizza",pizza.pizzaDiameter, pizza.pizzaType)
        resultsDisplayLabel.text = displayString
    }
    
    @IBAction func sizeButton(sender : UIButton) {
        pizza.pizzaDiameter = pizza.diameterFromString(sender.titleLabel.text)
        displayPizza()
    }
    
    
    @IBAction func clearDisplayButton(sender : UIButton) {
        resultsDisplayLabel.text = clearString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsDisplayLabel.text = clearString
        view.backgroundColor = UIColor(red:0.99,green:0.9,blue:0.9,alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

