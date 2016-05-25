//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Patrick Pahl on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return TaskController.sharedInstance.incompleteTasks.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)

        let task = TaskController.sharedInstance.incompleteTasks[indexPath.row]
        
        //cell.updateWithTask(task)
        
        //cell.delegate = self
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let task = TaskController.sharedInstance.incompleteTasks[indexPath.row]
            TaskController.sharedInstance.removeTask(task)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
//    let task = TaskController.sharedController.incompleteTasks[indexPath.row]
//    TaskController.sharedController.removeTask(task)
//    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)


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
       
        if segue.identifier == "toDetail" {
        guard let indexPath = tableView.indexPathForSelectedRow,
        task = TaskController.sharedInstance.tasks.indexPath


            
            
            
//            let detailVC = segue.destinationViewController as? TaskDetailTableViewController,
//                let selectedIndex = tableView.indexPathForSelectedRow,
//                let task = TaskController.sharedInstance.tasks[selectedIndex]
//                detailVC?.task = task
//            
//        }
//    }
//}


//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "toViewTask" {
//            guard let indexPath = tableView.indexPathForSelectedRow,
//                task = TaskController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Task else {return}
//            let destinationVC = segue.destinationViewController as? TaskDetailTableViewController
//            destinationVC?.task = task
//        }
//    }
//    
//}






