//
//  CTMBSceneDelegate+NSToolbar.swift
//  CatalystToolbarMenuButton
//
//  Created by Steven Troughton-Smith on 09/04/2022.
//  
//

import UIKit

#if targetEnvironment(macCatalyst)
import AppKit

extension NSToolbarItem.Identifier {
	static let new = NSToolbarItem.Identifier("com.highcaffeinecontent.toolbar.new")
}

extension CTMBSceneDelegate: NSToolbarDelegate {
    
	func toolbarItems() -> [NSToolbarItem.Identifier] {
		return [.toggleSidebar, .flexibleSpace, .new]
	}
	
	func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return toolbarItems()
	}
	
	func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return toolbarItems()
	}
	
	func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
		if itemIdentifier == .new {
			if let newItem = CTMBAppDelegate.appKitController?.createAddToolbarItem(itemIdentifier: itemIdentifier) {
				return newItem
			}
			else {
				return NSToolbarItem(itemIdentifier: itemIdentifier)
			}
		}
		
		return NSToolbarItem(itemIdentifier: itemIdentifier)
	}
}
#endif
