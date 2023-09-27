////
////  PSScrollViewBuilder.swift
////  SDUSampleApp
////
////  Created by Pawan Sharma on 22/09/23.
////

import Foundation
import SwiftUI

struct PSScrollViewViewBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSScrollView
    let viewModel: LaunchViewModelProtocol
    
    init(viewModel: LaunchViewModelProtocol) {
        self.viewModel = viewModel
    }
    @MainActor
    func build(element: SubView) -> PSScrollView {
        PSScrollView(configuration: PSScrollViewConfig(content: {
            ForEach(element.subviews ?? [], id: \.identifier) { field in
                PSScreenBuilder(viewModel: viewModel).createComponentView(field)
            }
        }))
        
    }
}
