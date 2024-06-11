//
//  ViewController.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/5/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit


class Start: UIViewController {

    var fullName: String? = nil

    //text boxes
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    var name = false

    //images
    @IBOutlet weak var circle1: UIImageView!
    @IBOutlet weak var circle2: UIImageView!
    @IBOutlet weak var circle3: UIImageView!
    
    //moves circles
    func Move1() {
        UIView.animate(withDuration: 2, delay: 0, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
        self.circle1.frame.origin.y += 10
        self.circle2.frame.origin.y -= 15
        self.circle3.frame.origin.y += 15
        }, completion: nil)
    }


    @IBAction func GetStarted(_ sender: Any) {

        if name == false {
            if firstName.text != "" && lastName.text != ""
            
            {
            let oFirstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let oLastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            print(oFirstName, oLastName)
            let fullName = oFirstName + " " + oLastName
            //UserDefaults.standard.set(fullName, forKey: "$fullName")
            print(fullName)
            name = true
            
            //TODO: switch over to the next screen
            //TODO: figure out how to make a one time screen show only
            }
                
            else {
                       print("not all completed")
                   }

        }
        else {
            print("name already given")
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstName.delegate = self
        lastName.delegate = self
        
        print("did load")
        Move1()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
    }

}

extension Start : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    


}

