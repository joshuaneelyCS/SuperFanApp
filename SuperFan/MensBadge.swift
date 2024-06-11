//
//  MensBadge.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/9/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import SAConfettiView

let mensNotification = "co.joshuaneely.mensBadge"

class MensBadge: UIViewController {
    
    let mens = Notification.Name(rawValue: mensNotification)
    
    @IBOutlet weak var mensBadge: UIImageView!
    @IBOutlet weak var scanNow: UIButton!
    
    func createObservers() {
           NotificationCenter.default.addObserver(self, selector: #selector(MensBadge.setBadge(notification:)), name: NSNotification.Name(rawValue: mensNotification), object: nil)
       }
    
    @objc func setBadge(notification: NSNotification) {
        mensBadge.image = UIImage(named: "Mens Sport Achieved")
        self.scanNow.setImage(UIImage(named: "Sc Completed"), for: .normal)
        scanNow.isEnabled = false
        UserDefaults.standard.set("true", forKey: "mensBadge?")
        UserDefaults.standard.set((UserDefaults.standard.value(forKey: "superfanProgress") as! Int) + 1, forKey:  "superfanProgress")
        print((UserDefaults.standard.value(forKey: "superfanProgress") as! Int))
        let home = Notification.Name(rawValue: updateHome)
        NotificationCenter.default.post(name: home, object: nil)
        NotificationCenter.default.removeObserver(self)
        
    }
    
    func badgeCheck() {
           if (UserDefaults.standard.value(forKey: "mensBadge?") as? String) == nil {
               mensBadge.image = UIImage(named: "Mens Sport Badge")
               self.scanNow.setImage(UIImage(named: "Scan Now"), for: .normal)
               scanNow.isEnabled = true
           } else {
               mensBadge.image = UIImage(named: "Mens Sport Achieved")
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
    
   
    @IBAction func ScanNow(_ sender: Any) {
      let vc = self.storyboard!.instantiateViewController(withIdentifier: "QRCodeScanner")
      self.present(vc, animated: true, completion: nil)
        whichBadge = "men"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        badgeCheck()
    }
 
    
}
