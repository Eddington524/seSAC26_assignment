//
//  ViewController.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//
//TODO://- 하나의 뷰컨트롤러에 컬렉션 1개를 추가하고, 컬렉션뷰를 섹션 (UICollectionReusableView)을 나눠 API 3개 호출해보기
//- eX. 컬렉션뷰 0번 섹션 : TrendAPI , 1번 섹션: Top Rated API, 2번 섹션:
//Popular API



import UIKit

class ViewController: UIViewController {

   let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ViewController.configureCollectionView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureView()
        setConstraintsView()
    }

    static func configureCollectionView() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        //1) 아이템사이즈
        layout.itemSize  = CGSize(width: UIScreen.main.bounds.width, height: 200)
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
    }
    
    func configureView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TrendCollectionViewCell.self, forCellWithReuseIdentifier: "TrendCollectionViewCell")
        collectionView.backgroundColor = .systemMint
    }
    
    func setConstraintsView(){
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.height.equalTo(200)
        }
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendCollectionViewCell", for: indexPath) as! TrendCollectionViewCell
        
        return cell
    }
    
    
}