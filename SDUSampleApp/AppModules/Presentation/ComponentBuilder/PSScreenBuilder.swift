//
//  ScreenBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import SwiftUI

protocol UIComponentBuilder {
    associatedtype ComponentType
    func build(element: SubView) -> ComponentType
}

@MainActor
class PSScreenBuilder {
    let viewModel: LaunchViewModelProtocol
    
    init(viewModel: LaunchViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    @ViewBuilder
    func createComponentView(_ component: SubView) -> some View {
        switch component.type {
        case .scrollView:
            PSScrollViewViewBuilder(viewModel: viewModel).build(element: component)
        case .textField:
            PSTextFieldBuilder(viewModel: viewModel).build(element: component)
        case .button:
            PSButtonBuilder(viewModel: viewModel).build(element: component)
        case .label:
            PSLabelBuilder().build(element: component)
        case .Segment:
            PSSegmentControlBuilder(viewModel: viewModel).build(element: component)
        case .view:
            PSViewBuilder(viewModel: viewModel).build(element: component)
        case .image:
            PSImageViewBuilder().build(element: component)
        case .HStack:
            PSHStackViewBuilder(viewModel: viewModel).build(element: component)
        case .VStack:
            PSVStackViewBuilder(viewModel: viewModel).build(element: component)
        case .dropdown:
            PSDropDownTextFieldBuilder(viewModel: viewModel).build(element: component)
        }
    }
}
