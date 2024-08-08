//
//  RealmStorageManager.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 09.08.2024.
//

import RealmSwift
import SwiftUI

protocol IRepository {
        
    func setupDefaultData()
    func save(_ affirmation: Affirmation)
    func filterByCategory(category: Category) -> [Affirmation]
    func getAllAffirmations() -> [Affirmation]
}

final class RealmStorageManager: IRepository {
    
    private let storage: Realm?
    static var shared = RealmStorageManager()

    var firstStart: Void = UserDefaults.standard.set(true, forKey: "firstStart")

    func getAllAffirmations() -> [Affirmation] {
        guard let realm = try? Realm() else {
            print("Ошибка: не удалось получить аффирмации")
            return [Affirmation]()
        }
        return Array(realm.objects(Affirmation.self))
    }

    func save(_ affirmation: Affirmation) {
        guard let realm = try? Realm() else {
            print("Ошибка: Не удалось добавить аффирмацию")
            return
        }
        let newItem = Affirmation()
        newItem.category = affirmation.category
        newItem.affirmationEng = affirmation.affirmationEng
        newItem.affirmationRus = affirmation.affirmationRus
        try! realm.write {
            realm.add(newItem)
        }
    }
    
    func setupDefaultData() {
        guard let realm = try? Realm() else {
            print("Ошибка: Не удалось создать аффирмации по умолчанию")
            return
        }
        
        if realm.objects(Affirmation.self).count == 0 {
            let defaultAffirmation = defaultAffirmations
            
            try! realm.write {
                for affirmation in defaultAffirmation {
                    realm.add(affirmation)
                }
            }
        }
    }
    
    func filterByCategory(category: Category) -> [Affirmation] {
        guard let realm = try? Realm() else {
            print("Ошибка: Не удалось отфильтровать по категориям")
            return [Affirmation]()
        }
        let affirmations = realm.objects(Affirmation.self)
        let filtered = affirmations.where {
            $0.category == category
        }
        return Array(filtered)
    }
    
    private init(_ configuration: Realm.Configuration = Realm.Configuration(
        schemaVersion: 1))
     {
        self.storage = try? Realm(configuration: configuration)
         setupDefaultData()
    }
}
