//
//  NSObject+AppKitGlue.swift
//  CatalystToolbarMenuButton
//
//  Created by Steven Troughton-Smith on 09/04/2022.
//

import UIKit

#if targetEnvironment(macCatalyst)
import AppKit

extension NSObject {
	@objc public func _marzipan_setupWindow(_ sender:Any) {
		
	}

	@objc public func createAddToolbarItem(itemIdentifier:NSToolbarItem.Identifier) -> NSToolbarItem {
		return NSToolbarItem(itemIdentifier: itemIdentifier)
		
	}
}
#endif
