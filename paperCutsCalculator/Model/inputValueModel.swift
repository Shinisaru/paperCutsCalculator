//
//  inputValueModel.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/1/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import Foundation

struct PaperDetails {
	var shortSideInput: Double
	var longSideInput: Double
	static var stockSizes = [String]()
	var parentSheetSize: PaperSizes
	
	init(shortSideInput: Double, longSideInput:Double, parentSheetSize: PaperSizes) {
		self.shortSideInput = shortSideInput
		self.longSideInput = longSideInput
		self.parentSheetSize = parentSheetSize
	}
	
	
	func performCalculation(_ longS : Double, _ shortS : Double, _ type : PaperSizes)->[Double]{
		let shortLength : Double
		let longLenght :Double
		
		switch type {
		case .letter:
			shortLength = 8.5
			longLenght = 11
		case .legal:
			shortLength = 8.5
			longLenght = 14
		case .tabloid:
			shortLength = 11
			longLenght = 17
		case .oversized:
			shortLength = 12
			longLenght = 18
		}
		
        // why separate declaration?
		let longGrainValue : Double
		let shortGrainValue : Double
		

		longGrainValue = (removeDecimalValues(shortLength/shortS) * removeDecimalValues(longLenght/longS))
		shortGrainValue = (removeDecimalValues(shortLength/longS) * removeDecimalValues(longLenght/shortS))
		
        // use tuple here
		return [longGrainValue, shortGrainValue]
	}
	
	// converts incoming values to strings and removes values after decimal 
	func removeDecimalValues(_ rawValueDouble: Double)->Double{
        // Why are you reinventing basic flooring operation?
		let stringValue = String(rawValueDouble)
		let removedDecimal = stringValue.split(separator: ".")
		let correctedValue = removedDecimal[0]
		let returnValue = Double(correctedValue)
		return returnValue!
	}
}

enum PaperSizes {
	case letter
	case legal
	case tabloid
	case oversized
}
