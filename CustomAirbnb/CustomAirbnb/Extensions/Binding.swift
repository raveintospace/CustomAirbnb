//
//  Binding.swift
//  CustomAirbnb
//
//  Created by Uri on 4/2/24.
//

import SwiftUI

extension Binding {
    
    // From Int to Float (Double) - Used in sliders
    static func convert<TInt, TFloat>(from intBinding: Binding<TInt>) -> Binding<TFloat>
    where TInt:   BinaryInteger,
          TFloat: BinaryFloatingPoint{
              
              Binding<TFloat> (
                get: { TFloat(intBinding.wrappedValue) },
                set: { intBinding.wrappedValue = TInt($0) }
              )
          }
    
    // From Float to Int
    static func convert<TFloat, TInt>(from floatBinding: Binding<TFloat>) -> Binding<TInt>
    where TFloat: BinaryFloatingPoint,
          TInt:   BinaryInteger {
              
              Binding<TInt> (
                get: { TInt(floatBinding.wrappedValue) },
                set: { floatBinding.wrappedValue = TFloat($0) }
              )
          }
}
