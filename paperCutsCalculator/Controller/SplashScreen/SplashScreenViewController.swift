//
//  SplashScreenViewController.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/4/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import UIKit
import Foundation

class SplashScreenViewController: UIViewController {


	@IBOutlet weak var appTitle: UILabel!
	@IBOutlet weak var logoImage: UIImageView!
	@IBOutlet weak var myName: UILabel!
	@IBOutlet weak var version: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setMainImage()
		setAppTitleName()
		setSegueTimer()
		setAppVersion()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	
	}

}
