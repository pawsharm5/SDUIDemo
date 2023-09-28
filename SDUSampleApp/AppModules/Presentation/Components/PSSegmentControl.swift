//
//  PSSegmentControl.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 28/09/23.
//

import SwiftUI

protocol SegmentControlConfigurable {
    var segments: [String] { get set }
    var selectedSegmentIndex: Binding<Int> { get set }
    var backgroundColor: String { get }
}
struct SegmentControlConfig: SegmentControlConfigurable {
    var segments: [String]
    var selectedSegmentIndex: Binding<Int>
    var backgroundColor: String
}

struct PSSegmentControl: View {
    var configuration: SegmentControlConfig
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<configuration.segments.count, id: \.self) { index in
                Button(action: {
                    configuration.selectedSegmentIndex.wrappedValue = index
                }) {
                    Text(configuration.segments[index])
                        .padding(8)
                        .frame(width: 100)
                        .foregroundColor(index == configuration.selectedSegmentIndex.wrappedValue ? .white : .black)
                }
                .background(index == configuration.selectedSegmentIndex.wrappedValue ? Color.black : Color.clear)
                
            }
        }.background(Color(hex: configuration.backgroundColor))
         .border(Color(.black))
    }
}
