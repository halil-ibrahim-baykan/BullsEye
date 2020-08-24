//
//  ViewController.swift
//  BullsEye
//
//  Created by halil ibrahim baykan on 14/08/2020.
//  Copyright © 2020 halil ibrahim baykan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)

    }
    
    
    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String

        switch difference {
        case 0:
            title = "Perfect"
            points += 100
        case 1:
            title = "You almost had it!"
            points += 50
        case 2..<5:
            title = "You almost had it!"
        case 5..<10:
            title = "Pretty good!"
        default:
            title = "Not even close.."
                
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        showAlert(title: title, message: message)
  
    }
 
    @IBAction func sliderMoved(_ slider: UISlider ){
        currentValue = Int(slider.value.rounded())
    }
    
    @IBAction func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text  = String(score)
        roundLabel.text = String(round)
    }


}

extension ViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            self.startNewRound()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

