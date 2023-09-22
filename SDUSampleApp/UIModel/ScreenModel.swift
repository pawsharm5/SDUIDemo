//
//  OnBoardingModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 20/09/23.
//

import Foundation
// MARK: - ScreenModel
struct ScreenModel: Codable {
    var screenIdentifier: String?
    var padding: Padding?
    var body: Body

    enum CodingKeys: String, CodingKey {
        case screenIdentifier = "screen_identifier"
        case padding, body
    }
}

// MARK: - Body
struct Body: Codable {
    var identifier: String?
    var subviews: [BodyField]?
}

// MARK: - BodyField
struct BodyField: Codable {
    var type, identifier: String?
    var subviews: [ChildField]?
}

// MARK: - FieldField
struct ChildField: Codable {
    var type: ComponentsType
    var identifier: String?
    var properties: Properties?
}
enum ComponentsType: String, Codable {
    case scrollView
    case textField
    case button
    case label
    case view
    case image
}
// MARK: - Properties
struct Properties: Codable {
    var label, placeHolder: String?
    var mandatory: Bool?
    var accessibility: Accessibility?
    var textFieldType, color: String?
    var padding: Padding?
    var size: Size?
    var title, url: String?
    var action: Action?
    var backgroundColor: String?
}

// MARK: - Accessibility
struct Accessibility: Codable {
    var label, identifier: String?
}

// MARK: - Action
struct Action: Codable {
    var type, destination, navigationType: String?
}

// MARK: - Padding
struct Padding: Codable {
    var top, paddingLeft, paddingRight, bottom: Int?

    enum CodingKeys: String, CodingKey {
        case top
        case paddingLeft = "left"
        case paddingRight = "right"
        case bottom
    }
}

// MARK: - Size
struct Size: Codable {
    var height, width: Int?
}
