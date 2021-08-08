//
//  WordsManager.swift
//  Words
//
//  Created by Z on 2021/8/8.
//

import UIKit

class WordsManager {
    
    static let shared = WordsManager()
    private init() {}
    
    func items() -> [DateWords] {
        var data: [DateWords] = []
        
        data.append(createWords(date: "2021/08/07", words: [dur, holic, alt, pany]))
        data.append(createWords(date: "2021/08/08", words: [dol, migr, tangle, fla, umb, err, deb, am, staff, fran, ploy, jelly, ole, ee, conq, bhor, haus, doc, awe, er, can, viro, rar, dim]))
        
        return data
    }

    private var id = 1
    
    private func createWords(date: String, words: [Word]) -> DateWords {
        DateWords(date: DateHeader(date: date), words: words)
    }
    
    // MARK: - words
        
    private lazy var dur: Word = {
        id += 1
        var word = Word(id: id, name: "dur", pronounce: "英 /ˈdjʊ/  美 /ˈdʊr/", cn: "持久")
        word.items.append(WordInfo(id: id, name: "durable", pronounce: "英 /ˈdjʊərəbl/  美 /ˈdʊrəbl/", type: "adj", meaning: "持久的"))
        return word
    }()
    
    private lazy var holic: Word = {
        id += 1
        var word = Word(id: id, name: "holic", pronounce: "英 /hɒlɪk/  美 /hɑːlɪk/", cn: "好喜欢")
        word.items.append(WordInfo(id: id, name: "alcoholic", pronounce: "英 /ˌælkəˈhɒlɪk/  美 /ˌælkəˈhɑːlɪk/", type: "n", meaning: "嗜酒如命的人 嗜酒者"))
        return word
    }()

    private lazy var alt: Word = {
        id += 1
        var word = Word(id: id, name: "alt", pronounce: "英 /ˈɔːlt/  美 /ˈɔːlt/", cn: "高，变")
        word.items.append(WordInfo(id: id, name: "alterable", pronounce: "英 /ˈɔːltərəbl/  美 /ˈɔːltərəbl/", type: "adj", meaning: "可以改变的"))
        return word
    }()

    private lazy var pany: Word = {
        id += 1
        var word = Word(id: id, name: "pany", pronounce: "英 /pəni/  美 /pəni/", cn: "陪你")
        word.items.append(WordInfo(id: id, name: "company", pronounce: "英 /ˈkʌmpəni/  美 /ˈkʌmpəni/", type: "n", meaning: "同伴"))
        return word
    }()

    private lazy var dol: Word = {
        id += 1
        var word = Word(id: id, name: "dol", pronounce: "英 /dəʊl/  美 /doʊl/", cn: "哀悼")
        word.items.append(WordInfo(id: id, name: "condole", pronounce: "英 /kən'dəʊl/  美 /kənˈdoʊl/", type: "n", meaning: "哀悼 吊唁"))
        return word
    }()
    
    private lazy var migr: Word = {
        id += 1
        var word = Word(id: id, name: "migr", pronounce: "英 /maɪˈɡ/  美 /maɪˈɡ/", cn: "跨境 移民 迁徙")
        word.items.append(WordInfo(id: id, name: "migration", pronounce: "英 /maɪˈɡreɪʃn/  美 /maɪˈɡreɪʃn/", type: "n", meaning: "迁移 迁徙 移居 移民 "))
        return word
    }()

    private lazy var tangle: Word = {
        id += 1
        var word = Word(id: id, name: "tangle", pronounce: "英 /ˈtæŋɡl/  美 /ˈtæŋɡl/", cn: "纠缠")
        word.items.append(WordInfo(id: id, name: "tangle", pronounce: "英 /ˈtæŋɡl/  美 /ˈtæŋɡl/", type: "n", meaning: "纠缠"))
        return word
    }()

    private lazy var fla: Word = {
        id += 1
        var word = Word(id: id, name: "fla", pronounce: "英 /fle/  美 /fle/", cn: "吹气")
        word.items.append(WordInfo(id: id, name: "inflate", pronounce: "英 /ɪnˈfleɪt/  美 /ɪnˈfleɪt/", type: "v", meaning: "使充气 使膨胀"))
        return word
    }()

