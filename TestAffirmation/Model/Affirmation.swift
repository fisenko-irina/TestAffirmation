//
//  Affirmation.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import Foundation
import RealmSwift

final class Affirmation: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var category: Category
    @Persisted var affirmationEng: String
    @Persisted var affirmationRus: String
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(
        category: Category,
        affirmationEng: String,
        affirmationRus: String
    ) {
        self.init()
        self.category = category
        self.affirmationEng = affirmationEng
        self.affirmationRus = affirmationRus
    }
}
