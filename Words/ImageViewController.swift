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

        images = word.images.components(separatedBy: ",")

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
        
        if let resource = word.resource {
            let image: UIImage
            if resource.hasSuffix("_gif") {
                image = UIImage.gifImageWithName(name: resource)!
            } else {
                image = UIImage(named: resource)!
            }
            let frame = CGRect(x: (UIDevice.screenWidth-imageWidth)/2, y: beginY, width: imageWidth, height: imageWidth * image.size.height/image.size.width)
            
            if resource.hasSuffix("_gif") {
                let imageView = UIImageView()
                imageView.frame = frame
                imageView.image = image
                scrollView.addSubview(imageView)
            } else {
                let layer = CALayer()
                layer.frame = frame
                layer.contents = image.cgImage
                scrollView.layer.addSublayer(layer)
            }

            contentHeight = frame.maxY
            beginY = contentHeight + gap
        }
        
        if let made = word.made {
            let frame = CGRect(x: (UIDevice.screenWidth-imageWidth)/2, y: beginY, width: imageWidth, height: 30)
            let label = UILabel(frame: frame)
            label.textAlignment = .center
            label.text = made
            
            scrollView.addSubview(label)
            
            contentHeight = frame.maxY
            beginY = contentHeight + gap
        }
        
        for i in 0..<images.count {
            let name = images[i]
//            print("name = [\(name)]")
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

extension UIImageView {
    static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
              let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
}

extension UIImage {
    
    public class func gifImageWithData(data: NSData) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data, nil) else {
            print("image doesn't exist")
            return nil
        }
        
        return UIImage.animatedImageWithSource(source: source)
    }
    
    public class func gifImageWithURL(gifUrl:String) -> UIImage? {
        guard let bundleURL = NSURL(string: gifUrl)
        else {
            print("image named \"\(gifUrl)\" doesn't exist")
            return nil
        }
        guard let imageData = NSData(contentsOf: bundleURL as URL) else {
            print("image named \"\(gifUrl)\" into NSData")
            return nil
        }
        
        return gifImageWithData(data: imageData)
    }
    
    public class func gifImageWithName(name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
                .url(forResource: name, withExtension: "gif") else {
            print("SwiftGif: This image named \"\(name)\" does not exist")
            return nil
        }
        
        guard let imageData = NSData(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        
        return gifImageWithData(data: imageData)
    }
    
    class func delayForImageAtIndex(index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionary = unsafeBitCast(CFDictionaryGetValue(cfProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()), to: CFDictionary.self)
        
        var delayObject: AnyObject = unsafeBitCast(CFDictionaryGetValue(gifProperties, Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()), to: AnyObject.self)
        
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        
        delay = delayObject as! Double
        
        if delay < 0.1 {
            delay = 0.1
        }
        
        return delay
    }
    
    class func gcdForPair(a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        if a! < b! {
            let c = a!
            a = b!
            b = c
        }
        
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b!
            } else {
                a = b!
                b = rest
            }
        }
    }
    
    class func gcdForArray(array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(a: val, gcd)
        }
        
        return gcd
    }
    
    class func animatedImageWithSource(source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()
        
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            let delaySeconds = UIImage.delayForImageAtIndex(index: Int(i), source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
        }()
        
        let gcd = gcdForArray(array: delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(cgImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        let animation = UIImage.animatedImage(with: frames, duration: Double(duration) / 1000.0)
        
        return animation
    }
}
