//
//  WalkthroughViewController.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/17/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate{

    //outlets
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton! {
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
            
        }
    }
    
    @IBOutlet var skipButton: UIButton!
    
    //Properties
    
    var walkthroughPageViewController: PageViewController?
    
    
    @IBAction func skipButtonTapped(sender: UIButton) {
        dismiss(animated:true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                dismiss(animated:true, completion: nil)
                
            default: break
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.setTitle("Skip", for: .normal)
                skipButton.isEnabled = true
                
            case 2:
                nextButton.setTitle("LET'S GO!", for: .normal)
                skipButton.setTitle("   ", for: .normal)
                skipButton.isEnabled = false
                
            default: break
            }
            
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? PageViewController {
           walkthroughPageViewController = pageViewController
           walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    

}
