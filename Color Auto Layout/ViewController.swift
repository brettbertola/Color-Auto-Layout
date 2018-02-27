//
//  ViewController.swift
//  Color Auto Layout
//
//  Created by Brett Bertola on 2/26/18.
//  Copyright © 2018 Brett Bertola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var bSlider: UISlider!
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var rbgLabels: UIView!
    
    var redValue: CGFloat = 1
    var greenValue: CGFloat = 1
    var blueValue: CGFloat = 1
    
    let redKey = "red"
    let greenKey = "green"
    let blueKey = "blue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpEverything()
    }

    @IBAction func rSliderChange(_ sender: UISlider) {
        updateColorAndLabels(sender.value, color: redKey)
    }
    
    @IBAction func gSliderChange(_ sender: UISlider) {
        updateColorAndLabels(sender.value, color: greenKey)
    }
    
    @IBAction func bSliderChange(_ sender: UISlider) {
        updateColorAndLabels(sender.value, color: blueKey)
    }
    
    func updateBackground() {
        color.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    
    func updateColorAndLabels(_ sliderValue: Float, color: String) {
        
        let cgValue = CGFloat(sliderValue / 255)
        let oppositeValue = (CGFloat(sliderValue / 255) - 0.95) * -1
        
        switch color {
        case redKey:
            rLabel.text = "R: " + "\(Int(sliderValue))"
            redValue = cgValue
            rSlider.thumbTintColor = UIColor(red: 0.95, green: oppositeValue, blue: oppositeValue, alpha: 1.0)
            rSlider.minimumTrackTintColor = UIColor(red: 0.95, green: oppositeValue, blue: oppositeValue, alpha: 1.0)
        case greenKey:
            gLabel.text = "G: " + "\(Int(sliderValue))"
            greenValue = cgValue
            gSlider.thumbTintColor = UIColor(red: oppositeValue, green: 0.95, blue: oppositeValue, alpha: 1.0)
            gSlider.minimumTrackTintColor = UIColor(red: oppositeValue, green: 0.95, blue: oppositeValue, alpha: 1.0)
        case blueKey:
            bLabel.text = "B: " + "\(Int(sliderValue))"
            blueValue = cgValue
            bSlider.thumbTintColor = UIColor(red: oppositeValue, green: oppositeValue, blue: 0.95, alpha: 1.0)
            bSlider.minimumTrackTintColor = UIColor(red: oppositeValue, green: oppositeValue, blue: 0.95, alpha: 1.0)

        default:
            print("ERROR! Color does not exist.")
        }
        
        updateBackground()
        
    }
    func setUpEverything() {
        
        rbgLabels.alpha = 0.5
        rbgLabels.layer.cornerRadius = 5
        color.layer.cornerRadius = 5
        
        rLabel.alpha = 1.0
        gLabel.alpha = 1.0
        bLabel.alpha = 1.0
        
        rSlider.value = 67
        gSlider.value = 150
        bSlider.value = 25
        
        updateColorAndLabels(bSlider.value, color: blueKey)
        updateColorAndLabels(rSlider.value, color: redKey)
        updateColorAndLabels(gSlider.value, color: greenKey)
        
    }
}

