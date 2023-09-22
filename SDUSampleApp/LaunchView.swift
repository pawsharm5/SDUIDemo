//
//  LoginView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

struct LaunchView: View {
    @StateObject private var psViewModel: PSViewModel
    
    init() {
        _psViewModel = StateObject(wrappedValue: PSViewModel(service: LocalService()))
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                if let bodyD = psViewModel.currentScreenData?.body.subviews?.first {
                    ScreenBuilder().buildView(for: bodyD)
                }
            }.navigationTitle("").task {
                await psViewModel.load()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
