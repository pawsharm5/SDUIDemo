//
//  OnBoardingModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 20/09/23.
//

import Foundation
// MARK: - ScreenModel
struct ScreenModel: Decodable {
    var screenIdentifier: String?
    var padding: Padding?
    var body: Body?

    enum CodingKeys: String, CodingKey {
        case screenIdentifier = "screen_identifier"
        case padding, body
    }
}

// MARK: - Body
struct Body: Decodable {
    var type, identifier: String?
    var fields: [Field]?
}

struct Padding: Decodable {
    var left, right, top, bottom: Int?
}

// MARK: - Field
struct Field: Decodable {
    var type: ComponentsType?
    var identifierV: ComponentIdentifier
    var properties: Properties?
    
    enum CodingKeys: String, CodingKey {
        case type
        case identifierV = "identifier"
        case properties
    }
}

enum ComponentsType: String, Decodable {
    case textField
    case button
    case label
}

// MARK: - Properties
struct Properties: Decodable {
    var label, placeHolder: String?
    var mandatory: Bool?
    var accessibility: Accessibility?
    var allowedRegex, textFieldType: String?
    var validation: Validation?
    var title, url: String?
    var action: Action?
    var color: String?
    var backgroundColor: String?
    var padding: Padding?
    var size: Size?
    
    enum CodingKeys: String, CodingKey {
        case label, placeHolder, mandatory, accessibility
        case allowedRegex = "allowed_regex"
        case textFieldType, validation, title, url, action
        case color
        case backgroundColor
        case padding
        case size
    }
}

// MARK: - Accessibility
struct Accessibility: Decodable {
    var label, identifier: String?
}

// MARK: - Action
struct Action: Decodable {
    var type, destination, navigationType: String?
}

// MARK: - Validation
struct Validation: Decodable {
    var max, min: Max?
    var regex: String?
}

// MARK: - Max
struct Max: Decodable {
    var value: Int?
    var message: String?
}

// MARK: - Size
struct Size: Decodable {
    var height: Int?
    var witdh: Int?
}
