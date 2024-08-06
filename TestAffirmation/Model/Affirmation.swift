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
    
//    enum Category: String, CaseIterable, PersistableEnum {
//        case love = "loveLabel"
//        case friendship = "friendshipLabel"
//        
//        func localizedString() -> String {
//            return NSLocalizedString(self.rawValue, comment: "")
//        }
//    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(category: Category, affirmationEng: String, affirmationRus: String) {
        self.init()
        self.category = Category()
        self.affirmationEng = affirmationEng
        self.affirmationRus = affirmationRus
    }
    
//    private static var affirmations = [Affirmation(category: "Love", affirmationEng: <#T##String#>, affirmationRus: <#T##String#>)]
    

    
}





var loveAffirmations: [String] = [
    "- Я достоин любви и заслуживаю получать любовь в изобилии",
    "- Мое сердце открыто для дарения и получения любви",
    "- Я окружен любовью каждый день и во всех отношениях",
    "- Я привлекаю любовь и любящие отношения в свою жизнь",
    "- Любовь течет ко мне и через меня без усилий",
    "- Я излучаю любовь, и другие отражают любовь мне в ответ",
    "- Мои отношения наполнены любовью, счастьем и уважением",
    "- Я благодарен за любовь, которая меня окружает",
    "- Любовь приходит ко мне легко и без усилий",
    "- Я магнит для любящих и полноценных отношений"
]

var friendshipAffirmations: [String] = [
    "- Меня окружают поддерживающие и любящие друзья",
    "- Я привлекаю в свою жизнь позитивную и преданную дружбу",
    "- Мои друзья и я разделяем взаимное уважение и доверие",
    "- Я добрый и заботливый друг, и я получаю то же самое в ответ",
    "- Мои дружеские отношения наполнены радостью, смехом и пониманием",
    "- Я благодарен за удивительных друзей в моей жизни",
    "- Я лелею и дорожу своей дружбой",
    "- Я привлекаю друзей, которые поддерживают и воодушевляют меня",
    "- Мои друзья и я растите вместе в любви и гармонии",
    "- Я магнит для настоящей и прочной дружбы"
]


