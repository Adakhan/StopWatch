//
//  ViewController.swift
//  StopWatch
//
//  Created by Adakhanau on 03/04/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var timeScreen: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var pauseLabel: UIButton!
    @IBOutlet weak var resetLabel: UIButton!

    
    //MARK: - Proporties
    var seconds = 0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
    }
    
    
    //MARK: - Buttons
    @IBAction func startButton(_ sender: UIButton) {
        runTimer()
        pauseLabel.isEnabled = true
        resetLabel.isEnabled = true
        startLabel.isEnabled = false
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        stop()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        stop()
        resetLabel.isEnabled = false
        
        seconds = 0
        timeScreen.text = seconds.toTimeScreen()
    }
    
    
    //MARK: - Functions
    
    func initSetup() {
        pauseLabel.isEnabled = false
        resetLabel.isEnabled = false
        timeScreen.text = seconds.toTimeScreen()
    }
    
    func stop() {
        timer.invalidate()
        startLabel.isEnabled = true
        pauseLabel.isEnabled = false
    }
    
    // Run Timer Functions
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    
    @objc func action() {
        seconds += 1
        timeScreen.text = seconds.toTimeScreen()
    }
    
}

