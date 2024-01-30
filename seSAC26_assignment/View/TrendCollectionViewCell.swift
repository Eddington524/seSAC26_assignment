//
//  TrendCollectionViewCell.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import UIKit
import SnapKit

class TrendCollectionViewCell: UICollectionViewCell {
    
    //ui 요소 포스터, 라벨
    let titleLabel = BlackTitleLabel()
    let posterImage = PosterImageView(frame: .zero)
    
    // 커스텀 클래스 생성자호출
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        setupConstraints()
        configureView()
    }
    
    func configureHierarchy() {
        //content에 넣어야함
        contentView.addSubview(titleLabel)
        contentView.addSubview(posterImage)
    }
    
    func configureView(){
//        posterImage.image = UIImage(systemName: "star")
//        titleLabel.text = "임시타이틀!"
    }
    
    func setupConstraints() {
        posterImage.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(contentView.snp.bottom).offset(4)
            make.height.equalTo(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 생성자 안에서 계층, 레이아웃, 뷰스타일링
    
}
