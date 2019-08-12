//
//  Emoji.swift
//  Table Views
//
//  Created by Ayu Filippova on 02/08/2019.
//  Copyright © 2019 Dmitry Filippov. All rights reserved.
//

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String

    init(symbol: String = "", name: String = "", description: String = "", usage: String = "") {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}


extension Emoji {
    static var all: [Emoji] {
        return [
            Emoji(symbol: "⭐️", name: "Звезда", description: "Желтая пятиконечная звезда", usage: "Когда что-то нравится"),
            Emoji(symbol: "🐶", name: "Собака", description: "Мордочка собаки", usage: "Что-то дружелюбное"),
            Emoji(symbol: "✅", name: "Галочка", description: "Галочка на зеленом фоне", usage: "Дела сделаны"),
            Emoji(symbol: "⛔️", name: "Стоп", description: "Знак «Стоп»", usage: "Проезд запрещен")
        ]
    }

    /* эту функцию убрали, тк создали функцию в классе DataManager
    static func loadAll() -> [Emoji]? {
        return nil
    }
    */
    static func loadDefaults() -> [Emoji] {
        return all
    }
}
