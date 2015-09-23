//
//  LocalFileViewController.swift
//  AirFlip
//
//  Created by Jieyi Hu on 9/21/15.
//  Copyright © 2015 fullstackpug. All rights reserved.
//

import UIKit
import SlidesKit

class LocalViewController: UITableViewController {

    var dataSource : [SKInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "rebuild")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: self, action: "toggle")
        self.navigationItem.title = "Local"
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let dataSource = dataSource {
            return dataSource.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        (cell.contentView.viewWithTag(1) as! UIImageView).image = dataSource?[indexPath.row].thumbnail
        (cell.contentView.viewWithTag(2) as! UILabel).text = dataSource?[indexPath.row].fileName
        (cell.contentView.viewWithTag(3) as! UILabel).text = dataSource?[indexPath.row].type
        (cell.contentView.viewWithTag(4) as! UILabel).text = String(dataSource![indexPath.row].numberOfPages)
        (cell.contentView.viewWithTag(5) as! UILabel).text = dataSource?[indexPath.row].modificationData
        (cell.contentView.viewWithTag(6) as! UILabel).text = dataSource?[indexPath.row].creationData
        return cell
    }
    
    func rebuild() {
        (self.navigationController?.viewControllers[0] as? LoadingViewController)?.run(.rebuild)
        self.navigationController?.popToRootViewControllerAnimated(false)
    }
    
    func toggle() {
        (self.navigationController?.parentViewController as? CentralControlViewController)?.toggleLeftPanel()
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowSlidesViewController" {
            if let sender = sender as? UITableViewCell{
                if let indexPath = tableView.indexPathForCell(sender) {
                    (segue.destinationViewController as! SlidesViewController).slidesInfo = dataSource![indexPath.row]
                }
            }
        }
    }
    

}
