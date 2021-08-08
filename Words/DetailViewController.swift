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
        let h = word.items[indexPath.item].showText.heightForMaxWidth(screenWidth - WordInfoCell.edge*2, font: WordInfoCell.font)
        return CGSize(width: screenWidth, height: h + 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension String {
    
    /// 计算给定具体宽度文字的最大高度
    /// - Parameters:
    ///   - width: 最大宽度
    ///   - font: 字体
    /// - Returns: 字体总高度
    func heightForMaxWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constrainedSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: font]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds = (self as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        return ceil(bounds.height)
    }
    
}
