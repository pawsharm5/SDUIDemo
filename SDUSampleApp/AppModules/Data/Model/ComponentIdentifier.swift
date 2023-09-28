//
//  File.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation

enum ComponentIdentifier: String, Decodable {
    case usernameTextField = "username_text_field"
    case passwordTextField = "password_text_field"
    case forgotPasswordButton = "forgot_password_button"
    case none = ""
    case continueButton = "continue_button"
    case previousButton = "previous_button"

}
