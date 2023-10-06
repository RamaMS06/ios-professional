//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Rama Muhammad S on 05/10/23.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell{
    
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImage = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell{
    private func setup(){
        for view in [typeLabel, underlineView, nameLabel, balanceStackView, chevronImage]{
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
        }
        
        for view in [balanceLabel, balanceAmountLabel]{
            view.translatesAutoresizingMaskIntoConstraints = false
            balanceStackView.addArrangedSubview(view)
        }
        
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account Type"
        
        underlineView.backgroundColor = appColor
        
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "No-Fee All-In Chequing"
        
        balanceLabel.font = .preferredFont(forTextStyle: .body)
        balanceLabel.adjustsFontForContentSizeCategory = true
        balanceLabel.text = "Some Balance"
        balanceLabel.textAlignment = .right
        
        balanceAmountLabel.font = .preferredFont(forTextStyle: .body)
        balanceAmountLabel.adjustsFontForContentSizeCategory = true
        balanceAmountLabel.attributedText = makeFormatBalance(amount: "9123122")
        balanceAmountLabel.textAlignment = .right
        
        balanceStackView.axis = .vertical
        
        chevronImage.image = .init(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leftAnchor.constraint(equalToSystemSpacingAfter: leftAnchor, multiplier: 2),
            
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leftAnchor.constraint(equalTo: typeLabel.leftAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leftAnchor.constraint(equalTo: underlineView.leftAnchor),
            
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.topAnchor, multiplier: 0),
            balanceStackView.leftAnchor.constraint(equalToSystemSpacingAfter: nameLabel.rightAnchor, multiplier: 4),
            
            chevronImage.leftAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.rightAnchor, multiplier: 2),
            rightAnchor.constraint(equalToSystemSpacingAfter: chevronImage.rightAnchor, multiplier: 2),
            chevronImage.topAnchor.constraint(equalToSystemSpacingBelow: balanceStackView.topAnchor, multiplier: 1)
        ])
    }
    
    private func makeFormatBalance(amount: String) -> NSMutableAttributedString{
        
        let dollars: String = String(amount.dropLast(2))
        let cents: String = String(amount.suffix(2))
        
        let rootString = NSMutableAttributedString(string: "$", attributes: [.font : UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8])
        let dollarString = NSMutableAttributedString(string: dollars, attributes: [.font : UIFont.preferredFont(forTextStyle: .title1)])
        let centString = NSMutableAttributedString(string: cents, attributes: [.font : UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8])
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}
