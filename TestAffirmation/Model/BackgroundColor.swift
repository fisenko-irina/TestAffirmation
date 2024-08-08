//
//  BackgroundColor.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 07.08.2024.
//

import Foundation
import SwiftUI

enum BackgroundColor: String, CaseIterable {
    case blue = "blueLabel"
    case red = "redLabel"
    
    static let defaultColor: BackgroundColor = .blue
    
    var color: Color {
        switch self {
        case .blue:
            return Color.blue
        case .red:
            return Color.red
        }
    }
    
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
