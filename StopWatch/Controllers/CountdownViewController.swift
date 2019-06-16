//
//  CountdownViewController.swift
//  StopWatch
//
//  Created by Adakhanau on 10/04/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var timeScreen: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var stopOutlet: UIButton!
    @IBOutlet weak var pauseOutlet: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
    }
    
    
    //MARK: - Proporties
    var seconds = 30
    var timer = Timer()
    
    
    //MARK: - Buttons, Slider
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timeScreen.text = seconds.toTimeScreen()
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        runTimer()
        
        sliderOutlet.isHidden = true
        startOutlet.isEnabled = false
        
        stopOutlet.isEnabled = true
        pauseOutlet.isEnabled = true
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
        stop()
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        stop()
        timeScreen.text = seconds.toTimeScreen()

        stopOutlet.isEnabled = false
        seconds = 30
    }
    
    
    //MARK: - Functions
    
    func initSetup() {
        pauseOutlet.isEnabled = false
        stopOutlet.isEnabled = false
        sliderOutlet.isContinuous = false
        
        timeScreen.text = seconds.toTimeScreen()
        sliderOutlet.setValue(Float(seconds), animated: true)
    }
    
    func stop() {
        timer.invalidate()
        sliderOutlet.isHidden = false
        pauseOutlet.isEnabled = false
        startOutlet.isEnabled = true
    }
    
    // Run Timer Functions
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountdownViewController.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter() {
        if (seconds == 0) {
            sliderOutlet.setValue(0, animated: true)
            stop()
        } else {
            seconds -= 1
        }
        timeScreen.text = seconds.toTimeScreen()
    }
    
}
