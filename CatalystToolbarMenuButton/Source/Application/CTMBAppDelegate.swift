//
//  CTMBAppDelegate.swift
//  CatalystToolbarMenuButton
//
//  Created by Steven Troughton-Smith on 09/04/2022.
//  
//

import UIKit

@UIApplicationMain
class CTMBAppDelegate: UIResponder, UIApplicationDelegate {
	
	// MARK: - AppKit Bundle Loading
	
#if targetEnvironment(macCatalyst)
	static var appKitController:NSObject?
	
	class func loadAppKitIntegrationFramework() {
		
		if let frameworksPath = Bundle.main.privateFrameworksPath {
			let bundlePath = "\(frameworksPath)/AppKitIntegration.framework"
			do {
				try Bundle(path: bundlePath)?.loadAndReturnError()
				
				let bundle = Bundle(path: bundlePath)!
				NSLog("[APPKIT BUNDLE] Loaded Successfully")
				
				if let appKitControllerClass = bundle.principalClass as? NSObject.Type {
					appKitController = appKitControllerClass.init()
					
					NotificationCenter.default.addObserver(appKitController as Any, selector: #selector(_marzipan_setupWindow(_:)), name: NSNotification.Name("UISBHSDidCreateWindowForSceneNotification"), object: nil)
				}
			}
			catch {
				NSLog("[APPKIT BUNDLE] Error loading: \(error)")
			}
		}
	}
#endif
	
	// MARK: -
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
#if targetEnvironment(macCatalyst)
		CTMBAppDelegate.loadAppKitIntegrationFramework()
#endif
		
		return true
	}
}
