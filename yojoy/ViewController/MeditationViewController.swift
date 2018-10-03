//
//  MeditationViewController.swift
//  yojoy
//
//  Created by Denise Lutz on 01.10.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//  Tutorial: https://www.youtube.com/watch?v=iNEjh6zDUsg

import UIKit
import AVFoundation

class MeditationViewController: UIViewController {
    
    var timer = Timer()
    
    var audioPlayer = AVAudioPlayer()
    
    var timeCount = 30 {
        didSet {
            // convert timeCount to String and place it in countdownLabel
            countdownLabel.text = String(timeCount)
        }
    }
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        
       // sender = slider; convert to Int
        timeCount = Int(sender.value)
    }
    
    override func viewDidLoad() {
        
        // visibility
        stopOutlet.isHidden = true

        do {
            let audioPath = Bundle.main.path(forResource: "singingBowl", ofType: ".mp3", inDirectory: "AudioFiles")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            print("No Audiofile found!")
        }
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MeditationViewController.counter), userInfo: nil, repeats: true)
        
        // visibilities
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
        stopOutlet.isHidden = false
    }
    
    @objc private func counter() {
        timeCount -= 1
        
        if (timeCount == 0) {
            // stop the timer
            timer.invalidate()
            
            // plays sound
            audioPlayer.play()
            
            resetToDefault()
        }
    }
    
    private func resetToDefault() {
        sliderOutlet.setValue(30, animated: true)
        countdownLabel.text = "30"
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stopButton(_ sender: UIButton) {
        
        // stop the timer
        timer.invalidate()
        
        // set countdownLabel back to 30
        timeCount = 30
        
        resetToDefault()
        
        audioPlayer.stop()
        
        // visibilities
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
        stopOutlet.isHidden = true
    }

//    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
//        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
//    }
}
