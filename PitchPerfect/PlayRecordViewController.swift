//
//  PlayRecordViewController.swift
//  PitchPerfect
//
//  Created by Vedhavyas Singareddi on 14/04/16.
//  Copyright © 2016 Vedhavyas Singareddi. All rights reserved.
//

import UIKit
import AVFoundation

class PlayRecordViewController: UIViewController {
    
    var recordedAudioURL: NSURL!
    var audioFile :AVAudioFile!
    var audioEngine :AVAudioEngine!
    var audioPlayerNode :AVAudioPlayerNode!
    var stopTimer :NSTimer!
    
    enum ButtonType :Int{
        case Slow = 0, Fast, Chipmunk, Vadar, Echo, Reverb
    }
    
    @IBOutlet weak var chipmunkButton :UIButton!
    @IBOutlet weak var darthVadarButton :UIButton!
    @IBOutlet weak var snailButton :UIButton!
    @IBOutlet weak var reverbButton :UIButton!
    @IBOutlet weak var echoButton :UIButton!
    @IBOutlet weak var stopButton :UIButton!
    @IBOutlet weak var rabbitButton :UIButton!
    
    @IBAction func playSound(button :UIButton){
        switch ButtonType(rawValue: button.tag)! {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vadar:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(PlayingState.Playing)
    }
    
    @IBAction func stopPlaying(sender :AnyObject){
        stopAudio()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.NotPlaying)
    }

}
