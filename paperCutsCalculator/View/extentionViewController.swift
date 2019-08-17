//
//  extentionViewController.swift
//  paperCutsCalculator
//
//  Created by Scott Leonard on 8/1/19.
//  Copyright © 2019 Scott Leonard. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UIPickerViewDelegate {
	
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 50
	}
	

	
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let newView = UIView(frame: CGRect(x: 0, y: 0, width: 475, height: 300))
		let newLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 475, height: 300))
		
		newLabel.text = stockSizeList[row]
		newLabel.textAlignment = .center
		newLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		//newLabel.font = .systemFont(ofSize: 50)
		newLabel.font = UIFont(name: "Helvetica Neue", size: 50)
		newView.addSubview(newLabel)
		return newView
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		let selectedSize = stockSizeList[row]
		
		print(selectedSize)
		
	}
	
}



extension ViewController : UIPickerViewDataSource {
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return stockSizeList.count
	}
	
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
}
