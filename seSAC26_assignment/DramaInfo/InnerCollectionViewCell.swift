//
//  ReuasebleCollectionViewCell.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/31/24.
//

import UIKit

class InnerCollectionViewCell: UICollectionViewCell, configureViewProtocol {
   
    let titleLabel: BlackTitleLabel = {
        let label = BlackTitleLabel()
        return label
    }()
    
    
     let episodeCount: DarkgrayLabel = {
         let view = DarkgrayLabel()
         return view
     }()
    
    let posterImageView = PosterImageView(frame: .zero)
    
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(posterImageView)
        contentView.addSubview(episodeCount)

    }
    
    func configureConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalTo(140)
            make.top.bottom.equalTo(contentView.safeAreaLayoutGuide)

        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(8)
            make.leading.equalTo(posterImageView.snp.trailing).offset(8)
           
            make.height.equalTo(32)
        }
        
        episodeCount.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(4)
            make.leading.equalTo(titleLabel.snp.leading)
            make.height.equalTo(titleLabel.snp.height)
        }
    }
    
    func configureView() {
//        titleLabel.backgroundColor = .blue
        posterImageView.backgroundColor = .systemMint
//        posterImageView.backgroundColor = .clear
        
        titleLabel.text = "테스트 dighhdhgshdgh"
        episodeCount.text = "000000"

    }
    
}
