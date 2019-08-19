//
//  calculationsModel.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/3/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import Foundation
// UIKit already likns Foundation
import UIKit

// Model has to be a separate entity, not an extension over controller
extension ViewController {
	
	func addStockSizesToList(){
		stockSizeList = ["8.5 x 11","8.5 x 14","11 x 17","12 x 18"]
		PaperDetails.stockSizes  = stockSizeList
		
	}
	
	
	
	func gatherData() {
        // prefer using single line guard statements
        // at least put every guard case on separate line
		guard let shortSideOfStock = shortValueInput.text, let longSideOfStock = longValueInput.text else {
			clearValues()
			return	
		}
		
		guard let doubleShortSideOfStock = Double(shortSideOfStock) else {
			shortValueInput.text = nil
			return
		}
		
		guard let doubleLongSideOfStock = Double(longSideOfStock)  else {
			longValueInput.text = nil
			return
		}
		
		guard doubleLongSideOfStock >= doubleShortSideOfStock else{
			clearValues()
			return
		}
		
		guard let parentSizeSelector = determineStockSizeValues(sizePicker.selectedRow(inComponent: 0)) else {return}
		
        // every parameter on new line
		cutsForProject = PaperDetails(shortSideInput: doubleShortSideOfStock, longSideInput: doubleLongSideOfStock, parentSheetSize: parentSizeSelector)
		
		guard let cutsForProject = cutsForProject else {return}
		
		print("""
			Short Size: \(cutsForProject.shortSideInput)
			Long Size: \(cutsForProject.longSideInput)
			Selected Parent Size: \(cutsForProject.parentSheetSize)
			""")
		
		// Run actual calculations
		
		
	}
	
	
	func determineStockSizeValues(_ selectedSizeInPicker: Int) -> PaperSizes?{
        // Make PaperSize of rawType Int and use PaperSizes(rawValue: selectedSizeInPicker)
		switch selectedSizeInPicker {
		case 0:
			return .letter
		case 1:
			return .legal
		case 2:
			return .tabloid
		case 3:
			return .oversized
		default:
			return nil
		}
	}
	
	

		
		
		func submitDataInformation(){
			cutsForProject = nil
			
			if submitButtonCount < 2 {
				checkButtonCount(submitButtonCount)
			}
			
            // this is an example of antipattern called pyramid of doom; avoid it
			if submitButtonCount == 2 {
				gatherData()
				keyboardWillHide()
				
				if cutsForProject != nil {
					gatherCalculations()
					if !displayAnswer {
						sizePicker.isHidden = true
						displayAnswer = true
						answersCollection.isHidden = false
					}else{
						sizePicker.isHidden = false
						clearValues()
					}
				}
		}
	}
	
	func checkButtonCount(_ buttonCounter: Int){
		guard shortValueInput.text != nil else {return}
        
        // submitButtonCount += 1, labelString = "" redundancy
		switch buttonCounter {
		case 0:
				submitButtonCount += 1
				labelString = ""
				submitButton.setTitle("Submit", for: .normal)
		case 1:
			submitButtonCount += 1
			submitButton.setTitle("Clear", for: .normal)
			labelString = ""
		default:
			break
		}
	}
	
	func gatherCalculations(){
		solutionArray = cutsForProject.performCalculation(cutsForProject.shortSideInput, cutsForProject.longSideInput, cutsForProject.parentSheetSize)
		
        // why did you separate declaration and assigment?
		var longGrain : String = ""
		var shortGrain : String = ""
		
		// needs to be switched
		longGrain = String(solutionArray[1])
		shortGrain = String(solutionArray[0])
		
		print("LongGrain: \(longGrain) — ShortGrain: \(shortGrain)")
		
		longAmountLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		shortAmountLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		
		longAmountLabel.text = longGrain
		shortAmountLabel.text = shortGrain
	}
	
	func dataTransferToLabels(_ sender: UIButton){
		guard let inputValue = sender.titleLabel?.text else {return}
		
        // absolute state of redundacy here
		switch submitButtonCount {
		case 0:
			labelString = labelString?.appending(inputValue)
			shortValueInput.text = ""
			shortValueInput.text = labelString
			
		case 1:
			labelString = labelString?.appending(inputValue)
			longValueInput.text = ""
			longValueInput.text = labelString
			
		default:
			break
		}
	}
}

