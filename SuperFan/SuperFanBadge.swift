//
//  SuperFanBadge.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/9/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit
import SAConfettiView

let superfan1 = "co.joshuaneely.superfan"

class SuperFanBadge: UIViewController{
    
    @IBOutlet weak var superfanBadge: UIImageView!
    @IBOutlet weak var percentComplete: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var getYourPrize: UIButton!
    @IBOutlet weak var text: UILabel!
    

    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(SuperFanBadge.setBadge(notification:)), name: NSNotification.Name(rawValue: superfan1), object: nil)
    }
    
    @objc func setBadge(notification: NSNotification) {
        print("recieved")
        UserDefaults.standard.set("true", forKey: "prizeRecieved?")
        self.getYourPrize.setImage(UIImage(named: "Prize Recieved"), for: .normal)
        text.text = "Thank you for downloading my app."
        getYourPrize.isEnabled = false
        
    }
    
    //displays the percent in which they have recieved all six badges as well as updates the progress bar
    func Percent() {

        percentComplete.text = String(Int((Float(UserDefaults.standard.value(forKey: "superfanProgress") as! Int)/6)*100)) + "%"
       print(UserDefaults.standard.value(forKey: "superfanProgress") as! Int)
        progressBar.setProgress(Float(UserDefaults.standard.value(forKey: "superfanProgress") as! Double/6), animated: true)

    }
    
    
    func badgeCheck() {
        if (UserDefaults.standard.value(forKey: "superfanProgress") as! Int) == 6 {
            superfanBadge.image = UIImage(named: "Super Fan Achieved")
            getYourPrize.isHidden = false
            text.text = "Congratulations!\nShow this badge down at the OJR Student Store to claim your prize!"
            let confettiView = SAConfettiView(frame: self.view.bounds)
            confettiView.type = .Confetti
            
            view.addSubview(confettiView)
            confettiView.startConfetti()

        } else {
            superfanBadge.image = UIImage(named: "Super Fan Badge")
            getYourPrize.isHidden = true
            text.text = "Collect the other six badges to earn this badge!"
        }
    }
    
    func getYourPrizeCheck() {
        
        if (UserDefaults.standard.value(forKey: "prizeRecieved?") as? String) == nil {
            
            self.getYourPrize.setImage(UIImage(named: "Get Your Prize"), for: .normal)
            getYourPrize.isEnabled = true
            view.addSubview(getYourPrize)
            
        } else {
            
            self.getYourPrize.setImage(UIImage(named: "Prize Recieved"), for: .normal)
            text.text = "Thank you for downloading my app."
            getYourPrize.isEnabled = false
        }
        
    }
    
    //changes the message at the bottom of the screen depending on how many badges they have
    func Message() {
        if (UserDefaults.standard.value(forKey: "superfanProgress") as? Int) == 0 {
            
            message.text = "Let's get started!"
        }
        else if (UserDefaults.standard.value(forKey: "superfanProgress") as? Int) == 1{
            message.text = "Looking Good!"
        }
        else if (UserDefaults.standard.value(forKey: "superfanProgress") as? Int) == 2{
            message.text = "Great Progress!"
        }
        else if (UserDefaults.standard.value(forKey: "superfanProgress") as? Int) == 3{
            message.text = "Keep it up!"
        }
        else if (UserDefaults.standard.value(forKey: "superfanProgress") as? Int) == 4{
            message.text = "Almost there!"
        }
        else if (UserDefaults.standard.value(forKey: "superfanProgress") as? Int) == 5{
            message.text = "You're so close!"
        } else {
            message.text = nil
        }
        
    }

    @IBAction func GetYourPrize(_ sender: Any) {

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        Percent()
        Message()
        badgeCheck()
        createObservers()
        getYourPrizeCheck()

    }
}
