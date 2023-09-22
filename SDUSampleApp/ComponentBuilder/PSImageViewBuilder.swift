//
//  PSImageViewBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 22/09/23.
//

import Foundation
import SwiftUI

struct PSImageViewBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSImageView
    
    func build(element: SubView) -> PSImageView {
        let configuration = PSImageViewConfig(identifier: element.identifier, image: Image(""), contentMode: .fill, size: CGSize(width: 20, height: 20), cornerRadius: 10)
        let imageView = PSImageView(configuration: configuration)
        return imageView
    }
}
