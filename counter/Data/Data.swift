//
//  Data.swift
//  counter
//
//  Created by Wongkraiwich Chuenchomphu on 9/20/22.
//

import Foundation
import SwiftUI

public struct CounterValue {
    var score: Int
    var bgColor: Color
}



public let defaultCounter = [
    CounterValue(score: 0, bgColor: Color.red),
    CounterValue(score: 0, bgColor: Color.blue)
]


