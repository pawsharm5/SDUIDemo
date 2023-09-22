//
//  PSSegmentControl.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

//// Define a protocol for configuring segments
//protocol PSSegmentConfigurable {
//    var title: String { get }
//    var isSelected: Bool { get set }
//}
//
//// Create a struct that conforms to the protocol
//struct PSSegmentConfig: Identifiable, PSSegmentConfigurable {
//    var id = UUID()
//    var title: String
//    var isSelected: Bool = false
//}
//
//// Create a custom segment control view
//struct PSSegmentedControl: View {
//    @Binding var selectedSegment: PSSegmentConfig
//    var segments: [PSSegmentConfig]
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(segments) { segment in
//                Button(action: {
//                    selectedSegment = segment
//                }) {
//                    Text(segment.title)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(segment.isSelected ? Color.blue : Color.gray)
//                        .foregroundColor(segment.isSelected ? Color.white : Color.black)
//                        .cornerRadius(8)
//                }
//                .border(Color.black, width: 1)
//            }
//        }
//    }
//}

protocol PSSegmentConfigurable {
    var content: AnyView { get }
    var backgroundColor: Color { get }
    // Add any other configuration properties you need
}

struct PSSegmentConfig: PSSegmentConfigurable {
    
    let content: AnyView
    let backgroundColor: Color

    init<Content: View>(@ViewBuilder content: () -> Content, backgroundColor: Color = .gray) {
        self.content = AnyView(content())
        self.backgroundColor = backgroundColor
    }
}
struct PSSegmentedControl : View {
    let configuration: PSSegmentConfig
    
    var body: some View {
        HStack(spacing: 1) {
            configuration.content
        }.background(configuration.backgroundColor)
            .frame(width: 240)
                .border(Color(.black))
    }
}
