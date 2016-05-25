//
//  TaskController.swift
//  Task
//
//  Created by Patrick Pahl on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class TaskController {
    
    static let sharedInstance = TaskController()
    
    var tasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
    }
    
//    var mockTasks: [Task] {
//        let task1 = Task(name: "Go grocery shopping", notes: "target")
//        let task2 = Task(name: "Pay bills", notes: "Electricity bill")
//        let task3 = Task(name: "Buy book", notes: "Benjamin Franklin", due: NSDate(timeIntervalSinceNow: NSTimeInterval (60*60*24*3)))
//        task2?.isComplete = true
//        return [task1, task2, task3]
//    }
//    
//    init() {
//        self.mockTasks = fetchTasks()
//    }
    
    
    var incompleteTasks: [Task] {                                                //computed properties: incomplete task/ completed task- has to be a var.
        let incompleteArray = tasks.filter({$0.isComplete == false})            //filter iterates through all tasks. If value 'isComplete' is false, will
                                                                                //return that item to the incomplete array
        return incompleteArray
    }
                                                                            //**For table view controller !$0.isComplete.boolValue    forces it back to a bool value from a 0 or 1,
                                                                            //taking out of persistence
    var completeTasks: [Task] {
        return tasks.filter({$0.isComplete.boolValue})
//        let completeArray = tasks.filter({$0.isComplete == true})         //Other way to set up this computed property.
//        return completeArray
    }
    
    
    func addTask(name: String, notes: String?, due: NSDate?) {                  //add note
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStorage()
    }
    
    
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
         saveToPersistentStorage()
        }
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?) {       //update parameters of note, isComplete not handled here
        task.name = name
        task.notes = notes                                                          //Now just update each category of the note and save
        task.due = due
        saveToPersistentStorage()
    }
    
    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
        print("problem")
    }
    
        
        func fetchTasks() -> [Task]{
            let request = NSFetchRequest(entityName: "Task")
            let tasks = (try? Stack.sharedStack.managedObjectContext.executeFetchRequest (request)) as? [Task]
            return tasks ?? []
        }
}




