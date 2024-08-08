//
//  SelectCategory.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI
import RealmSwift

struct SelectCategory: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("selectCategoryLabel")
                .font(.title)
                .bold()
            
            VStack{
                ForEach(appViewModel.categories, id: \.self) { item in
                    showButton(text: item.localizedString()) {
                        appViewModel.selectedCategory = item
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

