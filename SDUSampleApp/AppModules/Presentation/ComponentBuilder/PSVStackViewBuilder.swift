//
//  PSVStackViewBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 26/09/23.
//

import Foundation
import SwiftUI
struct PSVStackViewBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSVStackView
    let viewModel: BaseViewModel
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
    }
    @MainActor
    func build(element: SubView) -> PSVStackView {
        PSVStackView(configuration: PSVStackViewConfiguration(content: {
            ForEach(element.subviews ?? [], id: \.identifier) { field in
                PSScreenBuilder(viewModel: viewModel).createComponentView(field)
            }
        }, backgroundColor: element.properties?.backgroundColor ?? "#FFFFFF"))
    }
}
