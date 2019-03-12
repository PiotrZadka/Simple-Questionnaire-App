//
//  FinalView.swift
//  Portfolio_One
//
//  Created by Piotr Zadka on 06/03/2019.
//  Copyright © 2019 Piotr Zadka. All rights reserved.
//

import UIKit

class SecondQuestion_B: UIViewController {
    var userDetails: userData?
    
    let rating = ["1 - Bad","2","3 - Indifferent","4","5 - Excellent"]
    var selectedRating: String?
    
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var rateField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingPicker()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // add "rating" to question 2B
        userDetails?.question2B = rateField.text!
        let vc = segue.destination as! FinalView
        vc.userDetails = userDetails
    }
    
    
    func ratingPicker(){
        let ratingPicker = UIPickerView()
        ratingPicker.delegate = self
        rateField.inputView = ratingPicker
        createToolbar()
    }
    
    func createToolbar(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let submitButton = UIBarButtonItem(title:"Submit", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([submitButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        rateField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}

extension SecondQuestion_B: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rating.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rating[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRating = rating[row]
        rateField.text = selectedRating
    }
    
    
}


