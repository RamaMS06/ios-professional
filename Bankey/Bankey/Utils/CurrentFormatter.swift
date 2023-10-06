//
//  CurrentFormatter.swift
//  Bankey
//
//  Created by Rama Muhammad S on 06/10/23.
//

import Foundation
import UIKit

struct CurrentFormatter{
    
    func makeAttributedCurrency(_ amount: Decimal) -> NSMutableAttributedString{
        let tuple = breakIntoDollarsAndCents(amount)
        return makeBalanceAttributed(dollars: tuple.0, cents: tuple.1)
    }
    
    private func breakIntoDollarsAndCents(_ amount: Decimal) -> (String, String){
        //Separate amount before and after '.' into part
        let tuple = modf(amount.doubleValue)
        // amount: "999.00" -> "999"
        let dollars = convertDollar(tuple.0)
        // amount: "999.00" -> "00"
        let cent = convertCent(tuple.1)
        return (dollars, cent)
    }
    
    private func convertDollar(_ dollarPart: Double) -> String{
        let dollarsWithDecimal = dollarsFormatter(dollarPart)
        let formatter = NumberFormatter()
        let decimalSeparator = formatter.decimalSeparator!
        let dollarComponent = dollarsWithDecimal.components(separatedBy: decimalSeparator)
        var dollars = dollarComponent.first!
        dollars.removeFirst()
        return dollars
    }
    
    private func convertCent(_ centPart: Double) -> String{
        let cents: String
        cents = centPart == 0 ? "00" : String(format: "%.0f", centPart * 100)
        return cents
    }
    
    private func dollarsFormatter(_ dollars: Double) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: dollars as NSNumber){
            return result
        }
        
        return ""
    }
    
    private func makeBalanceAttributed(dollars: String, cents: String) -> NSMutableAttributedString{
        
        let rootString = NSMutableAttributedString(string: "$", attributes: [.font : UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8])
        let dollarString = NSMutableAttributedString(string: dollars, attributes: [.font : UIFont.preferredFont(forTextStyle: .title1)])
        let centString = NSMutableAttributedString(string: cents, attributes: [.font : UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8])
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
    
}
