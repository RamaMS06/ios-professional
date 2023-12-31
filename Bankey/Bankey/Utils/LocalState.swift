//
//  LocalState.swift
//  Bankey
//
//  Created by Kopnuspos on 03/10/23.
//

import Foundation

class LocalState{
    
    private enum Keys: String{
        case hasOnboarded
    }
    
    public static var hasOnboarded: Bool{
        get{
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set{
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
        }
    }
}
