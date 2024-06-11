//
//  WalkThrough.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/17/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit

class WalkThrough: UIViewController {
    
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var subHeadingLabel: UILabel! {
         didSet {
             subHeadingLabel.numberOfLines = 0
         }
     }
    
    @IBOutlet var contentImageView: UIImageView!
    
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
    }
}
