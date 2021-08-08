//
//  ViewController.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit



var screenWidth: CGFloat {
    UIScreen.main.bounds.width
}

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth, height: 70)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionHeadersPinToVisibleBounds = true
        layout.headerReferenceSize = CGSize(width: screenWidth, height: 60)
        
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.register(WordCell.self, forCellWithReuseIdentifier: WordCell.identifier)
        vc.register(DateHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DateHeaderView.identifier)
        
        vc.dataSource = self
        vc.delegate = self
        vc.alwaysBounceVertical = true
        
        vc.backgroundColor = .white
        
        return vc
    }()

    private lazy var dateWords: [DateWords] = WordsManager.shared.items()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Words"
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dateWords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dateWords[section].words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordCell.identifier, for: indexPath)
        
        if let cell = cell as? WordCell {
            let word = dateWords[indexPath.section].words[indexPath.item]
            cell.updateWithWord(word)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DateHeaderView.identifier, for: indexPath)
        if let header = header as? DateHeaderView {
            header.titleLabel.text = dateWords[indexPath.section].date.date
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.word = dateWords[indexPath.section].words[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
