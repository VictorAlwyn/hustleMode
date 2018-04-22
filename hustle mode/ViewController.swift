//
//  ViewController.swift
//  hustle mode
//
//  Created by alwyn tablatin on 22/04/2018.
//  Copyright © 2018 alwyn tablatin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var hustlelbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var viewHolder: UIView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var darkBG: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //code to play audio
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        }catch let error as NSError {
            print(error)
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func powerPressed(_ sender: Any) {
        powerButton.isHidden = true
        darkBG.isHidden = true
        viewHolder.isHidden = false
        
        audioPlayer.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 270, width: 375, height: 128)
            
        }) { (finished) in
            self.hustlelbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    
}

