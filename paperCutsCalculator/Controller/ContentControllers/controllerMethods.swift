//
//  controllerMethods.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/4/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import Foundation
import UIKit

// Why do you need to have this public extension separated from ViewController.swift?
// What is the benefit of extension? Why in separate file?

extension ViewController {
	
	// Button Attributes
	
	func shortValueInputLabelAttributes(){
        // NEVER use semicolon in swift
        // NEVER put multiple declarations on single line
        // NEVER use xcode image shorthands for colors or images over UIImage(named: "") or UIColor(...).
        // It looks good only you, everyone else will hate you for that, especially code reviewer/team lead
        
		shortValueInput.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) ; shortValueInput.textColor = .white ; shortValueInput.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		shortValueInput.layer.borderWidth = 1 ; shortValueInput.layer.cornerRadius = 5
		shortValueInput.text = nil
	}
	
	func longValueInputLabelAttributes(){
        // Magic numbers are bad, really BAD practice. Create a struct or en enum named Configuration (Theme, etc.)
        // and put your magical number there under NAMED properties
		longValueInput.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) ; longValueInput.textColor = .white ; longValueInput.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		longValueInput.layer.borderWidth = 1 ; longValueInput.layer.cornerRadius = 5
		longValueInput.text = nil
	}
	
	func clearButtonAttributes(){
		clearButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
		portraitClearButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
	}
	
	func mainViewBackgroundAttributes(){
		appTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		backgroundImage.image = UIImage(imageLiteralResourceName: "multiColor")
		
	}
	
	func answerBlockAttributes(){
		long.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		short.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		answersCollection.isHidden = true
	}
	
	func keypadAttributes(){
        // prefer using .forEach or even better subclass your buttons to a ui component
		for button in keypadButtons {
			button.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
			button.layer.borderWidth = 1
			button.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
			button.layer.cornerRadius = 10
			button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
		}
	}
	
	func setSizePickerToDefault(){
        // same for magical numbers have 2 enumerations of raw type Int with named rows and components
        // and have a method for those in private extension of UIPickerView
		sizePicker.selectRow(0, inComponent: 0, animated: true)
	}
	
	func submitButtonAttributes(){
		submitButton.layer.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 0)
		submitButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		submitButton.layer.borderWidth = 1
		submitButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
		submitButton.layer.cornerRadius = 10
		submitButton.setTitle("Next", for: .normal)
	}
	
//	func keyboardObserver(){
//		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//	}
	
	func orientationObserver(){
		NotificationCenter.default.addObserver(self, selector: #selector(applicationOrientation), name: UIApplication.didChangeStatusBarOrientationNotification, object: nil)
	}
	
	func checkOrientation(){
		if UIApplication.shared.statusBarOrientation.isPortrait {
            // usage of self is redundant
			self.view.frame.origin.y = 0
			buttonCluster.isHidden = false
			landscapeButtonCluster.isHidden = true
		}
		
		if UIApplication.shared.statusBarOrientation.isLandscape {
			buttonCluster.isHidden = true
			landscapeButtonCluster.isHidden = false
		}
	}
	
    // for separation of logical parts of the code use MARK: -
	// Observer Functions
	
//	@objc func keyboardWillShow(notification: NSNotification){
//		guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
//
//		if UIApplication.shared.statusBarOrientation.isLandscape {
//			if self.view.frame.origin.y == 0 {
//				self.view.frame.origin.y -= keyboardSize.height - (keyboardSize.height * 0.30)
//			}
//		}
//	}
	
	// observer waits for notification and determines view position based on screen orientation
	@objc func applicationOrientation(notification: NSNotification){
		
		if UIApplication.shared.statusBarOrientation.isPortrait {
			self.view.frame.origin.y = 0
			buttonCluster.isHidden = false
			landscapeButtonCluster.isHidden = true
		}
		
		if UIApplication.shared.statusBarOrientation.isLandscape {
			buttonCluster.isHidden = true
			landscapeButtonCluster.isHidden = false
		}
	}
	
	
	
	// General Application wide Functions
	
	func clearValues(){
		
		sizePicker.selectRow(0, inComponent: 0, animated: true)
		answersCollection.isHidden = true
		displayAnswer = false
		submitButton.setTitle("Next", for: .normal)
		shortValueInput.text = nil
		longValueInput.text = nil
		submitButtonCount = 0
		labelString = ""
		
	}
	
	func keyboardWillHide(){
        // guard should be used here instead of if
		if UIApplication.shared.statusBarOrientation.isLandscape{
            // self is redundant
			if self.view.frame.origin.y != 0 {
				self.view.frame.origin.y = 0
			}
		}
	}
	
}
