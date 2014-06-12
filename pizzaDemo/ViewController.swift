//
//  ViewController.swift
//  pizzaDemo
//
//  Created by Steven Lipton on 6/8/14.
//  Copyright (c) 2014 Steven Lipton. All rights reserved.
//

import UIKit







class ViewController: UIViewController {
    
    let π=3.1415926
    let pi=3.1415926
    let clearString = "I Like Pizza!"
    let maxPizza = 24.0
    var z = 0.0
    var 🍕 = 0.0
    var diameter = 0.0
    var area:Double = 0.0
    
    
    @IBOutlet var resultsDisplayLabel : UILabel
    @IBOutlet var sliderDisplayLabel : UILabel
    @IBOutlet var diameterSlider : UISlider
    @IBAction func computeButton(sender : UIButton) {
        area = pi * z * z
        let formattedAnswer = NSString(format:"%6.2f",area)
        let unitsString = "  square in of 🍕"
        resultsDisplayLabel.text = formattedAnswer + unitsString
    }
    @IBAction func clearDisplayButton(sender : UIButton) {
        resultsDisplayLabel.text = clearString
        diameterSlider.value = 0
    }
    
    @IBAction func diameterSlider(sender : UISlider) {
        diameter = Double(sender.value) * maxPizza
        z = diameter / 2.0
        let feedbackString = NSString(format:"%6.2f in",diameter)
        sliderDisplayLabel.text = feedbackString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsDisplayLabel.text = clearString
        view.backgroundColor = UIColor(red:0.99,green:0.9,blue:0.9,alpha:1.0)
        diameterSlider.value = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

