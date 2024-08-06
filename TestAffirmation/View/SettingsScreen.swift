//
//  SettingsScreen.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var category: Category
    @State private var backgroundColor: BackgroundColor
    @State private var gender: Gender
    @State private var language: Language
    @AppStorage("selectedColor") var isColor: String!
    
    
    
    @ObservedObject private var viewModel = SettingsViewModel()

    var body: some View {
        
        NavigationView {
            Form {
                Picker(selection: $category, label: Text("categoryLabel"), content: {
                    ForEach(Category.allCases, id: \.self) { item in
                        Text(item.localizedString())
                            .tag(item)
                            .foregroundColor(.gray)
                            .onTapGesture {
                                
                                UserDefaults.standard.set("\(item)", forKey: "selectedCategory")
                                print("selected \(item)")
                            }
                    }
                }).pickerStyle(.navigationLink)
                    .padding(5)
                
                Picker(selection: $backgroundColor, label: Text("colorLabel"), content: {
                    ForEach(BackgroundColor.allCases, id: \.self) { item in
                        Text(item.localizedString())
                            .tag(item)
                            .foregroundColor(.gray)
                            .onTapGesture {
                                isColor = "\(item)"
                                print("selected \(item)")
                            }
                    }
                }).pickerStyle(.navigationLink)
                    .padding(5)
                
                Picker(selection: $gender, label: Text("genderLabel"), content: {
                    ForEach(Gender.allCases, id: \.self) { item in
                        Text(item.localizedString())
                    }
                }).pickerStyle(.navigationLink)
                    .padding(5)
                
                Button {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                } label: {
                    HStack {
                        Text("languageLabel").foregroundColor(.black)
                        Spacer()
                        Text(viewModel.nameLanguage())
                            .foregroundColor(.gray)
                    }
                }.padding(5)
                
            }.navigationTitle("settingsLabel")
        }
    }
  
    init(category: Category, backgroundColor: BackgroundColor, gender: Gender, language: Language) {
        self.category = category
        self.backgroundColor = backgroundColor
        self.gender = gender
        self.language = language
    }
}

#Preview {
    SettingsScreen(category: .friendship, backgroundColor: .blue, gender: .female, language: .english)
}
