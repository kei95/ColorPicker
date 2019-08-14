//
//  ViewController.swift
//  ColorPicker
//
//  Created by Yamashtia Keisuke on 2019-08-13.
//  Copyright © 2019 Yamashtia Keisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSwitch: UISwitch!
    
    @IBOutlet weak var greenSwitch: UISwitch!
    
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorView.layer.cornerRadius = 16
        colorView.layer.borderWidth = 3.0
        colorView.layer.borderColor = UIColor.black.cgColor
        
        updateControl()
        updateColor()
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        // tap switches
        // 1. update switches or sliders(enable or disable)
        updateControl()
        // 2. update colorView
        updateColor()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        updateColor()
    }
    
    
    private func updateControl() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    private func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if(redSwitch.isOn){
            red = CGFloat(redSlider.value)
        }
        if(greenSwitch.isOn){
            green = CGFloat(greenSlider.value)
        }
        if(blueSwitch.isOn){
            blue = CGFloat(blueSlider.value)
        }
        let bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        colorView.backgroundColor = bgColor
    }

    @IBAction func resetBtnTapped(_ sender: Any) {
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        
        redSwitch.isOn = true
        greenSwitch.isOn = true
        blueSwitch.isOn = true
        updateColor()
        updateControl()
    }
}

