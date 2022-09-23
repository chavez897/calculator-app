//
//  ViewController.swift
//  Calculator
//
//  Created by Rodrigo Chavez Mercado on 2022-09-23.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet var outputlBL: UILabel!
    var numberOnScreen = 0.0
    var previousNumber = 0.0
    var performingMath = false
    var operation = 0
    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberBtn(_ sender: UIButton) {
        if performingMath {
            outputlBL.text = ""
            outputlBL.text = String(sender.tag)
            numberOnScreen = Double(outputlBL.text!)!
            performingMath = false
        } else {
            outputlBL.text = outputlBL.text! + String(sender.tag)
            numberOnScreen = Double(outputlBL.text!)!
        }
    }
    
    @IBAction func operatorBtn(_ sender: UIButton) {
        if (outputlBL.text! != "" && sender.tag > 11) {
            previousNumber = numberOnScreen
            switch sender.tag {
                case 12:
                    outputlBL.text = "+"
                case 13:
                    outputlBL.text = "-"
                case 14:
                    outputlBL.text = "/"
                case 15:
                    outputlBL.text = "*"
                default:
                    break
            }
            operation = sender.tag
            performingMath = true
        } else if (sender.tag == 11) {
            switch operation {
                case 12:
                    outputlBL.text = String(previousNumber + numberOnScreen)
                case 13:
                    outputlBL.text = String(previousNumber - numberOnScreen)
                case 14:
                    outputlBL.text = String(previousNumber / numberOnScreen)
                case 15:
                    outputlBL.text = String(previousNumber * numberOnScreen)
                default:
                    break
            }
        } else {
            numberOnScreen = 0.0
            previousNumber = 0.0
            performingMath = false
            operation = 0
            outputlBL.text = ""
        }
    }
    
}

