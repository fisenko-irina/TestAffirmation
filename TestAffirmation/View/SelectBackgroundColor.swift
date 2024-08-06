//
//  SelectBackgroundColor.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI

struct SelectBackgroundColor: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject private var viewModel = AppViewModel()
    
    var body: some View {
        
        VStack {
            Text("selectBackgroundColorLabel")
                .font(.title)
                .bold()
            
            VStack{
                ForEach(BackgroundColor.allCases, id: \.self) { item in
                    showButton(text: item.localizedString()) {
                        viewModel.isColor = "\(item)"
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
