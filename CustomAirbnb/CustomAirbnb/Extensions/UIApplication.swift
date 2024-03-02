//
//  UIApplication.swift
//  CustomAirbnb
//
//  Created by Uri on 7/1/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    // dismiss keyboard
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
