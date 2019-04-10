//
//  CountdownViewController.swift
//  StopWatch
//
//  Created by Adakhanau on 10/04/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
    
    //Otlets
    @IBOutlet weak var timeScreen: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var stopOutlet: UIButton!
    @IBOutlet weak var backOutlet: UIButton!
    
    //Proporties
    var seconds = 30
    var timer = Timer()
    
    
    //Buttons
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timeScreen.text = String(seconds)
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountdownViewController.counter), userInfo: nil, repeats: true)
        
        
        sliderOutlet.isHidden = true
        startOutlet.isEnabled = false
        stopOutlet.isEnabled = true
    }
    
    
    
    @IBAction func stopButton(_ sender: UIButton)
    {
        stop()
    }
    
    
    @IBAction func backButoon(_ sender: UIButton)
    {
        stop()
        self.dismiss(animated: true, completion: nil)
    }
    
    func stop()
    {
        timer.invalidate()
        seconds = 30
        timeScreen.text = String(seconds)
        sliderOutlet.setValue(30, animated: true)
        
        stopOutlet.isEnabled = false
        sliderOutlet.isHidden = false
        startOutlet.isEnabled = true
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        stopOutlet.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func counter()
    {
        if (seconds == 0)
        {
            timer.invalidate()
            sliderOutlet.isHidden = false
            startOutlet.isEnabled = true
            stopOutlet.isEnabled = false
        } else {
            seconds -= 1
        }
        timeScreen.text = String(seconds)
        
    }
  
    

}
