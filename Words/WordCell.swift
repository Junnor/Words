//
//  WordCell.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit

extension UICollectionReusableView {
    
    static var identifier: String {
        String(describing: self)
    }
}

class WordCell: UICollectionViewCell {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private(set) lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        
        let edge: CGFloat = 16
        
        let bottomView = UIView()
        contentView.addSubview(bottomView)
        bottomView.backgroundColor = .systemGray6
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(edge)
            make.centerX.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.leading.equalTo(edge)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWithWord(_ word: Word) {
        titleLabel.text = word.name
        detailLabel.text = "\(word.original) " + word.word
    }
    
}
