//
//  Coordinator.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 01.08.2024.
//

import Foundation
import SwiftUI

enum Page: String, Identifiable {
    case selectCategory
    case selectBackgroundColor
    case selectGender
    case main
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case settings
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .selectCategory:
            SelectCategory()
        case .selectBackgroundColor:
            SelectBackgroundColor()
        case .selectGender:
            SelectGender()
        case .main:
            MainScreen()
                .navigationBarBackButtonHidden(true)
        }
    }
        
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
            switch sheet {
            case .settings:
                SettingsScreen()
            }
        }
}
