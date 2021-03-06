//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Tuan-Lung Wang on 4/22/17.
//  Copyright © 2017 Tuan-Lung Wang. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: Data Fields
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    // MARK: Enums
    enum ButtonType: Int {
        case slow = 0, fast, vader, chipmunk, echo, reverb
    }
    
    // MARK: View Control overriden methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    // MARK: IBActions
    @IBAction func playSoundForButton(_ sender: UIButton) {
        configureUI(.playing)
        
        let buttonType = ButtonType(rawValue: sender.tag)!
        
        switch buttonType {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .vader:
            playSound(pitch: -1000.0)
        case .chipmunk:
            playSound(pitch: 1000.0)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
}
