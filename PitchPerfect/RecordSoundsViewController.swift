//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Tuan-Lung Wang on 4/21/17.
//  Copyright © 2017 Tuan-Lung Wang. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

  @IBOutlet weak var recordButton: UIButton!
  
  @IBOutlet weak var recordingStatus: UILabel!
  
  @IBOutlet weak var stopRecordingButton: UIButton!
  
  var audioRecorder: AVAudioRecorder!
  
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
    
    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
    let recordingName = "recordedVoice.wav"
    let pathArray = [dirPath, recordingName]
    let filePath = URL(string: pathArray.joined(separator: "/"))
    //print(filePath)
    
    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
    
    try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
    audioRecorder.delegate = self
    audioRecorder.isMeteringEnabled = true
    audioRecorder.prepareToRecord()
    audioRecorder.record()
  }
  
  @IBAction func StopRecording(_ sender: Any) {
    recordButton.isEnabled = true
    stopRecordingButton.isEnabled = false
    recordingStatus.text = "Tap to Record"
    
    audioRecorder.stop()
    let session = AVAudioSession.sharedInstance()
    try! session.setActive(false)
  }
  
  func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    if flag {
      performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
    } else {
      print("recording was not successful")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "stopRecording" {
      let playSoundsVC = segue.destination as! PlaySoundsViewController
      let recordedAudioURL = sender as! URL
      playSoundsVC.recordedAudioURL = recordedAudioURL
    }
  }
  

}

