//
//  MidPanelViewController.swift
//  AirFlip
//
//  Created by Jieyi Hu on 9/20/15.
//  Copyright © 2015 fullstackpug. All rights reserved.
//

import UIKit

class MidPanelViewController: UINavigationController {
    
    var currentMenuItem : String = "Local"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        if let topViewController = self.topViewController {
            return topViewController.shouldAutorotate()
        } else {
            return true
        }
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if let topViewController = self.topViewController {
            return topViewController.supportedInterfaceOrientations()
        } else {
            return UIInterfaceOrientationMask.All
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowLocalViewControllerSegue" {
            let cache = (self.viewControllers[0] as! LoadingViewController).cache!
            (segue.destinationViewController as? LocalViewController)?.dataSource = cache
        }
    }


}
