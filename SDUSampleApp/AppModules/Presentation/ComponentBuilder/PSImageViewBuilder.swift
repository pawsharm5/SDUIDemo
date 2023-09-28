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
            image: Image(element.properties?.title ?? "info"),
            contentMode: .fill,
            size: CGSize(
                width: element.properties?.size?.width ?? 20,
                height: element.properties?.size?.height ?? 20
            )
        )
        let imageView = PSImageView(configuration: configuration)
        return imageView
    }
}
