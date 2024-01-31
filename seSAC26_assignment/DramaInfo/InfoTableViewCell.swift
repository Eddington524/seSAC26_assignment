//
//  SeriesTableViewCell.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/31/24.
//

import UIKit
import SnapKit

class InfoTableViewCell: UITableViewCell, configureViewProtocol {
    
    let infoTitle: UILabel = {
        let title = UILabel()
        return title
    }()
    
    
    let innerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: InfoTableViewCell.configureSeasonCollectionView())


//    let lineupCollectionView = UICollectionView()
//    let recommendCollectionView = UICollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureConstraints()
        configureView()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(infoTitle)
        contentView.addSubview(innerCollectionView)
    }
    
    func configureConstraints() {
        infoTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        innerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(infoTitle.snp.bottom).inset(12)
            make.horizontalEdges.bottom.equalTo(contentView)
        }
        
    }
    
    func configureView() {
        infoTitle.backgroundColor = .clear
//        innerCollectionView.backgroundColor = .yellow
    }

}

extension InfoTableViewCell {
    static func configureSeasonCollectionView() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        //1) 아이템사이즈
        layout.itemSize  = CGSize(width: UIScreen.main.bounds.width/2 + 40, height: 200)
        //2) mini spacing, interItemSpacing
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        //3) 섹션 인셋
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }
}
