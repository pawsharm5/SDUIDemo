//
//  PSSegmentControl.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var selectedIndex: Int
    var segmentTitles: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<segmentTitles.count, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    Text(segmentTitles[index])
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedIndex == index ? Color.blue : Color.gray)
                        .foregroundColor(selectedIndex == index ? Color.white : Color.black)
                        .cornerRadius(8)
                }
                .border(Color.black, width: 1)
            }
        }
    }
}
