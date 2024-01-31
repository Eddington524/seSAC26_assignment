//
//  MovieTableViewCell.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import UIKit
import SnapKit

class TvTableViewCell: UITableViewCell {

    let lineTitleLabel = LineTitleLabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureView()
        setupConstraints()
    }
    
    func configureHierarchy() {
        contentView.addSubview(lineTitleLabel)
        contentView.addSubview(collectionView)
    }
    
    func configureView(){
//        backgroundColor = .systemMint
//        lineTitleLabel.text = "테스트섹션 라벨 입니당"
//        collectionView.backgroundColor = .clear
    }
    
    func setupConstraints() {
        lineTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(16)
            make.leading.equalTo(contentView.snp.leading).inset(16)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(lineTitleLabel.snp.bottom)
            make.horizontalEdges.bottom.equalTo(contentView)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static func configureCollectionView() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        //1) 아이템사이즈
        layout.itemSize  = CGSize(width: UIScreen.main.bounds.width/3, height: 200)
        //2) mini spacing, interItemSpacing
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        //3) 섹션 인셋
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }
}
