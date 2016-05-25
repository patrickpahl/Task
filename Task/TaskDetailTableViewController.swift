//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Patrick Pahl on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    var task: Task?
    var dueDateValue: NSDate?
    
    
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var dueDate: UITextField!
    
    @IBOutlet weak var taskNotes: UITextView!
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    
    @IBAction func saveButton(sender: AnyObject) {
        updateTask()
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        self.dueDate.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    
    func updateTask() {
        guard let name = taskName.text else {return}
        let due = dueDateValue
        let notes = taskNotes.text
        
        if let task = self.task {
            TaskController.sharedInstance.updateTask(task, name: name, notes: notes, due: due)
        } else {
        TaskController.sharedInstance.addTask(name, notes: notes, due: due)
    }
        
    }
    
    func updateWithTask(task: Task){
        self.task = task
        title = task.name
        taskName.text = task.name
        
        if let due = task.due {
            dueDate.text = due.stringValue()
        }
        if let notes = task.notes {
            taskNotes.text = notes
        }
    }
    
    
    
    @IBAction func tapGestureRecognizer(sender: AnyObject) {
        self.taskName.resignFirstResponder()
        self.dueDate.resignFirstResponder()
        self.taskNotes.resignFirstResponder()
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        dueDate.inputView = dueDatePicker
        
        if let task = task {
            updateWithTask(task)}
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
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
