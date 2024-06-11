//
//  HomeScreen.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/6/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import SAConfettiView

let updateHome = "co.joshuaneely.homeUpdate"
var whichBadge = ""

class HomeScreen: UIViewController {
    //Circles
    @IBOutlet weak var Circle1: UIImageView!
    @IBOutlet weak var Circle2: UIImageView!
    @IBOutlet weak var Circle3: UIImageView!
    @IBOutlet weak var Circle4: UIImageView!
    
    //Badges
    @IBOutlet weak var schoolBadge: UIButton!
    @IBOutlet weak var clubBadge: UIButton!
    @IBOutlet weak var womenBadge: UIButton!
    @IBOutlet weak var menBadge: UIButton!
    @IBOutlet weak var musicBadge: UIButton!
    @IBOutlet weak var artBadge: UIButton!
    @IBOutlet weak var superfanBadge: UIButton!
    
    //Observers
    let home = Notification.Name(rawValue: updateHome)
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(HomeScreen.BadgeCheck(notification:)), name: NSNotification.Name(rawValue: updateHome), object: nil)
    }
    
    @objc func BadgeCheck(notification: NSNotification) {
        
        badgeCheck()

    }
    
    func badgeCheck() {
        
        if (UserDefaults.standard.value(forKey: "schoolBadge?") as? String) == nil {
            
            self.schoolBadge.setImage(UIImage(named: "School Event Badge"), for: .normal)

        } else {
            
            self.schoolBadge.setImage(UIImage(named: "School Event Achieved"), for: .normal)
        }
        
        if (UserDefaults.standard.value(forKey: "clubBadge?") as? String) == nil {
            
            self.clubBadge.setImage(UIImage(named: "Club Badge"), for: .normal)

        } else {
            
            self.clubBadge.setImage(UIImage(named: "Club Achieved"), for: .normal)
        }
        
        if (UserDefaults.standard.value(forKey: "womensBadge?") as? String) == nil {
            
            self.womenBadge.setImage(UIImage(named: "Womens Sport Badge"), for: .normal)

        } else {
            
            self.womenBadge.setImage(UIImage(named: "Womens Sport Achieved"), for: .normal)
        }
        
        if (UserDefaults.standard.value(forKey: "mensBadge?") as? String) == nil {
            
            self.menBadge.setImage(UIImage(named: "Mens Sport Badge"), for: .normal)

        } else {
            
            self.menBadge.setImage(UIImage(named: "Mens Sport Achieved"), for: .normal)
        }
        
        if (UserDefaults.standard.value(forKey: "musicBadge?") as? String) == nil {
            
            self.musicBadge.setImage(UIImage(named: "Music Badge"), for: .normal)

        } else {
            
            self.musicBadge.setImage(UIImage(named: "Music Achieved"), for: .normal)
        }
        
        if (UserDefaults.standard.value(forKey: "artBadge?") as? String) == nil {
            
            self.artBadge.setImage(UIImage(named: "Art Badge"), for: .normal)

        } else {
            
            self.artBadge.setImage(UIImage(named: "Art Achieved"), for: .normal)
        }
        if (UserDefaults.standard.value(forKey: "superfanProgress") as? Int) == 6{
            
            self.superfanBadge.setImage(UIImage(named: "Super Fan Achieved"), for: .normal)
            let confettiView = SAConfettiView(frame: self.view.bounds)
            confettiView.type = .Confetti
            
            view.addSubview(confettiView)
            confettiView.startConfetti()
            view.addSubview(schoolBadge)
            view.addSubview(clubBadge)
            view.addSubview(womenBadge)
            view.addSubview(menBadge)
            view.addSubview(musicBadge)
            view.addSubview(artBadge)
            view.addSubview(superfanBadge)

        } else {
            
            self.superfanBadge.setImage(UIImage(named: "Super Fan Badge"), for: .normal)
        }
    }
    
    
    //moves the circles
    /*func CircleMove() {
        UIView.animate(withDuration: 2.5, delay: 0, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
         self.Circle1.frame.origin.y -= 13
         self.Circle2.frame.origin.y += 15
         self.Circle3.frame.origin.y -= 18
         self.Circle4.frame.origin.y -= 13
         }, completion: nil)
     }
    */
    override func viewDidAppear(_ animated: Bool) {
        if (UserDefaults.standard.value(forKey: "start") as? String) == nil{
            print("did it")
            UserDefaults.standard.set(0, forKey:  "superfanProgress")
            print("appear")
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            if let WalkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkThroughViewController") as? WalkthroughViewController {
                present(WalkthroughViewController, animated: true, completion: nil)
            }
            

            UserDefaults.standard.set("true", forKey:  "start")
            
            
        } else {
            //show the main screen
            print("why")

            
        }
    }
    
    override func viewDidLoad() {
        print("HomeScreen")
             //CircleMove()
                badgeCheck()    
             createObservers()
        
          }

}
    



