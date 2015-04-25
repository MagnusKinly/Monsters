
import UIKit
import MapKit
import CoreLocation

class Aktiv: UIViewController, CLLocationManagerDelegate {
    
    
    
    // Her begynder trackningen at begynde kodemæssigt
    
    
    //TRACKER
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var trackButton: UIButton!
    @IBOutlet var lblCalories: UILabel!
    
    @IBOutlet var lblStarPoints: UILabel!
    
    //TIMER
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    var travelType: String!
    var userSettings: Array<String>!
    var locationManager: CLLocationManager!
    var totalDistane: Double = 0
    var isUserTracking: Bool = false
    var oldLocation: CLLocation?
    var startTime = NSTimeInterval()
    var elapsedTime = NSTimeInterval()  // Ny tid
    var currentTime = NSTimeInterval()
    var startTimeDate = NSDate()        // Ny tid
    var timer:NSTimer = NSTimer()
    var paused = true
    var factor: Double = 0.0
    var starPoints: Int = 0
    var defaults: NSUserDefaults!
    

    
    //BILLEDER::::
    
    
    
    //Sender signal til button om at begynde trackning
    
    @IBAction func trackButtonPressed(sender: AnyObject) {
        if isUserTracking && (paused)
        {
            trackButton.setTitle("Fortsæt", forState: UIControlState.Normal)
            distanceLabel.text = NSString(format: "%.2f km", totalDistane/1000) as? String
            isUserTracking = false
            elapsedTime = startTimeDate.timeIntervalSinceNow                  // Ny tid
            paused = false
            timer.invalidate()
    
           

           
           
        }
        else
            
            
        {
            
            //NÅR MAN TRYKKER PÅ START SKER DETTE:::
            
            isUserTracking = true
            //trackButton.setTitle("Pause", forState: .Normal)
            distanceLabel.text = NSString(format: "%.2f km", totalDistane/1000) as? String
            trackButton.setTitle("Pause", forState: UIControlState.Normal)   // Ny tid
       
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
             startTime = NSDate.timeIntervalSinceReferenceDate()  + elapsedTime
            paused = true
            
        

        }
        
  
        
       /* if (!timer.valid) {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()  + elapsedTime
        }*/
            
        /*else
        {
            trackButton.setTitle("Fortsæt", forState: UIControlState.Normal)   // Ny tid
            elapsedTime += startTimeDate.timeIntervalSinceNow                  // Ny tid
            timer.invalidate()
            
        }*/
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        defaults = NSUserDefaults.standardUserDefaults()
        if let user = defaults.stringForKey("currentUser"){
            userSettings = split(user) {$0 == ":"}
            
            var typeBurn = 0.0
            switch(travelType){
                case "0":
                    if userSettings[0] == "0" {
                        typeBurn = 0.3
                    }
                    else{
                        typeBurn = 0.27
                    }
                    break;
                case "1":
                    if userSettings[0] == "0" {
                        typeBurn = 0.86
                    }
                    else{
                        typeBurn = 0.78
                    }
                    break;
                case "2":
                    if userSettings[0] == "0" {
                        typeBurn = 0.4
                    }
                    else{
                        typeBurn = 0.36
                    }
                    break;
            default:
                println("Should not be here")
                break;
            }
            factor = typeBurn * (userSettings[2] as NSString).doubleValue
        }
        else{
            println("No user is created")
        }
        if defaults.objectForKey("starPoints") != nil{
            starPoints = defaults.integerForKey("starPoints")
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        defaults.setInteger(starPoints, forKey: "starPoints")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func createLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.activityType = .Fitness
    }
    
    func updateDistanceLabel() {
        distanceLabel.text = NSString(format: "%.2f km", totalDistane/1000) as? String
    }
    
    // MARK: location tracking
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let firstLocation = locations.first as? CLLocation
        {
            
            let region = MKCoordinateRegionMakeWithDistance(firstLocation.coordinate, 1000, 1000)
            
            if isUserTracking
            {
                if let oldLocation = oldLocation
                {
                    let delta: CLLocationDistance = firstLocation.distanceFromLocation(oldLocation)
                    totalDistane += delta
                    updateDistanceLabel()
                    
                }
            }
            
            oldLocation = firstLocation
        }
    }
    
    
    
    
    
    
    
    
    
    //HER BEGYNDER TIMEREN AT BLIVE KODET!!
    
    
    
    // Do any additional setup after loading the view.
    



  
    func updateTime() {
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = Int(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = Int(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        //concatenate minutes, seconds and milliseconds as assign it to the UILabel
        displayTimeLabel.text = String("\(strMinutes):\(strSeconds):\(strFraction)")
        println("Seconds: \(Double(seconds))")
        println("Minutes: \(Double(minutes))")
        println("Fraction: \(Double(fraction))")
        let kcal = (Double(minutes) + (Double(seconds)/60) + (Double(fraction)/60/100)) * factor * 0.24
        lblCalories.text = "Kcal: \(Double(round(10*kcal)/10))"
        if userSettings[0] == "1"{
            starPoints = Int(kcal * 1.48)
        }
        else{
            starPoints = Int(kcal * 1.33)
        }
        lblStarPoints.text = "\(starPoints)"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}



