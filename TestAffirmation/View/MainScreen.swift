//
//  MainScreen.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 31.07.2024.
//

import SwiftUI
import RealmSwift

struct MainScreen: View {
    var body: some View {
        SliderView()
    }
}

struct SliderView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject private var viewModel = MainScreenViewModel()
    
    var body: some View {
        ZStack {
            viewModel.selectColor().ignoresSafeArea()
            VStack(alignment: .trailing) {
                Button {
                    coordinator.present(sheet: .settings)
                } label: {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                }
                
                GeometryReader { proxy in
                    TabView {
                        ForEach(viewModel.source, id: \.id) { item in
                            Text("\(viewModel.chooseLanguage(item: item))")
                                .font(.system(size: 26))
                                .foregroundColor(.white)
                                .frame(width: proxy.size.width, height: proxy.size.height)
                                .rotationEffect(.degrees(-90))
                                .rotation3DEffect(.degrees(0), axis: (x: 1, y: 0, z: 0))
                                .bold()
                        }
                    }.frame(width: proxy.size.height, height: proxy.size.width)
                        .rotation3DEffect(.degrees(0), axis: (x: 1, y: 0, z: 0))
                        .rotationEffect(.degrees(90), anchor: .topLeading)
                        .offset(x: proxy.size.width)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.horizontal, 40)
            }
        }
    }
}



#Preview {
    MainScreen()
}
