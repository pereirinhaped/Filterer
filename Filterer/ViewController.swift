//
//  ViewController.swift
//  Filterer
//
//  Created by Pedro Pereirinha on 08/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var centralImageView: UIImageView!
	
	var resultImg: UIImage?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let image = UIImage(named: "enso-green-logo.png")
		
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
		
		var myRGBA = RGBAImage(image: image!)!
		
		// *** DELETE AFTER ***
		// Value for testing
		let redAvg = 50
		
		// *** DELETE AFTER ***
		
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

	@IBAction func applyFilterPressed(sender: AnyObject) {
		centralImageView.image = resultImg
	}

}

