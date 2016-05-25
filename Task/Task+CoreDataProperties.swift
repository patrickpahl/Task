//
//  Task+CoreDataProperties.swift
//  Task
//
//  Created by Patrick Pahl on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//



import Foundation
import CoreData

extension Task {

    @NSManaged var isComplete: NSNumber
    @NSManaged var due: NSDate?
    @NSManaged var notes: String?
    @NSManaged var name: String

}
