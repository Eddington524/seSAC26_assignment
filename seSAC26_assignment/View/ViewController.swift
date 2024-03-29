//
//  ViewController.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {

    let titleList:[String] = ["뜨거운 핫 트렌드!", "평점 높은 TV!", "이보다 더 유명할 수 없는 프로그램"]
    let tableView  = UITableView()
    
    var tvList:[[TV]] = [[],[],[]]
    
   let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ViewController.configureCollectionView())

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureView()
        setConstraintsView()
        let group = DispatchGroup()
        
        group.enter()
        APImanager.shared.fetchTVImages(url: "trending/tv/week") { tvs in
            self.tvList[0] = tvs
            group.leave()
        }
        group.enter()
        APImanager.shared.fetchTVImages(url: "tv/top_rated") { tvs in
            self.tvList[1] = tvs
//            self.collectionView.reloadData()
            group.leave()
        }
        group.enter()
        APImanager.shared.fetchTVImages(url: "tv/popular") { tvs in
            self.tvList[2] = tvs
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.collectionView.reloadData()
            self.tableView.reloadData()
        }
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
    
    func configureHierachy() {
        view.addSubview(collectionView)
        view.addSubview(tableView)
    }
    
    func configureView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TrendCollectionViewCell.self, forCellWithReuseIdentifier: "TrendCollectionViewCell")
//        collectionView.backgroundColor = .systemMint
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 280
        
        tableView.register(TvTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        
    }
    
    func setConstraintsView(){
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.height.equalTo(200)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return tvList.count
        return tvList[self.collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendCollectionViewCell", for: indexPath) as! TrendCollectionViewCell
        
//        let item = tvList[indexPath.row]
//        let item = tvList[collectionView.tag][indexPath.row]
        let item = tvList[collectionView.tag][indexPath.row]
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\( item.poster ?? "")") {
            cell.posterImage.kf.setImage(with: url, placeholder: UIImage(systemName: "movieclapper"))
        }else{
            print("이미지데이터 오류")
        }
        
        cell.titleLabel.text = item.name
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! TvTableViewCell
        
        // 아하! cell 안에서도 연결 시켜줘야지!
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(TrendCollectionViewCell.self, forCellWithReuseIdentifier: "TrendCollectionViewCell")
        cell.collectionView.tag = indexPath.row
        cell.lineTitleLabel.text = titleList[indexPath.row]
     
        cell.collectionView.reloadData()
        
        return cell
    }
    
}
