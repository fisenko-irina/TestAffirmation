//
//  SelectGender.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI

struct SelectGender: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("selectGenderLabel")
                .font(.title)
                .bold()
            
            VStack{
                ForEach(appViewModel.genders, id: \.self) { item in
                    showButton(text: item.localizedString()) {
                        coordinator.push(.main)
                        appViewModel.selectedGender = item
                        appViewModel.isOnboarded = true
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    SelectGender()
}
