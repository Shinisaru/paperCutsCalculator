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

    // prefer stockSizeList: [String] = []
	var stockSizeList = [String]()
	var solutionArray = [Double]()
    
    // avoid force unwrapping when possible; force unwrapped properties are generally used
    // when you expect your application crash exit if the property is unexpectedly nil
	var cutsForProject : PaperDetails!
	var displayAnswer : Bool = false
    
    // like here, for instance, you do want your app to crash if you forgot to assign outlets
	@IBOutlet weak var appTitle: UILabel!
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var sizePicker: UIPickerView!
	@IBOutlet weak var submitButton: UIButton!
    
	var submitButtonCount : Int = 0
	
	@IBOutlet weak var answersCollection: UIStackView!
		@IBOutlet weak var longAmountLabel: UILabel!
		@IBOutlet weak var shortAmountLabel: UILabel!
    // those names are not descriptiove at all
		@IBOutlet weak var long: UILabel!
		@IBOutlet weak var short: UILabel!
	
	@IBOutlet var keypadButtons: [UIButton]!
	@IBOutlet weak var buttonCluster: UIStackView!
	@IBOutlet weak var landscapeButtonCluster: UIStackView!
	
    // if a property has a default value it should not be optional
	var labelString : String? = ""
	@IBOutlet weak var shortValueInput: UILabel!
	@IBOutlet weak var longValueInput: UILabel!
	@IBOutlet weak var clearButton: UIButton!
	@IBOutlet weak var portraitClearButton: UIButton!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		checkOrientation()
        
        // method names should be descriptive of routines they perform and\or value they return
        // `shortValueInputLabelAttributes` -> `setupShortValueInputLabelAppearance`
		shortValueInputLabelAttributes()
		longValueInputLabelAttributes()
		clearButtonAttributes()
		mainViewBackgroundAttributes()
		answerBlockAttributes()
		addStockSizesToList()
		keypadAttributes()
		
		setSizePickerToDefault()
		submitButtonAttributes()
		
        // never commit commented code, this is git log's job
        
		// Adds Orientation Observer
		//keyboardObserver()
	}
	
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
        // this comment is redundant, you could just name your method beginObservingDeviceOrientation
        
		// Create new notification that checks originataion of screen
		orientationObserver()
        
        // You are adding new notification observer upon every view appearance event, and that happes way more
        // times you'd wished. You only need to setup it once -- use viewDidLoad
	}
	

	// if you are not using sender -- do not put it in method semantics
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

