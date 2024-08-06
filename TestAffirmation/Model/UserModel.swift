//
//  UserModel.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 01.08.2024.
//

import Foundation
import RealmSwift

struct UserModel {
    let category: Category
    let backgroundColor: BackgroundColor
    let gender: Gender
}

enum Category: String, CaseIterable, PersistableEnum {
    case love = "loveLabel"
    case friendship = "friendshipLabel"
    
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

enum BackgroundColor: String, CaseIterable {
    case blue = "blueLabel"
    case red = "redLabel"
    
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

enum Gender: String, CaseIterable {
    case male = "maleLabel"
    case female = "femaleLabel"
    
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

enum Language: String, CaseIterable {
    case english = "English"
    case russian = "Русский"
}

