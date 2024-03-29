//
//  ProfileImageView.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 2/1/24.
//

import UIKit

class ProfileImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
