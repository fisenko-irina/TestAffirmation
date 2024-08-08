//
//  MainScreenViewModel.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 06.08.2024.
//

import Foundation
import SwiftUI
import RealmSwift

final class MainScreenViewModel: ObservableObject {
    
    private var realmManager: IRepository
    
    func getArray(_ category: Category) -> [Affirmation] {
        realmManager.filterByCategory(category: category)
    }

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
    
    init(realmManager: IRepository = RealmStorageManager.shared) {
        self.realmManager = realmManager
    }
}
