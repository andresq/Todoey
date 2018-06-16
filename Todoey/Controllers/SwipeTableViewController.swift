//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Andres Quintero on 6/11/18.
//  Copyright © 2018 Andres Quintero. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 70.0
    }
    
    //TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        
        cell.delegate = self
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil } //Checks that he swipe is from the right
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            print("deleted cell")
            
            self.updateModel(at: indexPath)
            
//            if let categortForDeletion = self.categories?[indexPath.row]
//            {
//                do
//                {
//                    try self.realm.write {self.realm.delete(categortForDeletion)}
//                }
//                catch
//                {
//                    print("There was an error deleting an category \(error)")
//                }
//            }
  
            
            
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
    
    func updateModel(at indexPath: IndexPath)
    { //Update our data model
        
    }
        
}



