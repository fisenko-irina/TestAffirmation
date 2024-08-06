//
//  CoordinatorView.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 01.08.2024.
//

import SwiftUI
import RealmSwift

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    @ObservedObject var appViewModel = AppViewModel()
   
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: appViewModel.isLogin ? .main : .selectCategory )
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }.environmentObject(coordinator)
    }
    
    init() {
        if UserDefaults.standard.bool(forKey: "isLogin") {
            appViewModel.isLogin = false
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}

#Preview {
    CoordinatorView()
}
