//
//  ImageViewController.swift
//  Words
//
//  Created by dq on 2021/9/2.
//

import UIKit

class ImageViewController: UIViewController {
    
    init(word: Word) {
        self.word = word
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let word: Word
    private var images: [String] = []
    
    private var imageWidth: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 500
        }
        return UIDevice.screenWidth - 20
    }
    
    private var gap: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 50
        }
        return 50
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = word.name
        view.backgroundColor = .white
        images = [word.images]

        configureImages()
    }
    
    private func configureImages() {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: UIDevice.navigationBarHeight, left: 0, bottom: 0, right: 0))
        }
        
        var contentHeight: CGFloat = 0
        var beginY: CGFloat = gap
        
        for i in 0..<images.count {
            let name = images[i]
            print("name = [\(name)]")
            let image = UIImage(named: name)!
            let frame = CGRect(x: (UIDevice.screenWidth-imageWidth)/2, y: beginY, width: imageWidth, height: imageWidth * image.size.height/image.size.width)

            let layer = CALayer()
            layer.frame = frame
            layer.contents = image.cgImage
            scrollView.layer.addSublayer(layer)
            
            contentHeight = frame.maxY
            beginY = contentHeight + gap
        }
        contentHeight += gap
        
        scrollView.contentSize = CGSize(width: imageWidth, height: contentHeight)
    }
     
}
