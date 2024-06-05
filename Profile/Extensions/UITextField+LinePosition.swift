//
//  LinePosition.swift
//  Profile
//
//  Created by Denis Abramov on 01.07.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

extension UITextField {
	
	func setBottomBorder() {
		self.borderStyle = .none
		self.layer.backgroundColor = UIColor.white.cgColor
		
		self.layer.masksToBounds = false
		self.layer.shadowColor = UIColor.lightGray.cgColor
		self.layer.shadowOffset = CGSize(width: 0, height: 1)
		self.layer.shadowOpacity = 1.0
		self.layer.shadowRadius = 0.0
	}
}
