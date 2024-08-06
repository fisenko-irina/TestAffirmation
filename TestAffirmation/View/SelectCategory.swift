//
//  SelectCategory.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI
import RealmSwift

struct SelectCategory: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject private var viewModel = AppViewModel()
    
    var body: some View {
        VStack {
            Text("selectCategoryLabel")
                .font(.title)
                .bold()
            
            VStack{
                ForEach(Category.allCases, id: \.self) { item in
                    showButton(text: item.localizedString()) {
                        UserDefaults.standard.set("\(item)", forKey: "selectedCategory")
                        coordinator.push(.selectBackgroundColor)
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SelectCategory()
}

