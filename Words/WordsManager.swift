//
//  WordsManager.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit


struct Word {
    let id: Int
    let name: String
    let word: String // 单词
    var imageName: String = ""
}

class WordsManager {
    
    static let shared = WordsManager()
    private init() {}
    
    func items() -> [Word] {
        [dur, holic, alt, pany, dol, migr, tangle, fla, umb, err, deb, am, staff, fran, ploy, jelly, ole, ee, conq, bhor, haus, doc, awe, er, can, viro, rar, dim]
    }

    private var id = 1
    
    // MARK: - words
        
    private lazy var dur: Word = {
        id += 1
        return Word(id: id, name: "dur", word: "durex")
    }()
    
    private lazy var holic: Word = {
        id += 1
        return Word(id: id, name: "holic", word: "alcoholic")
    }()

    private lazy var alt: Word = {
        id += 1
        return Word(id: id, name: "alt", word: "alterable")
    }()

    private lazy var pany: Word = {
        id += 1
        return Word(id: id, name: "pany", word: "company")
    }()

    private lazy var dol: Word = {
        id += 1
        return Word(id: id, name: "dol", word: "condole")
    }()
    
    private lazy var migr: Word = {
        id += 1
        return Word(id: id, name: "migr", word: "migration")
    }()

    private lazy var tangle: Word = {
        id += 1
        return Word(id: id, name: "tangle", word: "tangle")
    }()

    private lazy var fla: Word = {
        id += 1
        return Word(id: id, name: "fla", word: "inflate")
    }()

    private lazy var umb: Word = {
        id += 1
        return Word(id: id, name: "umb", word: "umbra")
    }()

    private lazy var err: Word = {
        id += 1
        return Word(id: id, name: "err", word: "error")
    }()

    private lazy var deb: Word = {
        id += 1
        return Word(id: id, name: "deb", word: "debt")
    }()

    private lazy var am: Word = {
        id += 1
        return Word(id: id, name: "am", word: "amour")
    }()
    
    private lazy var staff: Word = {
        id += 1
        return Word(id: id, name: "staff", word: "staff")
    }()

    private lazy var fran: Word = {
        id += 1
        return Word(id: id, name: "fran", word: "frenzy")
    }()

    private lazy var ploy: Word = {
        id += 1
        return Word(id: id, name: "ploy", word: "employee")
    }()

    private lazy var jelly: Word = {
        id += 1
        return Word(id: id, name: "jelly", word: "jel")
    }()

    private lazy var ole: Word = {
        id += 1
        return Word(id: id, name: "ole", word: "oleic")
    }()

    private lazy var ee: Word = {
        id += 1
        return Word(id: id, name: "ee", word: "employee")
    }()

    private lazy var conq: Word = {
        id += 1
        return Word(id: id, name: "conq", word: "conquer")
    }()

    private lazy var bhor: Word = {
        id += 1
        return Word(id: id, name: "bhor", word: "abhor")
    }()

    private lazy var haus: Word = {
        id += 1
        return Word(id: id, name: "haus", word: "exhaust")
    }()

    private lazy var doc: Word = {
        id += 1
        return Word(id: id, name: "doc", word: "docent")
    }()

    private lazy var awe: Word = {
        id += 1
        return Word(id: id, name: "awe", word: "awed")
    }()

    private lazy var er: Word = {
        id += 1
        return Word(id: id, name: "-er", word: "teacher")
    }()

    private lazy var can: Word = {
        id += 1
        return Word(id: id, name: "can", word: "can")
    }()

    private lazy var viro: Word = {
        id += 1
        return Word(id: id, name: "viro", word: "environment")
    }()

    private lazy var rar: Word = {
        id += 1
        return Word(id: id, name: "rar", word: "rare")
    }()
    
    private lazy var dim: Word = {
        id += 1
        return Word(id: id, name: "dim", word: "dim", imageName: "dim")
    }()

}
