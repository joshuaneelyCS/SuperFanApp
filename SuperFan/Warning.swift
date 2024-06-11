//
//  File.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/10/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit

class Warning: UIViewController {
    
    @IBOutlet weak var box: UIButton!
    @IBOutlet weak var getYourPrize: UIButton!
    
    var check = true

    
    @IBAction func checkBox(_ sender: Any) {

        if check == true{
        box.setImage(UIImage(named: "Box Check"), for: .normal)
        check = false
        getYourPrize.isEnabled = true
        } else {
        box.setImage(UIImage(named: "Box"), for: .normal)
        check = true
        getYourPrize.isEnabled = false
        }
    }
    @IBAction func GetYourPrize(_ sender: Any) {
        if check  == true {

        } else{
        UserDefaults.standard.set("true", forKey: "prizeRecieved?")
        let name = Notification.Name(rawValue: superfan1)
        NotificationCenter.default.post(name: name, object: nil)
            print("sent")
        self.dismiss(animated: true, completion: nil)
        }
    
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getYourPrize.isEnabled = false
    }
    
}
