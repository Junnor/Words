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


class DateHeaderView: UICollectionReusableView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1)
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        titleLabel.text = "\(word.name)  \(word.cn)"
        detailLabel.text = word.pronounce
    }
    
}

class WordInfoCell: UICollectionViewCell {
    
    static let font = UIFont.systemFont(ofSize: 15, weight: .regular)
    static let edge: CGFloat = 16
    
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
    
    private(set) lazy var meaningLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(meaningLabel)

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
        }
        
        detailLabel.snp.makeConstraints { make in
            make.leading.equalTo(edge)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }

        meaningLabel.snp.makeConstraints { make in
            make.leading.equalTo(edge)
            make.centerX.equalToSuperview()
            make.top.equalTo(detailLabel.snp.bottom).offset(4)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWithWordInfo(_ info: WordInfo) {
        titleLabel.text = info.name
        detailLabel.text = info.pronounce
        meaningLabel.text = "\(info.type). \(info.meaning)"
    }
    
}


