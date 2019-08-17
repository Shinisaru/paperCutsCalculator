//
//  ViewController.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/1/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

	var stockSizeList = [String]()
	var solutionArray = [Double]()
	var cutsForProject : PaperDetails!
	var displayAnswer : Bool = false
	@IBOutlet weak var appTitle: UILabel!
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var sizePicker: UIPickerView!
	@IBOutlet weak var submitButton: UIButton!
	var submitButtonCount : Int = 0
	
	@IBOutlet weak var answersCollection: UIStackView!
		@IBOutlet weak var longAmountLabel: UILabel!
		@IBOutlet weak var shortAmountLabel: UILabel!
		@IBOutlet weak var long: UILabel!
		@IBOutlet weak var short: UILabel!
	
	@IBOutlet var keypadButtons: [UIButton]!
	@IBOutlet weak var buttonCluster: UIStackView!
	@IBOutlet weak var landscapeButtonCluster: UIStackView!
	
	var labelString : String? = ""
	@IBOutlet weak var shortValueInput: UILabel!
	@IBOutlet weak var longValueInput: UILabel!
	@IBOutlet weak var clearButton: UIButton!
	@IBOutlet weak var portraitClearButton: UIButton!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		checkOrientation()
		shortValueInputLabelAttributes()
		longValueInputLabelAttributes()
		clearButtonAttributes()
		mainViewBackgroundAttributes()
		answerBlockAttributes()
		addStockSizesToList()
		keypadAttributes()
		
		setSizePickerToDefault()
		submitButtonAttributes()
		
		// Adds Orientation Observer
		//keyboardObserver()
	}
	
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		// Create new notification that checks originataion of screen
		orientationObserver()
	}
	

	
	@IBAction func clearButton(_ sender: Any) {
		clearValues()
	}
	
	@IBAction func submitData(_ sender: Any?){
		submitDataInformation()
	}
	
	@IBAction func clickedButton(_ sender: UIButton) {
		
		dataTransferToLabels(sender)
		
	}
	
}

