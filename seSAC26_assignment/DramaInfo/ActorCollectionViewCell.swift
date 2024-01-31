//
//  ActorCollectionViewCell.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 2/1/24.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell, configureViewProtocol {
    
    let nameLabel: BlackTitleLabel = {
        let label = BlackTitleLabel()
        return label
    }()
    
    let characterLabel: DarkgrayLabel = {
        let label = DarkgrayLabel()
        return label
    }()
    
    let profileImageView = ProfileImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(profileImageView)

    }
    
    func configureConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.size.equalTo(140)

        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom)
            make.centerX.equalTo(profileImageView.snp.center)
            make.height.equalTo(32)
        }
        
        characterLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(4)
            make.leading.equalTo(nameLabel.snp.leading)
            make.height.equalTo(nameLabel.snp.height)
        }
    }
    
    func configureView() {
//        titleLabel.backgroundColor = .blue
        profileImageView.backgroundColor = .systemMint
//        posterImageView.backgroundColor = .clear
        
        nameLabel.text = "테스트 유연석"
        characterLabel.text = "캐릭터 이름"

    }
}
