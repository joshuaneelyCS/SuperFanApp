//
//  PageViewController.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/17/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{

    
    // mark properties
    
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    
    var pageHeadings = ["WELCOME TO SUPER FAN!", "HOW TO EARN A BADGE", "GET A PRIZE!"]
    var pageImages = ["walkThrough1", "walkThrough2", "walkThrough3"]
    var pageSubheadings = ["In order to become a Super Fan, you will need earn all six event badges.", "Attend an event listed in a badge's description and scan the QR Code at the event to earn that badge.", "When all six badges are complete, you will have earned the Super Fan badge! You can recieve a prize from the Student Store for your SUPER work.\nIt's that easy!"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the data sourde and the delegate to itself
        dataSource = self
        delegate = self
        
        //create first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThrough).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThrough).index
             index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkThrough? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        //create new view controller
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(identifier: "WalkThrough") as? WalkThrough {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubheadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }

        return nil
        
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //Page View Controller Delegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkThrough {
                currentIndex = contentViewController.index
                
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
