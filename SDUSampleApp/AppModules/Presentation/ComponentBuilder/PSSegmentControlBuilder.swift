//
//  PSSegmentControlBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

struct PSSegmentControlBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSSegmentControl
    let viewModel: LaunchViewModelProtocol
    
    init(viewModel: LaunchViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    @MainActor
    func build(element: SubView) -> PSSegmentControl {
        let binding = Binding(
            get: { viewModel.selectedSegmentIndex },
            set: { newValue in viewModel.setSelectedSegmentIndex(index: newValue) }
        )
        return PSSegmentControl(
            configuration: SegmentControlConfig(
                segments: element.properties.options ?? [],
                selectedSegmentIndex: binding,
                backgroundColor: element.properties.backgroundColor
            )
        )
    }
}
