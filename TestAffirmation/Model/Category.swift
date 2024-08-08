//
//  Category.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 07.08.2024.
//

import Foundation
import RealmSwift

enum Category: String, CaseIterable, PersistableEnum {
    case love = "loveLabel"
    case friendship = "friendshipLabel"
    
    static let defaultCategory: Category = .love
    
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
