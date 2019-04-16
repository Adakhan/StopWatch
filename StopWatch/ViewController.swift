//
//  ViewController.swift
//  StopWatch
//
//  Created by Adakhanau on 03/04/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Labels
    
    @IBOutlet weak var timeScreen: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var pauseLabel: UIButton!
    @IBOutlet weak var resetLabel: UIButton!
    
    
    
    
    //Proporties
    
    var time = 0
    var timer = Timer()
    var resumeTapped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseLabel.isEnabled = false
        resetLabel.isEnabled = false
        
        startLabel.layer.cornerRadius = 5
        pauseLabel.layer.cornerRadius = 5
        resetLabel.layer.cornerRadius = 5
    }
    
    
    //Actions
    
    @IBAction func startButton(_ sender: UIButton) {
        
        runTimer()
        pauseLabel.isEnabled = true
        resetLabel.isEnabled = true
        startLabel.isEnabled = false
        
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        if resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
            pauseLabel.setTitle("Resume", for: .normal)
        } else {
            runTimer()
            resumeTapped = false
            pauseLabel.setTitle("Pause", for: .normal)
        }
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        timer.invalidate()
        resumeTapped = false
        pauseLabel.isEnabled = false
        startLabel.isEnabled = true
        resetLabel.isEnabled = false
        time = 0
        timeScreen.text = String(time)
        pauseLabel.setTitle("Pause",for: .normal)
        
    }
    
    
    //functions
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func action() {
        
        time += 1
        timeScreen.text = String(time)
    }
    
    
    
    
}

