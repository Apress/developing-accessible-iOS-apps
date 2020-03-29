//
//  String+LoremIpsum.swift
//  DevelopingAccessibleApps
//
//  Created by Dani Devesa on 30/06/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import Foundation

extension String {
    enum PlaceholderStringLength {
        case short
        case long
    }

    static func loremImpsum(withLength length: PlaceholderStringLength = .short) -> String {
        let loremIpsum = "Lorem ipsum dolor amet dreamcatcher occupy esse occaecat snackwave. " +
            "Eiusmod raw denim put a bird on it yuccie fam yr cold-pressed palo santo aliquip " +
            "you probably haven't heard of them meh truffaut."

        switch length {
        case .short: return String(loremIpsum.prefix(67))
        case .long: return loremIpsum
        }
    }
}
