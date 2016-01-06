//
//  CentralControlViewController.swift
//  AirFlip
//
//  Created by Jieyi Hu on 9/20/15.
//  Copyright © 2015 fullstackpug. All rights reserved.
//

import UIKit

class CentralControlViewController: UIViewController {
    
    var leftPanelViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("LeftPanelViewController") as! LeftPanelViewController
    var midPanelViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("MidPanelViewController") as!
        MidPanelViewController
    
    let leftPanelWidth = CGFloat(180)
    
    var leftPanelHide = true {
        didSet{
            if leftPanelHide {
                let frame = midPanelViewController.view.frame
                UIView.animateWithDuration(0.5, animations: {
                    self.midPanelViewController.view.frame = CGRectMake(0, 0, frame.width, frame.height)
                })
            } else {
                let frame = midPanelViewController.view.frame
                UIView.animateWithDuration(0.5, animations: {
                    self.midPanelViewController.view.frame = CGRectMake(self.leftPanelWidth, 0, frame.width, frame.height)
                })
            }
        }
    }
    
    func toggleLeftPanel() {
        leftPanelHide = !leftPanelHide
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(leftPanelViewController.view)
        addChildViewController(leftPanelViewController)
        view.addSubview(midPanelViewController.view)
        addChildViewController(midPanelViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return midPanelViewController.shouldAutorotate()
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return midPanelViewController.supportedInterfaceOrientations()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
