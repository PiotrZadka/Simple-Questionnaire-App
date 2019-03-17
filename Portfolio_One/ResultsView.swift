//
//  ResultsView.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class ResultsView: UIViewController,TableViewControllerDelegate,MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var exportButton: UIButton!
    
    var sampleData:TableViewController = TableViewController()
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var retrieveButton: UIButton!
    @IBOutlet weak var containerTable: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var dobField: UILabel!
    @IBOutlet weak var genderField: UILabel!
    @IBOutlet weak var q1Field: UILabel!
    @IBOutlet weak var q2aField: UILabel!
    @IBOutlet weak var q2bField: UILabel!
    @IBOutlet weak var q3Field: UILabel!
    @IBOutlet weak var longField: UILabel!
    @IBOutlet weak var latField: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Converting to csv and sending via email
    @IBAction func ExportAction(_ sender: Any) {
        let fileName = "details.csv"
        let tmpDir = NSURL(fileURLWithPath: NSTemporaryDirectory())
        let path = tmpDir.appendingPathComponent(fileName)
        let csvText = "ID,Date of birth,Gender,Q1,Q2A,Q2B,Q3\n"+"\(String(describing: idField.text)),\(String(describing: dobField.text)),\(String(describing: genderField.text)),\(String(describing: q1Field.text)),\(String(describing: q2aField.text)),\(String(describing: q2bField.text)),\(String(describing: q3Field.text)),\(String(describing: longField.text)),\(String(describing: latField.text)) \n"
        
        do {
            try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            
            if MFMailComposeViewController.canSendMail() {
                let emailController = MFMailComposeViewController()
                emailController.mailComposeDelegate = self
                emailController.setToRecipients(["sagiroth91@gmail.com"])
                emailController.setSubject("\(String(describing: idField.text)) user data export")
                emailController.setMessageBody("User data can be found in the attachment", isHTML: false)
                
                emailController.addAttachmentData(NSData(contentsOf: path!)! as Data, mimeType: "text/csv", fileName: fileName)
                
                self.present(emailController, animated: true, completion: nil)
            }
            infoLabel.text = "File exported and sent"
            //Mail prompt successfully
            
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
    }
    
    private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
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
                longField.text = data.value(forKey: "longitude") as? String
                latField.text = data.value(forKey: "latitude") as? String
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
