//
//  ClubBadge.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/9/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import SAConfettiView

let clubNotification = "co.joshuaneely.clubBadge"

class ClubBadge: UIViewController{
    @IBOutlet weak var clubBadge: UIImageView!
    @IBOutlet weak var scanNow: UIButton!
    
    let club = Notification.Name(rawValue: clubNotification)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObservers() {
           NotificationCenter.default.addObserver(self, selector: #selector(ClubBadge.setBadge(notification:)), name: NSNotification.Name(rawValue: clubNotification), object: nil)
       }
    
    @objc func setBadge(notification: NSNotification) {
        print("got note")
        clubBadge.image = UIImage(named: "Club Achieved")
        self.scanNow.setImage(UIImage(named: "Sc Completed"), for: .normal)
        scanNow.isEnabled = false
        UserDefaults.standard.set("true", forKey: "clubBadge?")
        UserDefaults.standard.set((UserDefaults.standard.value(forKey: "superfanProgress") as! Int) + 1, forKey:  "superfanProgress")
        print((UserDefaults.standard.value(forKey: "superfanProgress") as! Int))
        let home = Notification.Name(rawValue: updateHome)
        NotificationCenter.default.post(name: home, object: nil)
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @IBAction func ScanNow(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "QRCodeScanner")
        self.present(vc, animated: true, completion: nil)
        whichBadge = "club"
    }
    
    func badgeCheck() {
           if (UserDefaults.standard.value(forKey: "clubBadge?") as? String) == nil {
               clubBadge.image = UIImage(named: "Club Badge")
               self.scanNow.setImage(UIImage(named: "Scan Now"), for: .normal)
               scanNow.isEnabled = true
           } else {
               clubBadge.image = UIImage(named: "Club Achieved")
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
       
    //View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        badgeCheck()

    }
    
}
