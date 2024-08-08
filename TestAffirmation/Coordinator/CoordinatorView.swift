//
//  CoordinatorView.swift
//  TestAffirmation
//
//  Created by Fisenko Irina on 01.08.2024.
//

import SwiftUI
import RealmSwift

struct CoordinatorView: View {
    
    @StateObject var coordinator = Coordinator()
    @StateObject var appViewModel = AppViewModel()
   
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: appViewModel.isOnboarded ? .main : .selectCategory )
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }.environmentObject(coordinator)
            .environmentObject(appViewModel)
    }
    
    init() {
//      print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}

#Preview {
    CoordinatorView()
}