    private lazy var umb: Word = {
        id += 1
        var word = Word(id: id, name: "umb", pronounce: "英 /ˈʌmb/  美 /ˈʌmb/", cn: "暗部")
        word.items.append(WordInfo(id: id, name: "umbra", pronounce: "英 /ˈʌmbrə/  美 /ˈʌmbrə/", type: "n", meaning: "阴影"))
        return word
    }()

    private lazy var err: Word = {
        id += 1
        var word = Word(id: id, name: "err", pronounce: "英 /ɜː(r)/  美 /er/", cn: "错误")
        word.items.append(WordInfo(id: id, name: "error", pronounce: "英 /ˈerə(r)/  美 /ˈerər/", type: "n", meaning: "错误 差错"))
        return word
    }()

    private lazy var deb: Word = {
        id += 1
        var word = Word(id: id, name: "deb", pronounce: "英 /de/  美 /de/", cn: "贷币")
        word.items.append(WordInfo(id: id, name: "debt", pronounce: "英 /det/  美 /det/", type: "n", meaning: "借款"))
        return word
    }()

    private lazy var am: Word = {
        id += 1
        var word = Word(id: id, name: "am", pronounce: "英 /əˈm/  美 /əˈm/", cn: "爱慕")
        word.items.append(WordInfo(id: id, name: "amour", pronounce: "英 /əˈmʊə(r)/  美 /əˈmʊr/", type: "n", meaning: "爱慕 恋情"))
        return word
    }()
    
    private lazy var staff: Word = {
        id += 1
        var word = Word(id: id, name: "staff", pronounce: "英 /stɑːf/  美 /stæf/", cn: "职员")
        word.items.append(WordInfo(id: id, name: "staff", pronounce: "英 /stɑːf/  美 /stæf/", type: "n", meaning: "员工 职员 参谋"))
        return word
    }()

    private lazy var fran: Word = {
        id += 1
        var word = Word(id: id, name: "fran", pronounce: "英 /ˈfren/  美 /ˈfren/", cn: "怫然 怫然大怒 & 怫然怒")
        word.items.append(WordInfo(id: id, name: "frenzy", pronounce: "英 /ˈfrenzi/  美 /ˈfrenzi/", type: "n", meaning: "怫然大怒 狂暴 狂怒"))
        return word
    }()

    private lazy var ploy: Word = {
        id += 1
        var word = Word(id: id, name: "ploy", pronounce: "英 /plɔɪiː/  美 /plɔɪiː/", cn: "剥削 奴役")
        word.items.append(WordInfo(id: id, name: "employee", pronounce: "英 /ɪmˈplɔɪiː/  美 /ɪmˈplɔɪiː/", type: "n", meaning: "雇员 员工"))
        return word
    }()

    private lazy var jelly: Word = {
        id += 1
        var word = Word(id: id, name: "jelly", pronounce: "英 /ˈdʒeli/  美 /ˈdʒeli/", cn: "胶状的东西")
        word.items.append(WordInfo(id: id, name: "jel", pronounce: "英 /dʒel/  美 /dʒel/", type: "n", meaning: "胶体 凝胶"))
        return word
    }()

    private lazy var ole: Word = {
        id += 1
        var word = Word(id: id, name: "ole", pronounce: "英 /əʊ'l/  美 /'ol/", cn: "油")
        word.items.append(WordInfo(id: id, name: "oleic", pronounce: "英 /əʊ'liːk/  美 /'olɪk/", type: "adj", meaning: "油的"))
        return word
    }()

    private lazy var ee: Word = {
        id += 1
        var word = Word(id: id, name: "ee", pronounce: "英 /iː/  美 /iː/", cn: "被动者 被xx者")
        word.items.append(WordInfo(id: id, name: "employee", pronounce: "英 /ɪmˈplɔɪiː/  美 /ɪmˈplɔɪiː/", type: "n", meaning: "雇员 员工"))
        return word
    }()

