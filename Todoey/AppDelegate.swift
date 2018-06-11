//
//  AppDelegate.swift
//  Todoey
//
//  Created by Andres Quintero on 5/27/18.
//  Copyright © 2018 Andres Quintero. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Print function to find the data.realm file
        //print("didFinishLaunchingWithOptions")
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
       
        do {
            _ = try Realm()
        } catch {
            print("There was an error initializing realm \(error)")
        }
        
      
        
        return true
    }
    
}






