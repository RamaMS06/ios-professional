//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Rama Muhammad S on 05/10/23.
//

import UIKit

class AccountSummaryHeaderView: UIView{
    @IBOutlet var contentView: UIView!
    
    let identifier = "AccountSummaryHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize{
        return .init(width: UIView.noIntrinsicMetric, height: 144)
    }
}

extension AccountSummaryHeaderView{
    private func commonInit(){
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        bundle.loadNibNamed(identifier, owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = appColor
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
