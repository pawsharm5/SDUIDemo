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
    var backgroundColor: String { get }
    // Add any other configuration properties you need
}

struct PSViewConfiguration: PSViewConfigurable {
    
    let content: AnyView
    let backgroundColor: String

    init<Content: View>(@ViewBuilder content: () -> Content, backgroundColor: String) {
        self.content = AnyView(content())
        self.backgroundColor = backgroundColor
    }
}
struct PSView : View {
    let configuration: PSViewConfiguration
    
    var body: some View {
        VStack(alignment: .leading) {
            Color(hex: configuration.backgroundColor)
            configuration.content
        }.background(Color(hex: configuration.backgroundColor))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
    }
}
