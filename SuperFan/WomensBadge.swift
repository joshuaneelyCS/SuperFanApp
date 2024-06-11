//
//  WomensBadge.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/9/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import  SAConfettiView

let womensNotification = "co.joshuaneely.womensBadge"

class WomensBadge: UIViewController {
    
    @IBOutlet weak var womenBadge: UIImageView!
    @IBOutlet weak var scanNow: UIButton!
    
    let womens = Notification.Name(rawValue: womensNotification)
    
    func createObservers() {
           NotificationCenter.default.addObserver(self, selector: #selector(WomensBadge.setBadge(notification:)), name: NSNotification.Name(rawValue: womensNotification), object: nil)
       }
    
    @objc func setBadge(notification: NSNotification) {
         womenBadge.image = UIImage(named: "Womens Sport Achieved")
         self.scanNow.setImage(UIImage(named: "Sc Completed"), for: .normal)
         scanNow.isEnabled = false
         UserDefaults.standard.set("true", forKey: "womensBadge?")
         UserDefaults.standard.set((UserDefaults.standard.value(forKey: "superfanProgress") as! Int) + 1, forKey:  "superfanProgress")
         print((UserDefaults.standard.value(forKey: "superfanProgress") as! Int))
         let home = Notification.Name(rawValue: updateHome)
         NotificationCenter.default.post(name: home, object: nil)
         NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func ScanNow(_ sender: Any) {
       let vc = self.storyboard!.instantiateViewController(withIdentifier: "QRCodeScanner")
       self.present(vc, animated: true, completion: nil)
        whichBadge = "women"
    }
    
    func badgeCheck() {
        if (UserDefaults.standard.value(forKey: "womensBadge?") as? String) == nil {
            womenBadge.image = UIImage(named: "Womens Sport Badge")
            self.scanNow.setImage(UIImage(named: "Scan Now"), for: .normal)
            scanNow.isEnabled = true
        } else {
            womenBadge.image = UIImage(named: "Womens Sport Achieved")
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

