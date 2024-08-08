//
//  SettingsViewModel.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 03.08.2024.
//

import Foundation
import SwiftUI


final class SettingsViewModel: ObservableObject {
    
    func nameLanguage() -> String {
        let language = String(Locale.current.language.languageCode!.identifier)
        switch language {
        case "ru": 
            return Language.russian.rawValue
        case "en": 
            return Language.english.rawValue
        default:
            return ""
        }
    }
}
