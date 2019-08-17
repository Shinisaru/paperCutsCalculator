//
//  controllerMethods.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/4/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
	
	// Button Attributes
	
	func shortValueInputLabelAttributes(){
		shortValueInput.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) ; shortValueInput.textColor = .white ; shortValueInput.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		shortValueInput.layer.borderWidth = 1 ; shortValueInput.layer.cornerRadius = 5
		shortValueInput.text = nil
	}
	
	func longValueInputLabelAttributes(){
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
		for button in keypadButtons {
			button.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
			button.layer.borderWidth = 1
			button.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
			button.layer.cornerRadius = 10
			button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
		}
	}
	
	func setSizePickerToDefault(){
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
			self.view.frame.origin.y = 0
			buttonCluster.isHidden = false
			landscapeButtonCluster.isHidden = true
		}
		
		if UIApplication.shared.statusBarOrientation.isLandscape {
			buttonCluster.isHidden = true
			landscapeButtonCluster.isHidden = false
		}
	}
	
	
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
		if UIApplication.shared.statusBarOrientation.isLandscape{
			if self.view.frame.origin.y != 0 {
				self.view.frame.origin.y = 0
			}
		}
	}
	
}
