//
//  TableViewController.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 13/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit
import CoreData

protocol TableViewControllerDelegate{
    func didSelectItem(name:String)
}

class TableViewController: UITableViewController {
    
    var coreElements = [Any?]()
    var delegate:TableViewControllerDelegate! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    // selecting database model
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error), \(error)")
            }
        })
        return container
    }()
    
    func fetchData(){
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                coreElements.append(data.value(forKey: "id"))
            }
        }catch {
            print("Failed")
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coreElements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = coreElements[indexPath.row] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = coreElements[indexPath.row] as? String
        delegate.didSelectItem(name: name!)
    }

}
