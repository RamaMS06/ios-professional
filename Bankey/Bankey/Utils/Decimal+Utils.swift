//
//  Decimal+Util.swift
//  Bankey
//
//  Created by Rama Muhammad S on 06/10/23.
//

import Foundation

extension Decimal{
    var doubleValue: Double{
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
