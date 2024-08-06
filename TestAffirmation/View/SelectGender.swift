//
//  SelectGender.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI

struct SelectGender: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("selectGenderLabel")
                .font(.title)
                .bold()
            
            VStack{
                ForEach(Gender.allCases, id: \.self) { item in
                    showButton(text: item.localizedString()) {
                        coordinator.push(.main)
                        UserDefaults.standard.set("\(item)", forKey: "selectedGender")
                        UserDefaults.standard.set(true, forKey: "isLogin")
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
