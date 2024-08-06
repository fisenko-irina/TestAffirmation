//
//  SettingsViewModel.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 03.08.2024.
//

import Foundation
import SwiftUI


class SettingsViewModel: ObservableObject {
    
    @Published var isLogin = false
    @Published var bgColor: Color = .blue
    @Published var selectGender: Gender = .male
    @AppStorage("selectedColor") var isColor: String!
    
    
//    @AppStorage("selectedColor") var isColor: String
    
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
