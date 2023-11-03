//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by aiga.bernane on 30/10/2023.
//

import UIKit
import CoreData



class ToDoTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext?
    //var toDos: [String] = []
    var toDoLists = [ToDo]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {return}
        managedObjectContext = appDelegate.persistentContainer.viewContext
        loadCoreData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addNewItemTapped(_ sender: Any) {
        
        let alertController = UIAlertController (title: "To Do List", message: "Do you want to add new item?", preferredStyle: .alert)
        
        alertController.addTextField { textFieldValue in textFieldValue.placeholder = "Your title here..."
            
            alertController.addTextField{ textFieldValue in textFieldValue.placeholder = "Your description here..." }
            
            print(textFieldValue)
            print(textFieldValue)
        }
        
        let addActionButton = UIAlertAction(title: "Add", style: .default) {addActions in
            let textField = alertController.textFields?.first
            let descriptionField = alertController.textFields?.last
            
            let entity = NSEntityDescription.entity(forEntityName: "ToDo", in: self.managedObjectContext!)
            let list = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
            
            list.setValue(textField?.text, forKey: "item")
            list.setValue(descriptionField?.text, forKey: "descriptions")
            
            self.saveCoreData()
          //  self.toDos.append(textField!.text!)
          //  self.tableView.reloadData()
        }
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(addActionButton)
        alertController.addAction(cancelActionButton)
        present(alertController, animated: true)
        
    }
    
    

    @IBAction func trashButtonTapped(_ sender: Any) {
        let deleteAlert = UIAlertController (title: "Delete", message: "Do you really want to delete all?", preferredStyle: .alert)
        
        let deleteActionButton = UIAlertAction(title: "Delete", style: .default){ _ in
            self.toDoLists.removeAll()
            self.tableView.reloadData()
        }
        
        let secondCancelActionButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        deleteAlert.addAction(deleteActionButton)
        deleteAlert.addAction(secondCancelActionButton)
        present(deleteAlert, animated: true)
    }
    
}

extension ToDoTableViewController{
    //MARK: - CoreData logic
    func loadCoreData(){
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        do {
            let result = try managedObjectContext?.fetch(request)
            toDoLists = result ?? []
            self.tableView.reloadData()
        
        } catch {
            fatalError("Error in loading item into core data")
        }
    }
    
    func saveCoreData(){
        do {
            try managedObjectContext?.save()
        } catch {
            fatalError("Error in saving item into core data")
                    }
        loadCoreData()

    }
    func deleteAllCoreData(){
        
        let fetchRequest: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        do{
            let toDoItems = try managedObjectContext?.fetch(fetchRequest)
            
            for item in toDoItems ?? [] {
                managedObjectContext?.delete(item)
                
            }
            try managedObjectContext?.save()
         
            
        } catch
        { fatalError("Error deleting all items from Core Data: \(error)")}
        loadCoreData()
    }
}


extension ToDoTableViewController {
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)

        let toDoList = toDoLists[indexPath.row]
        cell.textLabel?.text = toDoList.item
        cell.detailTextLabel?.text = toDoList.descriptions
        cell.accessoryType = toDoList.completed ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        toDoLists[indexPath.row].completed = !toDoLists[indexPath.row].completed
        saveCoreData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            managedObjectContext?.delete(toDoLists[indexPath.row])
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveCoreData()
    }
   

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
