//
//  PSHStackViewBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 26/09/23.
//

import Foundation
import SwiftUI
struct PSHStackViewBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSHStackView
    let viewModel: LaunchViewModelProtocol
    
    init(viewModel: LaunchViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    @MainActor
    func build(element: SubView) -> PSHStackView {
        PSHStackView(
            configuration: PSHStackViewConfiguration(
                content: {
                    ForEach(element.subviews ?? [], id: \.identifier) { field in
                        PSScreenBuilder(viewModel: viewModel).createComponentView(field)
                    }
                },
                backgroundColor: element.properties.backgroundColor, 
                spacing: CGFloat(element.properties.spacing)
            )
        )
    }
}

