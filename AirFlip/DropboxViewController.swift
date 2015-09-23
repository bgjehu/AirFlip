//
//  DropboxViewController.swift
//  AirFlip
//
//  Created by Jieyi Hu on 9/22/15.
//  Copyright © 2015 fullstackpug. All rights reserved.
//

import UIKit

class DropboxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: self, action: "toggle")
        self.navigationItem.title = "Dropbox"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggle() {
        (self.navigationController?.parentViewController as? CentralControlViewController)?.toggleLeftPanel()
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
