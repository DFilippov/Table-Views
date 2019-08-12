//
//  CellManager.swift
//  Table Views
//
//  Created by Ayu Filippova on 02/08/2019.
//  Copyright © 2019 Dmitry Filippov. All rights reserved.
//

import UIKit

class CellManager {
    func configure (_ cell: EmojiCell, with emoji: Emoji) {
        cell.symbolLabel.text = emoji.symbol
        cell.mainLabel.text = emoji.name
        cell.descriptionLabel.text = emoji.description
    }
}
