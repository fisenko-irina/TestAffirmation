//
//  MainScreenViewModel.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 06.08.2024.
//

import Foundation
import SwiftUI

final class MainScreenViewModel: ObservableObject {
    
    @Published var source = Source.allAffirmation()
    @AppStorage("selectedColor") var isColor: String!
    
    //    func getRange() -> Range<Int> {
    //        return 0...source.count-1
    //    }
    
    func chooseLanguage(item: Affirmation) -> String {
        let language = String(Locale.current.language.languageCode!.identifier)
        switch language {
        case "ru":
            return item.affirmationRus
        case "en":
            return item.affirmationEng
        default:
            return ""
        }
    }
    
    func selectColor() -> Color {
        switch isColor {
        case "blue":
            return Color.blue
        case "red":
            return Color.red
        default:
            return Color.white
        }
    }
}
