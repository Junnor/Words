//
//  Helper.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit

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
