//
//  PosterImageView.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
