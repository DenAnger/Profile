//
//  DetailVC.swift
//  Profile
//
//  Created by Denis Abramov on 30.06.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import MessageUI

class DetailVC: UIViewController, MFMailComposeViewControllerDelegate {
	
	@IBOutlet var photoImage: UIImageView!
	
	@IBOutlet var emailLabel: UILabel!
	@IBOutlet var phoneLabel: UILabel!
	@IBOutlet var passwordLabel: UILabel!
	
	@IBOutlet var sendEmail: UIButton!
	
	var photo: UIImage!
	var email: String!
	var phone: String!
	var password: String!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		photoImage.image = photo
		
		emailLabel.text = email
		phoneLabel.text = phone
		passwordLabel.text = password
		
		sendEmail.layer.cornerRadius = 5
	}
	
	func mailComposeController(_ controller: MFMailComposeViewController,
							   didFinishWith result: MFMailComposeResult,
							   error: Error?) {
		controller.dismiss(animated: true)
	}
	
	@IBAction func sendByEmail(_ sender: Any) {
		
		if MFMailComposeViewController.canSendMail() {
			let mail = MFMailComposeViewController()
			mail.mailComposeDelegate = self
			mail.setToRecipients(["test@mail.ru"])
			mail.setSubject("My contacts")
			mail.setMessageBody("Email: \(email!)\nphone: \(phone!)",
								isHTML: true)
			present(mail, animated: true)
		} else {
			print("Application is not able to send an email")
		}
	}
}