    private lazy var conq: Word = {
        id += 1
        var word = Word(id: id, name: "conq", pronounce: "英 /ˈkɒŋk/  美 /ˈkɑːŋk/", cn: "战胜 攻克")
        word.items.append(WordInfo(id: id, name: "conquer", pronounce: "英 /ˈkɒŋkə(r)/  美 /ˈkɑːŋkər/", type: "n", meaning: "战胜 攻克"))
        return word
    }()

    private lazy var bhor: Word = {
        id += 1
        var word = Word(id: id, name: "bhor", pronounce: "英 /hɔː(r)/  美 /hɔːr/", cn: "不喜欢 讨厌 厌恶")
        word.items.append(WordInfo(id: id, name: "abhor", pronounce: "英 /əbˈhɔː(r)/  美 /əbˈhɔːr/", type: "v", meaning: "不喜欢 讨厌 厌恶 "))
        return word
    }()

    private lazy var haus: Word = {
        id += 1
        var word = Word(id: id, name: "haus", pronounce: "英 /ɔːs/  美 /ɔːs/", cn: "耗尽 耗光")
        word.items.append(WordInfo(id: id, name: "exhaust", pronounce: "英 /ɪɡˈzɔːst/  美 /ɪɡˈzɔːst/", type: "v", meaning: "使耗尽"))
        return word
    }()

    private lazy var doc: Word = {
        id += 1
        var word = Word(id: id, name: "doc", pronounce: "英 /ˈdəʊk/  美 /ˈdoʊk/", cn: "教")
        word.items.append(WordInfo(id: id, name: "docent", pronounce: "英 /ˈdəʊsnt/  美 /ˈdoʊsnt/", type: "n", meaning: "讲师"))
        return word
    }()

    private lazy var awe: Word = {
        id += 1
        var word = Word(id: id, name: "awe", pronounce: "英 /ɔː/  美 /ɔː/", cn: "恐惧 害怕")
        word.items.append(WordInfo(id: id, name: "awed", pronounce: "英 /ɔːd/  美 /ɔːd/", type: "adj", meaning: "畏怯的 敬畏的"))
        return word
    }()

    private lazy var er: Word = {
        id += 1
        var word = Word(id: id, name: "-er", pronounce: "英 /ər/  美 /ər/", cn: "xx的人 xx的东西")
        word.items.append(WordInfo(id: id, name: "teacher", pronounce: "英 /ˈtiːtʃər/  美 /ˈtiːtʃər/", type: "n", meaning: "教师"))
        return word
    }()

    private lazy var can: Word = {
        id += 1
        var word = Word(id: id, name: "can", pronounce: "英 /kæn/  美 /kæn/", cn: "可以 能够")
        word.items.append(WordInfo(id: id, name: "can", pronounce: "英 /kæn/  美 /kæn/", type: "n", meaning: "可以 能够"))
        return word
    }()

    private lazy var viro: Word = {
        id += 1
        var word = Word(id: id, name: "viro", pronounce: "英 /vaɪrə; en-/  美 /vaɪrə/", cn: "围绕")
        word.items.append(WordInfo(id: id, name: "environ", pronounce: "英 /ɪn'vaɪrən; en-/  美 /ɪn'vaɪrən/", type: "n", meaning: "围绕 周围"))
        word.items.append(WordInfo(id: id, name: "environment", pronounce: "英 /ɪnˈvaɪrənmənt/  美 /ɪnˈvaɪrənmənt/", type: "n", meaning: "围绕 周围 环境"))

        return word
    }()

    private lazy var rar: Word = {
        id += 1
        var word = Word(id: id, name: "rar", pronounce: "英 /re/  美 /re/", cn: "少")
        word.items.append(WordInfo(id: id, name: "rare", pronounce: "英 /reə(r)/  美 /rer/", type: "adj", meaning: "少的 稀少的 少见的 少有的"))
        return word
    }()
    
    private lazy var dim: Word = {
        id += 1
        var word = Word(id: id, name: "dim", pronounce: "英 /dɪm/  美 /dɪm/", cn: "低暮")
        word.items.append(WordInfo(id: id, name: "dim", pronounce: "英 /dɪm/  美 /dɪm/", type: "adj", meaning: "昏暗的 光线黯淡的"))
        return word
    }()


    // 2021/08/08  dol - dim
    


}
