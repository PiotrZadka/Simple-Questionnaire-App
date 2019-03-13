//
//  ResultsView.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit
import CoreData


class ResultsView: UIViewController,TableViewControllerDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    var sampleData:TableViewController = TableViewController()
    
    //testing
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var retrieveButton: UIButton!
    @IBOutlet weak var containerTable: UIView!
    
    @IBOutlet weak var dobField: UILabel!
    @IBOutlet weak var genderField: UILabel!
    @IBOutlet weak var q1Field: UILabel!
    @IBOutlet weak var q2aField: UILabel!
    @IBOutlet weak var q2bField: UILabel!
    @IBOutlet weak var q3Field: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didSelectItem(name: String) {
        idField.text = name
    }
    
    @IBAction func clickRetrieve(_ sender: Any) {
        getData()
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
    
    func getData(){
        //create context from container
        let managedContext = persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id = %@", idField.text!)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                
                dobField.text = data.value(forKey: "dob") as? String
                genderField.text = data.value(forKey: "gender") as? String
                q1Field.text = data.value(forKey: "question1") as? String
                q2aField.text = data.value(forKey: "question2A") as? String
                q2bField.text = data.value(forKey: "question2B") as? String
                q3Field.text = data.value(forKey: "question3") as? String
            }
   
        } catch {
            print("Failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "table"{
            let vc = segue.destination as! TableViewController
            vc.delegate = self
        }
    }
}
