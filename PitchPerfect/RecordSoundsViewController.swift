//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Tuan-Lung Wang on 4/21/17.
//  Copyright © 2017 Tuan-Lung Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var recordButton: UIButton!
  
  @IBOutlet weak var recordingStatus: UILabel!
  
  @IBOutlet weak var stopRecordingButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stopRecordingButton.isEnabled = false
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func startRecording(_ sender: Any) {
    recordButton.isEnabled = false
    stopRecordingButton.isEnabled = true
    recordingStatus.text = "Recording in Progress..."
  }
  
  @IBAction func StopRecording(_ sender: Any) {
    recordButton.isEnabled = true
    stopRecordingButton.isEnabled = false
    recordingStatus.text = "Tap to Record"    
  }

}

