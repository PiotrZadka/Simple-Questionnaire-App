//
//  ThankYouView.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit
import CoreData

class ThankYouView: UIViewController {
    var userDetails: userData?
    
    @IBOutlet weak var backToStart: UIButton!

    //answer labels
    @IBOutlet weak var q1: UILabel!
    @IBOutlet weak var q2a: UILabel!
    @IBOutlet weak var q2b: UILabel!
    @IBOutlet weak var q3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = userDetails{
            q1.text = data.question1
            q2a.text = data.question2A
            q2b.text = data.question2B
            q3.text = data.question3
        }
        
        saveAnswers()
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
    
    
    func saveAnswers(){
        
        //create context from container
        let managedContext = persistentContainer.viewContext
        
        //Create entity and user data
        let userEntity = NSEntityDescription.entity(forEntityName: "UserData", in: managedContext)!
        
        //add data
        let userAnswers = NSManagedObject(entity: userEntity, insertInto: managedContext)
        userAnswers.setValue(String(userDetails!.id), forKeyPath: "id")
        userAnswers.setValue(userDetails!.gender, forKey: "gender")
        userAnswers.setValue(userDetails!.dob, forKey: "dob")
        userAnswers.setValue(userDetails!.question1, forKey: "question1")
        userAnswers.setValue(userDetails!.question2A, forKey: "question2A")
        userAnswers.setValue(userDetails!.question2B, forKey: "question2B")
        userAnswers.setValue(userDetails!.question3, forKey: "question3")
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print(error.userInfo)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToBeginning", sender: Any?.self)
    }

}
