//
//  ImageViewController.swift
//  Words
//
//  Created by dq on 2021/9/2.
//

import UIKit

class ImageViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let image = UIImage(named: "jack1")!
    var imageSize: CGSize {
        CGSize(width: image.size.width/3, height: image.size.height/3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
                
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(UIDevice.navigationBarHeight)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(UIDevice.navigationBarHeight+10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
     
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        scrollView.contentSize = imageSize
    }


}
