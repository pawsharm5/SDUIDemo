//
//  ScreenModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 20/09/23.
//

import Foundation
// MARK: - ScreenModel
struct ScreenModel: Decodable {
    var screenIdentifier: String?
    var padding: Padding?
    var body: Body

    enum CodingKeys: String, CodingKey {
        case screenIdentifier = "screen_identifier"
        case padding, body
    }
}

// MARK: - Body
struct Body: Decodable {
    var identifier: String?
    var subviews: [SubView]?
}

// MARK: - FieldField
struct SubView: Decodable, Identifiable {
    var id: String {
        self.identifier
    }
    var type: ComponentsType
    var identifier: String
    var properties: Properties
    var subviews: [SubView]?

}
enum ComponentsType: String, Decodable {
    case scrollView
    case textField
    case button
    case label
    case view
    case image
    case Segment
    case HStack
    case VStack
    case dropdown
}
// MARK: - Properties
struct Properties: Decodable {
    var placeHolder: String
    var mandatory: Bool
    var accessibility: Accessibility?
    var textFieldType, color: String
    var padding: Padding
    var size: Size
    var title, url: String
    var action: Action?
    var backgroundColor: String
    var cornorRadius:Double
    var fontSize:Int?
    var textAlignment:String
    var borderWidth:Double
    var borderColor:String
    var validation: ValidationRules?
    var options: [String]?
    var isUnderline:Bool
    var isErrorMessage:Bool
    var spacing:Double
    
    enum CodingKeys: String, CodingKey {
            case placeHolder, mandatory, accessibility, textFieldType, color, padding, size, title, url, action, backgroundColor, cornorRadius, fontSize, textAlignment, borderWidth, borderColor, validation, options, isUnderline, isErrorMessage, spacing
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            placeHolder = try container.decodeIfPresent(String.self, forKey: .placeHolder) ?? ""
            mandatory = try container.decodeIfPresent(Bool.self, forKey: .mandatory) ?? false
            accessibility = try container.decodeIfPresent(Accessibility.self, forKey: .accessibility)
            textFieldType = try container.decodeIfPresent(String.self, forKey: .textFieldType) ?? ""
            color = try container.decodeIfPresent(String.self, forKey: .color) ?? "#000000"
            padding = try container.decodeIfPresent(Padding.self, forKey: .padding) ?? Padding(from: decoder)
            size = try container.decodeIfPresent(Size.self, forKey: .size) ?? Size(from: decoder)
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
            action = try container.decodeIfPresent(Action.self, forKey: .action)
            backgroundColor = try container.decodeIfPresent(String.self, forKey: .backgroundColor) ?? "#FFFFFF"
            cornorRadius = try container.decodeIfPresent(Double.self, forKey: .cornorRadius) ?? 0.0
            fontSize = try container.decodeIfPresent(Int.self, forKey: .fontSize)
            textAlignment = try container.decodeIfPresent(String.self, forKey: .textAlignment) ?? "left"
            borderWidth = try container.decodeIfPresent(Double.self, forKey: .borderWidth) ?? 0.0
            borderColor = try container.decodeIfPresent(String.self, forKey: .borderColor) ?? "#FFFFFF"
            validation = try container.decodeIfPresent(ValidationRules.self, forKey: .validation)
            options = try container.decodeIfPresent([String].self, forKey: .options)
            isUnderline = try container.decodeIfPresent(Bool.self, forKey: .isUnderline) ?? false
            isErrorMessage = try container.decodeIfPresent(Bool.self, forKey: .isErrorMessage) ?? false
            spacing = try container.decodeIfPresent(Double.self, forKey: .spacing) ?? 0.0

        }
}

struct ValidationRules: Decodable {
    let max: ValidationRule?
    let min: ValidationRule?
    let regex: String?
}

struct ValidationRule: Decodable {
    let value: Int
    let message: String
}


// MARK: - Accessibility
struct Accessibility: Decodable {
    var label, identifier: String?
}

// MARK: - Action
struct Action: Decodable {
    var type, destination, navigationType: String?
}

// MARK: - Padding
struct Padding: Decodable {
    var top, paddingLeft, paddingRight, bottom: Double

    enum CodingKeys: String, CodingKey {
        case top
        case paddingLeft = "left"
        case paddingRight = "right"
        case bottom
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        top = try container.decodeIfPresent(Double.self, forKey: .top) ?? 0.0
        paddingLeft = try container.decodeIfPresent(Double.self, forKey: .paddingLeft) ?? 0.0
        paddingRight = try container.decodeIfPresent(Double.self, forKey: .paddingRight) ?? 0.0
        bottom = try container.decodeIfPresent(Double.self, forKey: .bottom) ?? 0.0
    }
}

// MARK: - Size
struct Size: Decodable {
    var height, width: Double
    enum CodingKeys: String, CodingKey {
            case height, width
        }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        height = try container.decodeIfPresent(Double.self, forKey: .height) ?? 0.0
        width = try container.decodeIfPresent(Double.self, forKey: .width) ?? 0.0
    }
}
