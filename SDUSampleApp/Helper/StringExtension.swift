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
        case "center":
            return .center
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
    
    func isValid(validations:ValidationRules?) -> (Bool, String) {
        var errorMessage = ""
        
        let regex = validations?.regex ?? ""
        let minLength = validations?.min?.value
        let maxLength = validations?.max?.value
        
        if self.isEmpty {
            errorMessage = validations?.min?.message ?? ""
            return (false, errorMessage)
        }
        
        // Validate against the regex pattern
        if let regex = try? NSRegularExpression(pattern: regex) {
            let range = NSRange(location: 0, length: self.utf16.count)
            guard regex.firstMatch(in: self, options: [], range: range) != nil else {
                // Check the length constraints
                if let minLength = minLength, self.count < minLength {
                    errorMessage = validations?.min?.message ?? ""
                    return (false, errorMessage) // Input is too short
                }
                if let maxLength = maxLength, self.count > maxLength {
                    errorMessage = validations?.max?.message ?? ""
                    return (false, errorMessage) // Input is too long
                }
                errorMessage = "Error"
                return (false, errorMessage)
            }
        } else {
            errorMessage = "Invalid regex"
            return (false, errorMessage) // Invalid regex pattern
        }
        
        errorMessage = ""
        return (true, errorMessage) // Input is valid
    }
}
