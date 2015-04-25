//
//  ViewController.swift
//  Monsterstartside
//
//  Created by Magnus Kinly on 14/04/15.
//  Copyright (c) 2015 MaaMetis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var label: UILabel!
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        var currentValue = Int(sender.value)
        
        label.text = "\(currentValue)"
    }
    
    @IBOutlet weak var Slider1: UISlider!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBAction func slider1ValueChanged(sender: UISlider) {
        
        var currentValue = Int(sender.value)
        
        label1.text = "\(currentValue)"
    }
    
    
    
 
            
    
    
}

