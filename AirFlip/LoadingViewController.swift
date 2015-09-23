//
//  LoadingViewController.swift
//  AirFlip
//
//  Created by Jieyi Hu on 9/21/15.
//  Copyright © 2015 fullstackpug. All rights reserved.
//

import UIKit
import SlidesKit

class LoadingViewController: UIViewController, SKCacheManagerDelegate {

    @IBOutlet weak var progressView: UIProgressView!
    
    var action : SKCacheManagerAction = .retrieve
    
    var cache : [SKInfo]?
    
    let cacheManager = SKCacheManager()
    
    let slidesDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = false
        cacheManager.delegate = self
        switch(action){
        case .none:
            progressView.progress = 100.0
            performSegueWithIdentifier("ShowLocalViewController", sender: cache)
        default:
            run(action)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrievalDidFinish(cacheManager: SKCacheManager, cache: [SKInfo]) {
        performSegueWithIdentifier("ShowLocalViewController", sender: cache)
        self.cache = cache
    }
    
    func retrievalProgressReported(cacheManager: SKCacheManager, percent: Float) {
        progressView.progress = percent
    }
    
    func rebuildingDidFinish(cacheManager: SKCacheManager, cache: [SKInfo]) {
        performSegueWithIdentifier("ShowLocalViewController", sender: cache)
        self.cache = cache
    }
    
    func rebuildingProgressReported(cacheManager: SKCacheManager, percent: Float) {
        progressView.progress = percent
    }
    
    func run(action : SKCacheManagerAction) {
        progressView.progress = 0.0
        cacheManager.action(action, dirPath: slidesDir)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowLocalViewController" {
            (segue.destinationViewController as! LocalViewController).dataSource = sender as? [SKInfo]
        }
    }


}
