//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft" : 300 , "Medium" : 420 , "Hard" : 720]
    var timer = Timer()
    var totalTime = 0
    var seconsPassed = 0
    var player : AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 1.0
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        seconsPassed = 0
        titleLabel.text = hardness
            
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        }
    @objc func updateTimer(){
        if seconsPassed < totalTime{
            seconsPassed += 1
            let percentageProgress = Float(seconsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
            
        }else {
            timer.invalidate()
            titleLabel.text = "EGG IS DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }

}
