//
//  ArtBadge.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/9/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import SAConfettiView

let artNotification = "co.joshuaneely.artBadge"

class ArtBadge: UIViewController {
    @IBOutlet weak var artBadge: UIImageView!
    @IBOutlet weak var scanNow: UIButton!
    
    let art = Notification.Name(rawValue: artNotification)

    func createObservers() {
           NotificationCenter.default.addObserver(self, selector: #selector(ArtBadge.setBadge(notification:)), name: NSNotification.Name(rawValue: artNotification), object: nil)
       }
    
    @objc func setBadge(notification: NSNotification) {
        artBadge.image = UIImage(named: "Art Achieved")
        self.scanNow.setImage(UIImage(named: "Sc Completed"), for: .normal)
                     scanNow.isEnabled = false
        UserDefaults.standard.set("true", forKey: "artBadge?")
        UserDefaults.standard.set((UserDefaults.standard.value(forKey: "superfanProgress") as! Int) + 1, forKey:  "superfanProgress")
        print((UserDefaults.standard.value(forKey: "superfanProgress") as! Int))
        let home = Notification.Name(rawValue: updateHome)
        NotificationCenter.default.post(name: home, object: nil)
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @IBAction func ScanNow(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "QRCodeScanner")
        self.present(vc, animated: true, completion: nil)
        whichBadge = "art"
    }
    
    func badgeCheck() {
        if (UserDefaults.standard.value(forKey: "artBadge?") as? String) == nil {
            artBadge.image = UIImage(named: "Art Badge")
            self.scanNow.setImage(UIImage(named: "Scan Now"), for: .normal)
            scanNow.isEnabled = true
        } else {
            artBadge.image = UIImage(named: "Art Achieved")
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
