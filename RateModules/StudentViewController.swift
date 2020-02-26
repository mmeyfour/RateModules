//
//  StudentViewController.swift
//  RateModules
//
//  Created by Mersad Meyfour on 26/02/2020.
//  Copyright © 2020 adriantineo. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {
    
    // MARK: - Variables
    let module: [Module] = [.module2A,.module2B,.module3A,.module3B]
    var optionChosed: Module = .module2A
    
    var firstName = ""
    var lastName = ""
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var modulePicker: UIPickerView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func didRightName(_ sender: Any) {
    }
    @IBAction func didTappedButton(_ sender: UIButton) {
        performSegue(withIdentifier: RateModuleViewController.rateModuleSegue, sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        button.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? RateResultsViewController else{return}
        destination.firstName = firstName
        destination.lastName = lastName
    }
    
    @IBAction func unwindToStudent(_ unwindSegue: UIStoryboardSegue) {
    }
    /*
     override func performSegue(withIdentifier identifier: String, sender: Any?) {
     <#code#>
     }
     */
}

extension StudentViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return module.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return module[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionChosed = module[row]
    }
}

extension StudentViewController: UITextFieldDelegate {
    func textField(_ texField: UITextField) -> Bool {
        texField.resignFirstResponder()
        if firstNameTextField.text == "" && lastNameTextField.text == "" {
            button.isEnabled = false
        } else {
            button.isEnabled = true
        }
        return true
    }
}
