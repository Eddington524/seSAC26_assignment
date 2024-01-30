//
//  BlackTitleLabel.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import UIKit

class BlackTitleLabel: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func configureView() {
        self.backgroundColor = .clear
        self.font = .boldSystemFont(ofSize: 12)
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
