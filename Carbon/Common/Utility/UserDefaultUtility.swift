//
//  UserDefaultUtility.swift
//  TheEmployees
//
//  Created by Decagon on 8/17/21.
//

import Foundation

struct UserDefaultUtility {
  
  static func saveUserID(userID: Int) {
    UserDefaults.standard.setValue(userID, forKey: "userID")
  }
  
  static func getUserID() -> Int {
    return UserDefaults.standard.value(forKey: "userID") as! Int
  }
}
