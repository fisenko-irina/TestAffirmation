//
//  SelectBackgroundColor.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI

struct SelectBackgroundColor: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        
        VStack {
            Text("selectBackgroundColorLabel")
                .font(.title)
                .bold()
            
            VStack{
                ForEach(appViewModel.colors, id: \.self) { item in
                    showButton(text: item.localizedString()) {
                        appViewModel.backgroundColor = item
                        coordinator.push(.selectGender)
                        
                    }
                }
            }

        }
        .padding()
    }
}

#Preview {
    SelectBackgroundColor()
}
