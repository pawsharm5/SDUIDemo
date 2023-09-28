//
//  PSImageView.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 22/09/23.
//

import Foundation
import SwiftUI

protocol PSImageViewConfigurable {
    var identifier: String { get }
    var image: Image { get }
    var contentMode: ContentMode { get }
    var size: CGSize { get }
    // Add more configuration options as needed
}

struct PSImageView: View {
    let configuration: PSImageViewConfigurable
    
    var body: some View {
        configuration.image
            .resizable()
            .aspectRatio(contentMode: configuration.contentMode)
            .frame(width: configuration.size.width, height: configuration.size.height)
            .padding()
    }
}

struct PSImageViewConfig: PSImageViewConfigurable {
    var identifier: String
    var image: Image
    var contentMode: ContentMode
    var size: CGSize
}
