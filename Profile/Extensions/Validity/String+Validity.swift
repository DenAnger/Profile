//
//  String+Validity.swift
//  Profile
//
//  Created by Denis Abramov on 05.06.2024.
//  Copyright © 2024 Denis Abramov. All rights reserved.
//

import Foundation

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
