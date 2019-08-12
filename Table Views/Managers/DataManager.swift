//
//  DataManager.swift
//  Table Views
//
//  Created by Ayu Filippova on 06/08/2019.
//  Copyright © 2019 Dmitry Filippov. All rights reserved.
//

import Foundation

class DataManager {
    /* создали переменную archiveURL и в нее скопировали нужный код, который до этого писали в функции loadEmojis()
    для того, чтобы эту переменную можно было еще использовать далее в других функциях
     */
    var archiveURL: URL? {
        // задаем путь к папке (documentDirectory - это имя папки)
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        // задаем имя файла в данной папке
        return documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    }
    
    func loadEmojis() -> [Emoji]? {
        // указываем путь к файлу
        guard let archiveURL = archiveURL else { return nil }
        
        /* далее считываем данные из этого файла при помощи конструктора Data(contents of: URL)
        тк он выбрасывающий то ставим перед ним try?
         */
        guard let encodedEmojis = try? Data(contentsOf: archiveURL) else { return nil }
        
        // добавили в эту функцию код о Decoder'е из вьюконтроллера EmojiTableViewController из функции viewDidLoad()
        let decoder = PropertyListDecoder()
        return try? decoder.decode([Emoji].self, from: encodedEmojis)
    }
    
    // создали эту функцию и перенесли сюда код об Encoder'е из вьюконтроллера EmojiTableViewController из функции viewDidLoad()
    func saveEmojis(_ emojis: [Emoji]) {
            // позже закодируем информацию, но сначала запишем ее по какому-то адресу - то есть по archiveURL
        guard let archiveURL = archiveURL else { return }
       
        let encoder = PropertyListEncoder()
        guard let encodedEmojis = try? encoder.encode(emojis) else { return }
        
        
        // выбираем функцию write с опциями, тк по умолчанию файл создается с защитой от записи, а нужно будет этот файл перезаписывать (.noFileProtection)
        try? encodedEmojis.write(to: archiveURL, options: .noFileProtection)
    }
}
