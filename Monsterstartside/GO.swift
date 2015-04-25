//
//  GO.swift
//  ZappLocationTracking
//
//  Created by Magnus Kinly on 17/04/15.
//  Copyright (c) 2015 Zappdesigntemplates.com. All rights reserved.
//

import Foundation
import UIKit

class videre: UIViewController {
    
    var highlighted: Bool = false
    var highlightedButton: UIButton!
    
    @IBOutlet var btnRun: UIButton!
    @IBOutlet var btnCycle: UIButton!
    @IBOutlet var btnWalk: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
     override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        highlightedButton = btnWalk
        highLightButton(btnWalk)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "start" {
            var storyboard = segue.destinationViewController as! Aktiv
            storyboard.travelType = "\(travelType())"
            
        }
    }
    
    func travelType() -> Int{
        switch(highlightedButton){
        case btnRun:
            return 0
            break;
        case btnWalk:
            return 1
            break;
        case btnCycle:
            return 2
            break;
        default:
            return 2
            break
        }
    }
    
    @IBAction func cycling(sender: AnyObject) {
        var button = sender as! UIButton
        removeHighlightButton(highlightedButton)
        highLightButton(button)
        
    }
    
    func highLightButton (tmpbtn: UIButton){
        tmpbtn.layer.shadowColor = UIColor.cyanColor().CGColor
        tmpbtn.layer.shadowOffset = CGSizeZero
        tmpbtn.layer.shadowRadius = 10.0
        tmpbtn.layer.shadowOpacity = 1.0
        highlightedButton = tmpbtn
    }
    
    func removeHighlightButton(tmpbtn: UIButton){
        tmpbtn.layer.shadowColor = UIColor.clearColor().CGColor
    }

}
