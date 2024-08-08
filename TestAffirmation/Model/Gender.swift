//
//  Gender.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 07.08.2024.
//

import Foundation

enum Gender: String, CaseIterable {
    case male = "maleLabel"
    case female = "femaleLabel"
    
    static let defaultGender: Gender = .male
    
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}


