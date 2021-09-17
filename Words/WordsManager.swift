//
//  WordsManager.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit
import RealmSwift

class Word: Object {
    
    @objc dynamic var id: Int = 0
    
    // 词根
    @objc dynamic var name: String = ""
    
    // 单词例子
    @objc dynamic var word: String = ""
    
    // 词根的原始意思
    @objc dynamic var original: String = ""
    
    // 辅助记忆的图片或者gif
    @objc dynamic var resource: String? = nil
    
    // 词根的组成（拆解说明）或者来源
    @objc dynamic var made: String? = nil
    
    // 单词图片
    @objc dynamic var imageName: String = ""
    
    // 是否记住
    @objc dynamic var success = false
    
    var images: String {
        if imageName.isEmpty {
            return name
        } else {
            return imageName
        }
    }
    
    convenience init(id: Int, name: String, word: String, original: String, resource: String?, made: String?, imageName: String, success: Bool) {
        self.init()
        
        self.id = id
        self.name = name
        self.word = word
        self.original = original
        self.resource = resource
        self.made = made
        self.imageName = imageName
        self.success = success
    }
    
}

class WordsManager {
    
    static let shared = WordsManager()
    private init() {}
    
    func items() -> [Word] {
        [dur, holic, alt, pany, dol, migr, tangle, fla, umb, err,
         deb, am, staff, fran, ploy, jelly, ole, ee, conq, bhor,
         haus, doc, awe, er, can, viro, rar, dim, bi]
    }
    
    private var id = 1
    private func createWord(name: String, word: String, original: String, resource: String?, made: String?, imageName: String = "") -> Word {
        id += 1
        return Word(id: id, name: name, word: word, original: original, resource: resource, made: made, imageName: imageName, success: false)
    }
    
    // MARK: - words
    
    private lazy var dur: Word = {
        return createWord(name: "dur", word: "durex", original: "持久", resource: "dur_r", made: nil)
    }()
    
    private lazy var holic: Word = {
        return createWord(name: "holic", word: "alcoholic", original: "好喜欢", resource: "holic_gif", made: nil)
    }()

    private lazy var alt: Word = {
        return createWord(name: "alt", word: "alterable", original: "高，变", resource: nil, made: nil)
    }()

    private lazy var pany: Word = {
        return createWord(name: "pany", word: "company", original: "陪你", resource: "pany_r", made: nil)
    }()

    private lazy var dol: Word = {
        return createWord(name: "dol", word: "condole", original: "悼", resource: "dol_r", made: nil)
    }()
    
    private lazy var migr: Word = {
        return createWord(name: "migr", word: "migration", original: "迁徙", resource: "migr_r", made: nil)
    }()

    private lazy var tangle: Word = {
        return createWord(name: "tangle", word: "tangle", original: "纠缠", resource: "tangle_gif", made: nil)
    }()

    private lazy var fla: Word = {
        return createWord(name: "fla", word: "inflate", original: "吹气", resource: "fla_r", made: nil)
    }()

    private lazy var umb: Word = {
        return createWord(name: "umb", word: "umbra", original: "暗部", resource: "umb_r", made: nil)
    }()

    private lazy var err: Word = {
        return createWord(name: "err", word: "error", original: "错误", resource: "err_r", made: nil)
    }()

    private lazy var deb: Word = {
        return createWord(name: "deb", word: "debt", original: "original", resource: "resource", made: nil)
    }()

    private lazy var am: Word = {
        return createWord(name: "am", word: "amour", original: "original", resource: "resource", made: nil)
    }()
    
    private lazy var staff: Word = {
        return createWord(name: "staff", word: "staff", original: "original", resource: "resource", made: nil)
    }()

    private lazy var fran: Word = {
        return createWord(name: "fran", word: "frenzy", original: "original", resource: "resource", made: nil)
    }()

    private lazy var ploy: Word = {
        return createWord(name: "ploy", word: "employee", original: "original", resource: "resource", made: nil)
    }()

    private lazy var jelly: Word = {
        return createWord(name: "jelly", word: "jel", original: "original", resource: "resource", made: nil)
    }()

    private lazy var ole: Word = {
        return createWord(name: "ole", word: "oleic", original: "original", resource: "resource", made: nil)
    }()

    private lazy var ee: Word = {
        return createWord(name: "ee", word: "employee", original: "original", resource: "resource", made: nil)
    }()

    private lazy var conq: Word = {
        return createWord(name: "conq", word: "conquer", original: "original", resource: "resource", made: nil)
    }()

    private lazy var bhor: Word = {
        return createWord(name: "bhor", word: "abhor", original: "original", resource: "resource", made: nil)
    }()

    private lazy var haus: Word = {
        return createWord(name: "haus", word: "exhaust", original: "original", resource: "resource", made: nil)
    }()

    private lazy var doc: Word = {
        return createWord(name: "doc", word: "docent", original: "original", resource: "resource", made: nil)
    }()

    private lazy var awe: Word = {
        return createWord(name: "awe", word: "awed", original: "original", resource: "resource", made: nil)
    }()

    private lazy var er: Word = {
        return createWord(name: "-er", word: "teacher", original: "original", resource: "resource", made: nil)
    }()

    private lazy var can: Word = {
        return createWord(name: "can", word: "can", original: "original", resource: "resource", made: nil)
    }()

    private lazy var viro: Word = {
        return createWord(name: "viro", word: "environment", original: "original", resource: "resource", made: nil)
    }()

    private lazy var rar: Word = {
        return createWord(name: "rar", word: "rare", original: "original", resource: "resource", made: nil)
    }()
    
    private lazy var dim: Word = {
        return createWord(name: "dim", word: "dim", original: "original", resource: "resource", made: nil)
    }()

    private lazy var bi: Word = {
        return createWord(name: "bi", word: "biology", original: "original", resource: "resource", made: nil)
    }()
}
