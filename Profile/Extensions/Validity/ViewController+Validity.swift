//
//  ViewController+Validity.swift
//  Profile
//
//  Created by Denis Abramov on 01.07.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

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
