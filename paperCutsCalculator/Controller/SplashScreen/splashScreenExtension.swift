//
//  splashScreenExtension.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/4/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import Foundation
import UIKit

// Why do you have to have everything in extension and separate file?

extension SplashScreenViewController {
	
	
	
	func setMainImage(){
		logoImage.image = UIImage(named: "largeLogo")
		logoImage.layer.cornerRadius = 20
	}
	
	func setAppTitleName(){
		appTitle.text = "Paper Cutout Calculator"
		appTitle.font = UIFont(name: "Helvetica Neue", size: 40)
		appTitle.textAlignment = .center
		appTitle.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
		
		
		// MyName Attributes
		myName.text = "By: Scott Leonard"
		myName.font = UIFont.systemFont(ofSize: 10)
		myName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
	}
	
	@objc func segue(){
		performSegue(withIdentifier: "segueToMain", sender: nil)
	}
	
	func setSegueTimer(){
        // new lines
		_ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(segue), userInfo: nil, repeats: false)
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		get {
			return .portrait
		}
	}
	
	func setAppVersion(){
		version.text = "v. 1.1"
		version.font = UIFont.systemFont(ofSize: 9)
		version.textColor = UIColor.blue
	}
}
