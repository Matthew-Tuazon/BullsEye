//
//  ViewController.swift
//  BullsEye
//
//  Created by Mac Os on 7/17/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
//        currentValue = lroundf(slider.value)
//        targetValue =  1 + Int(arc4random_uniform(100))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        //alert message's message
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert
        )
        
        //alert message's button user's tap on, as a confirmation to seeing the message.
        let action = UIAlertAction(title:"OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("The slider's current value is:  \(sender.value) ") 
    }
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
}

