//
//  Words.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import Foundation

struct DateWords {
    let date: DateHeader
    var words: [Word] = []
}

struct DateHeader {
    var date = ""
}

struct Word {
    let id: Int
    let name: String
    let pronounce: String
    let cn: String
    
    var en: String = ""
    var items: [WordInfo] = []
}

struct WordInfo {
    var id: Int
    var name: String
    var pronounce: String
    var type: String
    var meaning: String
}
