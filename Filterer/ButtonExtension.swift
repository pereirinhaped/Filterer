//
//  ButtonExtension.swift
//  Filterer
//
//  Created by Pedro Pereirinha on 10/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

public extension UIButton {
	private func imageWithColor(color: UIColor) -> UIImage {
		let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		
		CGContextSetFillColorWithColor(context, color.CGColor)
		CGContextFillRect(context, rect)
		
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return image
	}
	
	public func setBackgroundColor(color: UIColor, forUIControlState state: UIControlState) {
		self.setBackgroundImage(imageWithColor(color), forState: state)
	}
}
