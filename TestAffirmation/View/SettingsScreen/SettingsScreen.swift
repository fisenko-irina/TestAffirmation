//
//  SettingsScreen.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI

struct SettingsScreen: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker(selection: $appViewModel.selectedCategory, label: Text("categoryLabel"), content: {
                    ForEach(appViewModel.categories, id: \.self) { item in
                        Text(item.localizedString())
                            .tag(item)
                            .foregroundColor(.gray)
                            .onTapGesture {
                                appViewModel.selectedCategory = item
                            }
                    }
                }).pickerStyle(.navigationLink)
                    .padding(5)
                
                Picker(selection: $appViewModel.backgroundColor, label: Text("colorLabel"), content: {
                    ForEach(appViewModel.colors, id: \.self) { item in
                        Text(item.localizedString())
                            .tag(item)
                            .foregroundColor(.gray)
                            .onTapGesture {
                                appViewModel.backgroundColor = item
                            }
                    }
                }).pickerStyle(.navigationLink)
                    .padding(5)
                
                Picker(selection: $appViewModel.selectedGender, label: Text("genderLabel"), content: {
                    ForEach(appViewModel.genders, id: \.self) { item in
                        Text(item.localizedString())
                            .tag(item)
                            .foregroundColor(.gray)
                            .onTapGesture {
                                appViewModel.selectedGender = item
                            }
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
}

#Preview {
    SettingsScreen()
}
