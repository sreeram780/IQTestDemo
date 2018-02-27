//
//  SignUpViewController.swift
//  IQTestDemo
//
//  Created by SreenivasulaReddy on 27/02/18.
//  Copyright © 2018 Sreenivasulareddy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var dobPickerView: UIView!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    emailField.addDoneOnKeyboardWithTarget(IQKeyboardManager.sharedManager(), action: #selector(IQKeyboardManager.sharedManager().doneAction(_:)))
    emailField.addPreviousNextDoneOnKeyboardWithMultipleTarget(IQKeyboardManager.sharedManager(), previousAction: #selector(IQKeyboardManager.sharedManager().previousAction(_:)), self, nextAction: #selector(SignUpViewController.nextaction(_:)), doneAction: #selector(IQKeyboardManager.sharedManager().doneAction(_:)), titleText: nil)

    passwordField.addDoneOnKeyboardWithTarget(IQKeyboardManager.sharedManager(), action: #selector(IQKeyboardManager.sharedManager().doneAction(_:)))
        passwordField.addPreviousNextDoneOnKeyboardWithTarget(self, previousAction: #selector(SignUpViewController.previousaction(_:)), nextAction: #selector(IQKeyboardManager.sharedManager().nextAction(_:)), doneAction: #selector(IQKeyboardManager.sharedManager().doneAction(_:)))
        passwordField.keyboardToolbar.nextBarButton.isEnabled = false
    }
    @objc func previousaction (_ barButton : IQBarButtonItem)
    {
        self.view.endEditing(true)
        dobField.becomeFirstResponder()
    }
    @objc func nextaction (_ barButton : IQBarButtonItem)
    {
        self.view.endEditing(true)
        dobField.becomeFirstResponder()

    }
    
    @IBAction func previousBarButtonTapped(_ sender: UIBarButtonItem)
    {
        emailField.becomeFirstResponder()

    }
    
    @IBAction func nextBarButtonTapped(_ sender: UIBarButtonItem)
    {
        passwordField.becomeFirstResponder()

    }
    
    @IBAction func dobDoneTapped(_ sender: UIBarButtonItem)
    {
        self.dobPickerView.isHidden = true
        let dfm = DateFormatter()
        dfm.dateFormat = "dd/MM/yyyy"
        dobField.text = dfm.string(from: self.dobPicker.date)
    }
}

//MARK: UITextFieldDelegate Methods
extension SignUpViewController:UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == dobField
        {
            self.view.endEditing(true)
            self.dobPickerView.isHidden = false
            return false
        }
        self.dobPickerView.isHidden = true
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
