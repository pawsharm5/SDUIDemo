//
//  PSSegmentControlBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

struct PSSegmentControlBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSSegmentedControl
    let viewModel: BaseViewModel
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
    }
    @MainActor
    func build(element: SubView) -> PSSegmentedControl {
        PSSegmentedControl(configuration: PSSegmentConfig(content: {
            ForEach(element.subviews ?? [], id: \.identifier) { field in
                PSScreenBuilder(viewModel: viewModel).createComponentView(field)
            }
        }))
    }
}
