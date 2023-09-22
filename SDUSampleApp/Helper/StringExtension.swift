//
//  StringExtension.swift
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation
import SwiftUI
extension Optional where Wrapped == String {
    func valuOrEmpty() -> String {
        return self ?? ""
    }
}

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
