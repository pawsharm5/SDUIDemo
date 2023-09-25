//
//  PSViewModelProtocol.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation
import SwiftUI

protocol PSViewModelProtocol {
    var currentScreenData: ScreenModel? { get set }
    func getScreenData() async
}
