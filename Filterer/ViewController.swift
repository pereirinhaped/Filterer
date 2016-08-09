//
//  ViewController.swift
//  Filterer
//
//  Created by Pedro Pereirinha on 08/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let image = UIImage(named: "enso-green-logo.png")
	var imageView = UIImageView()
	
	var resultImg: UIImage?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Definition of main View dimensions
		let viewWidth = view.frame.width
		let viewHeight = view.frame.height
		
		// Declaration and injection of default image in main View
		imageView.image = image
		
		let imageX = viewWidth / 2 - 90
		let imageY = viewHeight / 2 - 90
		let imageWidth: CGFloat = 180
		let imageHeight: CGFloat = 180
		
		imageView.frame = CGRect(x: imageX, y: imageY, width: imageWidth, height: imageHeight)
		
		view.addSubview(imageView)
		
		// Declaration and injection of Button in main view
		let buttonX = imageX
		let buttonY = imageY + imageHeight + 8
		let buttonW = imageWidth
		let buttonH: CGFloat = 30
		let buttonFrame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
		let selectedBkgColor = UIColor.blueColor().colorWithAlphaComponent(0.6)
		
		let applyFilterBtn = UIButton(frame: buttonFrame)
		applyFilterBtn.showsTouchWhenHighlighted = true
		applyFilterBtn.setTitle("Apply Filter", forState: .Normal)
		applyFilterBtn.setTitle("Revert Filter", forState: .Selected)
		applyFilterBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
		applyFilterBtn.setTitleColor(UIColor.whiteColor(), forState: .Selected)
		applyFilterBtn.setBackgroundColor(selectedBkgColor, forUIControlState: .Selected)
		
		applyFilterBtn.addTarget(self, action: #selector(self.applyBtnPressed), forControlEvents: .TouchUpInside)
		view.addSubview(applyFilterBtn)
		
		// Filtered image
		var myRGBA = RGBAImage(image: image!)!
		
		let redAvg = 50
		
		for x in 0..<myRGBA.pixels.count {
			var pixel = myRGBA.pixels[x]
			let redDiff = Int(pixel.red) - redAvg
			if redDiff > 0 {
				pixel.red = UInt8(max(0,min(255, redAvg + redDiff * 50)))
				myRGBA.pixels[x] = pixel
			}
		}
		
		resultImg = myRGBA.toUIImage()!

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func applyBtnPressed(sender: UIButton) {
		if sender.selected {
			imageView.image = image
			sender.selected = false
		} else {
			imageView.image = resultImg
			sender.selected = true
		}
		
	}
	
	// Not being used
	func getColorAverages(image: RGBAImage) -> [Int] {
		var totalRed = 0
		var totalGreen = 0
		var totalBlue = 0
		let totalPixels = image.pixels.count
		
		for x in 0..<image.pixels.count {
			var pixel = image.pixels[x]
			
			totalRed += Int(pixel.red)
			totalGreen += Int(pixel.green)
			totalBlue += Int(pixel.blue)
			
		}
		
		var result = [Int]()
		
		result.append(totalRed / totalPixels)
		result.append(totalGreen / totalPixels)
		result.append(totalBlue / totalPixels)
		
		return result
	}
	
}

