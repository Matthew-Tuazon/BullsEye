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
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var startNewGameButton: UIButton!
    
    
    
  //  var currentValue: Int = 0 // Swift's "Type inference" allows no need to declare value as an int, as 0 is a whole number (integer)
   // var targetValue: Int = 0
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var roundNumber = 0
    //var difference: Int = 0
    var messageTitle = "Placehold"
    
    //if (targetValue - currentValue) < 0 {
//  difference = (targetValue - currentValue) * -1

//}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        
      let difference = abs(currentValue - targetValue) //abs() func that takes abs value, so we can skip the following
      var points = 100 - difference
      //roundNumber += 1
      
//        if difference < 0 {
//            difference *= -1
//        }
//        if currentValue > targetValue { //difference is score for round
//            difference = currentValue - targetValue
//        } else if targetValue > currentValue {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
        
        if difference == 0 {
            messageTitle = "Perfect!"
            points += 100
        }else if difference == 1{
            messageTitle = "You almost had it!"
            points += 50
        } else if difference <= 25 {
            messageTitle = "Need just a little more effort!"
        }else if (difference > 25 && difference < 50){
            messageTitle = "You're a little off the mark! Try harder next time!"
        }else{
            messageTitle = "Not even close... try again!"
        }
        
        score += points
        
        //alert message's message
        let message = "You scored \(points) points!"
        let alert = UIAlertController(title: "\(messageTitle)", message: message, preferredStyle: .alert
        )
        
        //alert message's button user's tap on, as a confirmation to seeing the message.
        let action = UIAlertAction(title:"OK", style: .default, handler: {action in //closure, only performed when "OK" is tapped
            
            self.startNewRound() //self needed in closure, to refer to view controller
            self.updateLabels()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
//        startNewRound()
//        updateLabels()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("The slider's current value is:  \(sender.value) ") 
    }
    
    func startNewRound(){ //randomizes target Value from 1-100, default value at 50 at start, slider value equals where one places it
        roundNumber += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    @IBAction func startOver(_ sender: Any) {
        startNewGame()
        updateLabels()
    }
    
    
    func startNewGame(){
        roundNumber = 0
        score = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(roundNumber)"
    }
    
}


