//
//  MusicBadge.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/9/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import SAConfettiView

let musicNotification = "co.joshuaneely.musicBadge"

class MusicBadge: UIViewController {
    @IBOutlet weak var musicBadge: UIImageView!
    @IBOutlet weak var scanNow: UIButton!
    
    let music = Notification.Name(rawValue: musicNotification)
    
    func createObservers() {
           NotificationCenter.default.addObserver(self, selector: #selector(MusicBadge.setBadge(notification:)), name: NSNotification.Name(rawValue: musicNotification), object: nil)
       }
    
    @objc func setBadge(notification: NSNotification) {
                musicBadge.image = UIImage(named: "Music Achieved")
               self.scanNow.setImage(UIImage(named: "Sc Completed"), for: .normal)
               scanNow.isEnabled = false
               UserDefaults.standard.set("true", forKey: "musicBadge?")
               UserDefaults.standard.set((UserDefaults.standard.value(forKey: "superfanProgress") as! Int) + 1, forKey:  "superfanProgress")
               print((UserDefaults.standard.value(forKey: "superfanProgress") as! Int))
               let home = Notification.Name(rawValue: updateHome)
               NotificationCenter.default.post(name: home, object: nil)
               NotificationCenter.default.removeObserver(self)
        
    }
    
    
    @IBAction func ScanNow(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "QRCodeScanner")
        self.present(vc, animated: true, completion: nil)
        whichBadge = "music"
    }
    
    func badgeCheck() {
        if (UserDefaults.standard.value(forKey: "musicBadge?") as? String) == nil {
            musicBadge.image = UIImage(named: "Music Badge")
            self.scanNow.setImage(UIImage(named: "Scan Now"), for: .normal)
            scanNow.isEnabled = true
        } else {
            musicBadge.image = UIImage(named: "Music Achieved")
            self.scanNow.setImage(UIImage(named: "Sc Completed"), for: .normal)
            scanNow.isEnabled = false
        }
        if (UserDefaults.standard.value(forKey: "superfanProgress") as! Int) == 6 {
            let confettiView = SAConfettiView(frame: self.view.bounds)
            confettiView.type = .Confetti
            
            view.addSubview(confettiView)
            confettiView.startConfetti()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        badgeCheck()
    }

    
}
