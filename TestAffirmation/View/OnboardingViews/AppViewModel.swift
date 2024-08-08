//
//  AppViewModel.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 01.08.2024.
//

import Foundation
import SwiftUI

final class AppViewModel: ObservableObject {
    
    @AppStorage("selectedCategory") var selectedCategory: Category = Category.defaultCategory
    @AppStorage("backgroundColor") var backgroundColor: BackgroundColor = BackgroundColor.defaultColor
    @AppStorage("selectedGender") var selectedGender: Gender = Gender.defaultGender
    @AppStorage("isOnboarded") var isOnboarded: Bool = false

    let categories: [Category] = Category.allCases
    let colors: [BackgroundColor] = BackgroundColor.allCases
    let genders: [Gender] = Gender.allCases
    
}
