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
    var modulChused: Module = .module2A
    
    var firstName = ""
    var lastName = ""
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    // MARK: - IBAction
    @IBAction func didRightName(_ sender: Any) {
        button.isEnabled = true
    }
    
    @IBAction func didTappedOutside(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func didTappedButton(_ sender: UIButton) {
        performSegue(withIdentifier: RateModuleViewController.rateModuleSegue, sender: self)
        
        // MARK: - Function
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
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     guard let destination = segue.destination as? RateModuleViewController else{return}
     destination.firstName = firstName
     destination.lastName = lastName
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == RateModuleViewController.rateModuleSegue, let rateModuleViewController = segue.destination as? RateModuleViewController else {return}
        rateModuleViewController.firstName = firstNameTextField.text ?? ""
        rateModuleViewController.lastName = lastNameTextField.text ?? ""
        rateModuleViewController.modulChused = modulChused
    }
    // MARK: - Unwind
    @IBAction func unwindToStudent(_ unwindSegue: UIStoryboardSegue) {
    }
    @IBAction func unwindToStudentfromRegister(_ unwindSegue: UIStoryboardSegue) {
    }
    /*
     override func performSegue(withIdentifier identifier: String, sender: Any?) {
     <#code#>
     }
     */
}
// MARK: - Extension
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
        modulChused = module[row]
    }
}

extension StudentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}

