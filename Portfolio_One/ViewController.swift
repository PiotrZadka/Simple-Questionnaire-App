//
//  ViewController.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BirthField: UITextField!
    @IBOutlet weak var GenderField: UITextField!
    @IBOutlet weak var idField: UITextField!
    
    let genders = ["Male","Female","Rather not say"]
    
    var selectedGender: String?
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGenderPicker()
        createDatePicker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let id = Int(idField.text!)
        let dob = BirthField.text
        let gender = GenderField.text
        
        let userDetails = userData(id: id!, dob: dob!, gender: gender!)
        
        let vc = segue.destination as! QuestionOne
        vc.data = userDetails
    }

    func createDatePicker(){
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        BirthField.inputView = datePicker
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let submitButton = UIBarButtonItem(title:"Submit", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([submitButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        BirthField.inputAccessoryView = toolBar
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy"
        BirthField.text = dateFormatter.string(from: datePicker.date)
    }
    
    func createGenderPicker(){
        let genderPicker = UIPickerView()
        genderPicker.delegate = self
        GenderField.inputView = genderPicker
        createToolbar()
    }
    
    func createToolbar(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let submitButton = UIBarButtonItem(title:"Submit", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([submitButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        GenderField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGender = genders[row]
        GenderField.text = selectedGender
    }


}

