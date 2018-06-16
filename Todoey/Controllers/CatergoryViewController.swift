//
//  CatergoryViewController.swift
//  Todoey
//
//  Created by Andres Quintero on 6/4/18.
//  Copyright © 2018 Andres Quintero. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CatergoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categories : Results<Category>?


    override func viewDidLoad() {
        super.viewDidLoad()
    
        loadCategories()
        
        tableView.separatorStyle = .none

        
   
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Yet"
        
        cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].color ?? "54C242")
        
        return cell
    }
    
    

    //MARK: - Model Manupulation Methods
    
    func saveCategory(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    func loadCategories() {
    // Sorted the Categories Alphabetically
        categories = realm.objects(Category.self).sorted(byKeyPath: "name", ascending: true)
        
        
        tableView.reloadData()
    }
    
    //MARK: - Delete Data From Swipe
    override func updateModel(at indexPath: IndexPath)
    {
        if let categortForDeletion = self.categories?[indexPath.row]
        {
            do
            {
                try self.realm.write {self.realm.delete(categortForDeletion)}
                
            }
            catch
            {
                print("There was an error deleting an category \(error)")
            }
        }
    }
    
    
    
    //MARK: - Add New Catergories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            //What happens when user clicks Add item button on our UIAlert
            
            
            let newCatergory = Category()
            newCatergory.name = textField.text!
            
            newCatergory.color = UIColor.randomFlat.hexValue()

            
            self.saveCategory(category: newCatergory)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
}

