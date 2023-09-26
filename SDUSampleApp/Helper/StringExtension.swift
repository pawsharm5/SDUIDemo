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

extension String {
    func getAligment() -> TextAlignment {
        switch self {
        case "right":
            return .trailing
        default:
            return .leading
        }
    }
    
    func getViewAligment() -> Alignment {
        switch self {
        case "right":
            return .trailing
        default:
            return .leading
        }
    }
}
