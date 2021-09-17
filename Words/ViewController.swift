//
//  ViewController.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit
import AVKit
import RealmSwift

var screenWidth: CGFloat {
    UIScreen.main.bounds.width
}

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth, height: 70)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.register(WordCell.self, forCellWithReuseIdentifier: WordCell.identifier)
        
        vc.dataSource = self
        vc.delegate = self
        vc.alwaysBounceVertical = true
        
        vc.backgroundColor = .white
        
        return vc
    }()

    private var words: Results<Word>!
    private var itemsToken: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Words"
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let localRealm = try! Realm()
        
        try? localRealm.write {
            localRealm.deleteAll()
        }
        
        words = localRealm.objects(Word.self).sorted(byKeyPath: "id")
                
        itemsToken = words.observe { (changes) in
            switch changes {
            case .initial: break
            // Results are now populated and can be accessed without blocking the UI
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed.
                print("Deleted indices: ", deletions)
                print("Inserted indices: ", insertions)
                print("Modified modifications: ", modifications)
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }

        print("words.count = \(words.count)")
        if words.isEmpty {
            try? localRealm.write {
                localRealm.add(WordsManager.shared.items())
            }
        }
    }

}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordCell.identifier, for: indexPath)
        
        if let cell = cell as? WordCell {
            let word = words[indexPath.item]
            cell.updateWithWord(word)
        }
        
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ImageViewController(word: words[indexPath.item])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
