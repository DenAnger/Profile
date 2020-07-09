//
//  Extenjsions.swift
//  Profile
//
//  Created by Denis Abramov on 01.07.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

extension String {
    
    enum ValidityType {
        case email
        case phone
        case password
    }
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,30}"
        case phone = "^((\\+7|7|8){1,2}\\ +([0-9]){3}\\ +([0-9]){3}\\-+([0-9]){2}\\-+([0-9]){2})$"
        case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{6,20}"
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
            
        case .email:
            regex = Regex.email.rawValue
        case .phone:
            regex = Regex.phone.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

extension ViewController {
    
    func isValidTrue() {
        validLabel.isEnabled = true
        viewButton.isEnabled = true
        viewButton.backgroundColor = UIColor(red: 0/255,
                                             green: 122/255,
                                             blue: 255/255,
                                             alpha: 1)
    }
    
    func isValidFalse() {
        validLabel.isEnabled = false
        viewButton.isEnabled = false
        viewButton.backgroundColor = .red
    }
    
    func validPhoto() {
        
        if addPhoto.image == nil {
            viewButton.isEnabled = false
            validLabel.text = "Add photo"
            viewButton.backgroundColor = .red
        } else {
            viewButton.isEnabled = true
            validLabel.text = ""
            isValidTrue()
        }
    }
    
    func validTextFields() {

        if emailTF.text!.isEmpty || phoneTF.text!.isEmpty || passwordTF.text!.isEmpty {
            isValidFalse()
        } else {
            validPhoto()
        }
    }
}
