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
        let configuration = PSImageViewConfig(
            identifier: element.identifier,
            image: Image(element.properties.title),
            contentMode: .fill,
            size: CGSize(
                width: element.properties.size.width,
                height: element.properties.size.height
            )
        )
        let imageView = PSImageView(configuration: configuration)
        return imageView
    }
}
