//
//  pizzaTypePriceVC.swift
//  pizzaDemo
//
//  Created by Steven Lipton on 7/1/14.
//  Copyright (c) 2014 Steven Lipton. All rights reserved.
//

import UIKit
protocol PizzaTypePriceDelegate{
    func pizzaTypeDidFinish(controller:pizzaTypePriceVC, type:String,price:Double)
}

class pizzaTypePriceVC: UIViewController {
    @IBOutlet var pizzaTypeLabel: UILabel!
    @IBOutlet var pizzaPriceLabel: UILabel!
    @IBOutlet var priceStepper: UIStepper!
    @IBOutlet var priceText: UITextField!
    
    var pizzaType = "pizza Type"
    var pizzaPrice = 0.0
    var delegate:PizzaTypePriceDelegate? = nil
    func displayPizzaPrice(){
        pizzaPriceLabel.text = NSString(format:"%6.3f",pizzaPrice)
    }
    func displayPizzaPriceInText(){
        priceText.text = NSString(format:"%6.3f",pizzaPrice)
    }
    @IBAction func priceText(sender: UITextField) {
        let priceString:NSString = sender.text
        pizzaPrice = priceString.doubleValue
        displayPizzaPrice()
    }
    @IBAction func priceStepper(sender: UIStepper) {
        pizzaPrice = sender.value
        displayPizzaPrice()
        displayPizzaPriceInText()
    }

    @IBAction func doneButton(sender: UIBarButtonItem) {
        if delegate {
            delegate!.pizzaTypeDidFinish(self, type: pizzaType, price: pizzaPrice)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaTypeLabel.text = pizzaType
        priceStepper.value = pizzaPrice
        displayPizzaPrice()
        displayPizzaPriceInText()
    }
}
