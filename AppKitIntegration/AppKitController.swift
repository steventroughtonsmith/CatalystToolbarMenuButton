/*
 2021 Steven Troughton-Smith (@stroughtonsmith)
 Provided as sample code to do with as you wish.
 No license or attribution required.
 */

import AppKit

extension NSObject {
	@objc func hostWindowForSceneIdentifier(_ identifier:String) -> NSWindow? {
		return nil
	}
}

class AppKitController : NSObject {

	@objc var uiAppDelegate:NSObject? = nil
	
	// MARK: -
	
	@objc public func _marzipan_setupWindow(_ note:Notification) {
		
		NSLog("_marzipan_setupWindow: \(String(describing: note.userInfo))")
		
		/*
		 Here, AppKit has generated the host window for your UIKit window.
		 Now it is safe to go do any AppKit-y things you'd like to do to it
		 */
	}
}

extension AppKitController {
	
	@objc public func createAddToolbarItem(itemIdentifier:NSToolbarItem.Identifier) -> NSToolbarItem {
		let item = NSToolbarItem(itemIdentifier: itemIdentifier)
		
		let menuButton = NSPopUpButton()
		
		menuButton.pullsDown = true
		menuButton.bezelStyle = .texturedRounded
		
		let menu = NSMenu()
		
		let rootItem = NSMenuItem(title: "", action: nil, keyEquivalent: "")
		rootItem.image = NSImage(systemSymbolName: "plus", accessibilityDescription: "")!
		
		menu.items.append(rootItem)
		
		do {
			let item = NSMenuItem(title: NSLocalizedString("TAKE_PHOTO", comment: ""), action: NSSelectorFromString("addNewPhoto:"), keyEquivalent: "")
			item.target = uiAppDelegate
			menu.items.append(item)
		}
		
		menu.items.append(.separator())
		
		do {
			let item = NSMenuItem(title: NSLocalizedString("CHOOSE_FROM_LIBRARY", comment: ""), action: NSSelectorFromString("addExistingPhoto:"), keyEquivalent: "")
			item.target = uiAppDelegate
			menu.items.append(item)
		}
		
		do {
			let item = NSMenuItem(title: NSLocalizedString("CHOOSE_FROM_FILE", comment: ""), action: NSSelectorFromString("addFromFile:"), keyEquivalent: "")
			item.target = uiAppDelegate
			menu.items.append(item)
		}
		
		menuButton.menu = menu
		
		item.view = menuButton
		
		return item
	}
}
