//
//  WordsManager.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit


struct Word {
    let id: Int
    let name: String       // 词根
    let word: String       // 单词例子
    let imageName: String  // 单词图片
}

class WordsManager {
    
    static let shared = WordsManager()
    private init() {}
    
    func items() -> [Word] {
        [dur, holic, alt, pany, dol, migr, tangle, fla, umb, err, deb, am, staff, fran, ploy, jelly, ole, ee, conq, bhor, haus, doc, awe, er, can, viro, rar, dim]
    }
    
    private var id = 1
    private func createWord(name: String, word: String, imageName: String = "") -> Word {
        id += 1
        return Word(id: id, name: name, word: word, imageName: imageName)
    }
    
    // MARK: - words
        
    private lazy var dur: Word = {
        return createWord(name: "dur", word: "durex")
    }()
    
    private lazy var holic: Word = {
        return createWord(name: "holic", word: "alcoholic")
    }()

    private lazy var alt: Word = {
        return createWord(name: "alt", word: "alterable")
    }()

    private lazy var pany: Word = {
        return createWord(name: "pany", word: "company")
    }()

    private lazy var dol: Word = {
        return createWord(name: "dol", word: "condole")
    }()
    
    private lazy var migr: Word = {
        return createWord(name: "migr", word: "migration")
    }()

    private lazy var tangle: Word = {
        return createWord(name: "tangle", word: "tangle")
    }()

    private lazy var fla: Word = {
        return createWord(name: "fla", word: "inflate")
    }()

    private lazy var umb: Word = {
        return createWord(name: "umb", word: "umbra")
    }()

    private lazy var err: Word = {
        return createWord(name: "err", word: "error")
    }()

    private lazy var deb: Word = {
        return createWord(name: "deb", word: "debt")
    }()

    private lazy var am: Word = {
        return createWord(name: "am", word: "amour")
    }()
    
    private lazy var staff: Word = {
        return createWord(name: "staff", word: "staff")
    }()

    private lazy var fran: Word = {
        return createWord(name: "fran", word: "frenzy")
    }()

    private lazy var ploy: Word = {
        return createWord(name: "ploy", word: "employee")
    }()

    private lazy var jelly: Word = {
        return createWord(name: "jelly", word: "jel")
    }()

    private lazy var ole: Word = {
        return createWord(name: "ole", word: "oleic")
    }()

    private lazy var ee: Word = {
        return createWord(name: "ee", word: "employee")
    }()

    private lazy var conq: Word = {
        return createWord(name: "conq", word: "conquer")
    }()

    private lazy var bhor: Word = {
        return createWord(name: "bhor", word: "abhor")
    }()

    private lazy var haus: Word = {
        return createWord(name: "haus", word: "exhaust")
    }()

    private lazy var doc: Word = {
        return createWord(name: "doc", word: "docent")
    }()

    private lazy var awe: Word = {
        return createWord(name: "awe", word: "awed")
    }()

    private lazy var er: Word = {
        return createWord(name: "-er", word: "teacher")
    }()

    private lazy var can: Word = {
        return createWord(name: "can", word: "can")
    }()

    private lazy var viro: Word = {
        return createWord(name: "viro", word: "environment")
    }()

    private lazy var rar: Word = {
        return createWord(name: "rar", word: "rare")
    }()
    
    private lazy var dim: Word = {
        return createWord(name: "dim", word: "dim", imageName: "dim")
    }()

}
