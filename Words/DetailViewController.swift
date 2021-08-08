//
//  DetailViewController.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit

class DetailViewController: UIViewController {
    
    var word: Word!

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.register(WordInfoCell.self, forCellWithReuseIdentifier: WordInfoCell.identifier)
        
        vc.dataSource = self
        vc.delegate = self
        vc.alwaysBounceVertical = true
        
        vc.backgroundColor = .white
        
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = word.name
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}


extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        word.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordInfoCell.identifier, for: indexPath)
        
        if let cell = cell as? WordInfoCell {
            cell.updateWithWordInfo(word.items[indexPath.item])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
