//
//  Extension + View.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 01.08.2024.
//

import SwiftUI

extension View {
    func showButton(text: String, completion: @escaping () -> ()) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .frame(height: 50)
                
            Button {
                completion()
            } label: {
                Text(text)
            }
        }
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.blue, lineWidth: 1))
    }
}
