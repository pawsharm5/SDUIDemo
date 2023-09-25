//
//  PSView.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 22/09/23.
//

import Foundation
import SwiftUI
protocol PSViewConfigurable {
    var content: AnyView { get }
    var backgroundColor: Color { get }
    // Add any other configuration properties you need
}

struct PSViewConfiguration: PSViewConfigurable {
    
    let content: AnyView
    let backgroundColor: Color

    init<Content: View>(@ViewBuilder content: () -> Content, backgroundColor: Color = .secondary) {
        self.content = AnyView(content())
        self.backgroundColor = backgroundColor
    }
}
struct PSView : View {
    let configuration: PSViewConfiguration
    
    var body: some View {
        VStack(alignment: .leading) {
            configuration.content
        }.background(configuration.backgroundColor)
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
    }
}
