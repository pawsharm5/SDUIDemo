//
//  PSScrollView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

protocol PSScrollViewConfiguration {
    var content: AnyView { get }
    var showsIndicators: Bool { get }
    // Add any other configuration properties you need
}

struct PSScrollViewConfig: PSScrollViewConfiguration {
    var content: AnyView
    var showsIndicators: Bool
    
    init<Content: View>(@ViewBuilder content: () -> Content, showsIndicators: Bool = true) {
        self.content = AnyView(content())
        self.showsIndicators = showsIndicators
    }
}

struct PSScrollView : View {
    let configuration: PSScrollViewConfig
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                configuration.content
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(0)
        .padding()
        .overlay(
            ScrollViewReader { proxy in
                Color.clear
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(0, anchor: .top)
                        }
                    }
            }
        )
    }
}
