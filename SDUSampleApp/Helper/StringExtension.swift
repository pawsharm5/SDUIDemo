//
//  StringExtension.swift
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation

extension Optional where Wrapped == String {
    func valuOrEmpty() -> String {
        return self ?? ""
    }
}
