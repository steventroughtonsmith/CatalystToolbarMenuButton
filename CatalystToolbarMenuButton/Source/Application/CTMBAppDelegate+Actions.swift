//
//  CTMBAppDelegate.swift
//  CatalystToolbarMenuButton
//
//  Created by Steven Troughton-Smith on 09/04/2022.
//  
//

import UIKit

extension CTMBAppDelegate {
	
	// MARK: - Actions
	
	@objc func addNewPhoto(_ sender:Any?) {
		
	}
	
	@objc func addExistingPhoto(_ sender:Any?) {
		
	}

	@objc func addFromFile(_ sender:Any?) {
		
	}
	
	// MARK: - Dynamic Options
	
	/*
	 Demonstrating unavailable selector.
	 Use responds(to:) to change availability of menu items at runtime
	 */
	override func responds(to aSelector: Selector!) -> Bool {
		if aSelector == NSSelectorFromString("addFromFile:") {
			return false
		}
		
		return super.responds(to: aSelector)
	}
}
