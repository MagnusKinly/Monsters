//
//  ViewController.swift
//  Monsterstartside
//
//  Created by Magnus Kinly on 14/04/15.
//  Copyright (c) 2015 MaaMetis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    var currentage: Int = 13
    var currentWeight: Int = 35

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let user = defaults.stringForKey("currentUser"){
            self.view.hidden = true;
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let defaults = NSUserDefaults.standardUserDefaults()
        if let user = defaults.stringForKey("currentUser") {
            println("this should work")
            self.performSegueWithIdentifier("initial", sender: self)
        }
    }
    
    @IBOutlet var sex: UISegmentedControl!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sliderAgeChanged(sender: UISlider) {
        
        currentage = Int(sender.value)
        
        label.text = "\(currentage)"
    }
    @IBAction func sliderWeightChanged(sender: UISlider) {
        currentWeight = Int(sender.value)
        labelWeight.text = "\(currentWeight)"
    }
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    

    
    @IBAction func start(sender: UIButton) {
        //let defaults = NSUserDefaults.standardUserDefaults();
       // defaults.setObject(, forKey: "settings");
        var saveValue = "\(sex.selectedSegmentIndex):\(currentage):\(currentWeight):"
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(saveValue, forKey: "currentUser")
        performSegueWithIdentifier("initial", sender: self)
    }
    
    
 
            
    
    
}

