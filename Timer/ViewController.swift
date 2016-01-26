//
//  ViewController.swift
//  Timer
//
//  Created by Mads Peter Emborg on 22/01/2016.
//  Copyright © 2016 Mads Peter Emborg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UITextField!
    @IBOutlet weak var minuteSlider: UISlider!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = NSTimer()
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func minuteSliderChanged(sender: UISlider) {
        
        let minutes = Int(minuteSlider.value)
        seconds = minutes * 60
        let minutesText = String(Int(minuteSlider.value))
        self.displayLabel.text = "00:" + minutesText + ":00"
    }

    @IBAction func startButtonClicked(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countDown"), userInfo: nil, repeats: true)
    }
    @IBAction func stopButtonClicked(sender: UIButton) {
        timer.invalidate()
    }
    
    func countDown() {
        seconds--
        if(seconds <= 0) {
            timer.invalidate()
        }
        self.displayLabel.text = "00:00:" + String(seconds)
    }
}

