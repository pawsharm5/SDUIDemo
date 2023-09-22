//
//  PSTextFieldBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

class TextFieldObjerver: ObservableObject{
    @Published var username = ""
}

struct PSTextFieldBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSTextField
    

   // @Published private var textValue: String = ""

    func build(element: SubView) -> PSTextField {
        let configuration = PSTextFieldConfig(text: .constant(""), keyboardType: .asciiCapable, placeHolder: element.properties?.placeHolder ?? "", height: element.properties?.size?.height ?? 0, backgroundColor: element.properties?.backgroundColor ?? "")
        let customTextField = PSTextField(configuration: configuration)
        return customTextField
    }
}
