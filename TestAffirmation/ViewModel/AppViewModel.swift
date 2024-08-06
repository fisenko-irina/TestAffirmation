//
//  AppViewModel.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 01.08.2024.
//

import Foundation
import SwiftUI

final class AppViewModel: ObservableObject {
    
    @Published var isLogin = false
    @Published var selectedCategory: Category = .love
    @Published var selectedColor: Color = .blue
    @Published var selectedGender: Gender = .male
    
    @AppStorage("selectedColor") var isColor: String = ""
    
    
    
}
