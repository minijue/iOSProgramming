//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 王珏 on 2018/9/26.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label.text = ""
        let pauseImage = UIImage(named: "play")
        self.btnPlay.setImage(pauseImage, for: UIControl.State.normal)
    }

    @IBAction func play(_ sender: Any) {
        
        if self.player == nil {
            let path = Bundle.main.path(forResource: "test", ofType: "caf")
            let url = URL(fileURLWithPath: path!)
            do {
                self.player = try AVAudioPlayer(contentsOf: url)
                self.player.prepareToPlay()
                self.player.numberOfLoops = -1
            } catch {
                NSLog("%@", error.localizedDescription)
                self.label.text = "播放错误"
                return
            }
            player.delegate = self
        }
        
        if !self.player.isPlaying {
            player.play()
            self.label.text = "播放中..."
            let pauseImage = UIImage(named: "pause")
            self.btnPlay.setImage(pauseImage, for: UIControl.State.normal)
        } else {
            player.pause()
            self.label.text = "播放暂停"
            let playImage = UIImage(named: "play")
            self.btnPlay.setImage(playImage, for: UIControl.State.normal)
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        if self.player != nil {
            self.player.stop()
            self.player.delegate = nil
            self.label.text = "播放停止"
            let playImage = UIImage(named: "play")
            self.btnPlay.setImage(playImage, for: UIControl.State.normal)
        }
    }
    
    // AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.label.text = "播放完成"
        let playImage = UIImage(named: "play")
        self.btnPlay.setImage(playImage, for: UIControl.State.normal)
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        self.label.text = "播放错误"
        let playImage = UIImage(named: "play")
        self.btnPlay.setImage(playImage, for: UIControl.State.normal)
    }
}

