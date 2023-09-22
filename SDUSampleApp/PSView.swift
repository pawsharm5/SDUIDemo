//
//  LoginView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

struct PSView: View {
    @StateObject private var vm: PSViewModel
     init() {
        _vm = StateObject(wrappedValue: PSViewModel(service: LocalService()))
    }
    
    var body: some View {
        NavigationView {
            if let bodyD = vm.currentScreenData?.body.subviews?.first {
                ScreenBuilder().buildView(for: bodyD)
            }
        }.navigationTitle("Login").task {
            await vm.load()
        }
    }
}

struct PSView_Previews: PreviewProvider {
    static var previews: some View {
        PSView()
    }
}
