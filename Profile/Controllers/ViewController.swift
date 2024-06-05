//
//  ViewController.swift
//  Profile
//
//  Created by Denis Abramov on 30.06.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet var viewPhoto: UIView!
	@IBOutlet var addPhoto: UIImageView!
	@IBOutlet var addPhotoButton: UIButton!
	
	@IBOutlet var emailTF: UITextField!
	@IBOutlet var phoneTF: UITextField!
	@IBOutlet var passwordTF: UITextField!
	
	@IBOutlet var viewButton: UIButton!
	
	@IBOutlet var validLabel: UILabel!
	
	// MARK: - Variables
	
	let validityEmail: String.ValidityType = .email
	let validityPhone: String.ValidityType = .phone
	let validityPassword: String.ValidityType = .password
	
	// MARK: - Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewPhoto.layer.borderWidth = 5
		viewPhoto.layer.borderColor = UIColor.lightText.cgColor
		viewPhoto.layer.cornerRadius = viewPhoto.frame.size.height / 2
		
		addPhoto.layer.cornerRadius = addPhoto.frame.size.height / 2
		
		emailTF.setBottomBorder()
		phoneTF.setBottomBorder()
		passwordTF.setBottomBorder()
		
		viewButton.layer.cornerRadius = 5
		
		emailTF.delegate = self
		phoneTF.delegate = self
		passwordTF.delegate = self
		
		viewButton.isEnabled = false
		viewButton.backgroundColor = .red
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let destinationVC = segue.destination as? DetailVC else {
			return
		}
		destinationVC.photo = addPhoto.image
		destinationVC.email = emailTF.text
		destinationVC.phone = phoneTF.text
		destinationVC.password = passwordTF.text
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	// MARK: - Actions
	
	@IBAction func chooseButtonPressed(_ sender: UIButton) {
		
		validPhoto()
		
		let actionSheet = UIAlertController(title: nil,
											message: nil,
											preferredStyle: .actionSheet)
		
		let camera = UIAlertAction(title: "Camera", style: .default) { _ in
			self.chooseImagePicker(source: .camera)
		}
		
		let photo = UIAlertAction(title: "Photo", style: .default) { _ in
			self.chooseImagePicker(source: .photoLibrary)
		}
		
		let cancel = UIAlertAction(title: "Cancel", style: .cancel)
		
		actionSheet.addAction(camera)
		actionSheet.addAction(photo)
		actionSheet.addAction(cancel)
		
		actionSheet.pruneNEgativeWidthConstraints()
		
		present(actionSheet, animated: true)
	}
	
	@IBAction func emailTFEditing(_ sender: UITextField) {
		
		guard let textEmail = emailTF.text else {
			return
		}
		
		if textEmail.isValid(validityEmail) {
			validLabel.text = "Valid \(validityEmail)"
			isValidTrue()
			validTextFields()
		} else {
			validLabel.text = "Not a valid \(validityEmail) Example: mail@email.ru"
			isValidFalse()
		}
	}
	
	@IBAction func phoneTFEditing(_ sender: UITextField) {
		
		guard let textPhone = phoneTF.text else {
			return
		}
		
		if textPhone.isValid(validityPhone) {
			validLabel.text = "Valid \(validityPhone)"
			isValidTrue()
			validTextFields()
		} else {
			
			validLabel.text = "Not a valid \(validityPhone) Example: +7 900 123-45-67"
			isValidFalse()
		}
	}
	
	@IBAction func passwordTFEditing(_ sender: UITextField) {
		
		guard let textPassword = passwordTF.text else {
			return
		}
		
		if textPassword.isValid(validityPassword) {
			validLabel.text = "Valid \(validityPassword)"
			isValidTrue()
			validTextFields()
		} else {
			validLabel.text = "Not a valid \(validityPassword) Example: 123Abc"
			isValidFalse()
		}
	}
	
	@IBAction func iconAction(_ sender: Any) {
		
		passwordTF.isSecureTextEntry.toggle()
	}
	
	@IBAction func viewPressed(_ sender: UIButton) {
	}
}

// MARK: - Extensions

extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func chooseImagePicker(source: UIImagePickerController.SourceType) {
		if UIImagePickerController.isSourceTypeAvailable(source) {
			let imagePicker = UIImagePickerController()
			imagePicker.delegate = self
			imagePicker.allowsEditing = true
			imagePicker.sourceType = source
			present(imagePicker, animated: true)
		}
	}
	
	func imagePickerController(
		_ picker: UIImagePickerController,
		didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
	) {
		addPhoto.image = info[.editedImage] as? UIImage
		addPhoto.contentMode = .scaleAspectFill
		addPhoto.clipsToBounds = true
		addPhotoButton.setBackgroundImage(UIImage(named: "photo"), for: .normal)
		validPhoto()
		validTextFields()
		dismiss(animated: true)
	}
}

extension UIAlertController {
	func pruneNEgativeWidthConstraints() {
		for subView in self.view.subviews {
			for constraint in subView.constraints
			where constraint.debugDescription.contains("width == - 16") {
				subView.removeConstraint(constraint)
			}
		}
	}
}
