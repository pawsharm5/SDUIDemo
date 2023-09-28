//
//  PSViewModelProtocol.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation
import SwiftUI

protocol LaunchViewModelProtocol {
    var selectedSegmentIndex: Int { get set }
    var selectedDropDownValue: String { get set }
    var currentScreenData: ScreenModel? { get set }
    func getScreenData() async
    func executeButtonAction(for identifier: ComponentIdentifier?, action: Action?)
    func getTextFieldValue(for identifier: String) -> String
    func setTextFieldValue(for identifier: String, value: String, validation: ValidationRules?)
    var textFieldErrorMessage: [String: String] { get set }
    func setErrorTextFieldValue(for identifier: String, value: String)
    func setSelectedSegmentIndex(index: Int)
    func setSelectedDropDownValue(value: String)
}
