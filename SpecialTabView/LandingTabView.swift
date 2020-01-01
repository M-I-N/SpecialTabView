//
//  LandingTabView.swift
//  SpecialTabView
//
//  Created by Mufakkharul Islam Nayem on 12/26/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import SwiftUI

struct LandingTabView: View {
    @EnvironmentObject var appState: AppState
    @State var showAddSheet: Bool = false

    var body: some View {

        TabView(selection: $appState.currentTabSelection) {

            Text("List View")
                .tabItem {
                    Image(systemName: "list.bullet.below.rectangle")
            }
            .tag(0)

            SheetPresenter(presentingSheet: self.$showAddSheet, content: Text("Add New"))
                .tabItem {
                    Image(systemName: "plus.circle.fill")
            }
            .tag(1)

            Text("Grid View")
                .tabItem {
                    Image(systemName: "square.grid.2x2")
            }
            .tag(2)

            Text("Options View")
                .tabItem {
                    Image(systemName: "ellipsis")
            }
            .tag(3)

        }
    }
}

struct SheetPresenter<Content>: View where Content: View {
    @EnvironmentObject var appState: AppState
    @Binding var presentingSheet: Bool

    var content: Content
    var body: some View {
        Rectangle().fill(Color.clear)
            .sheet(isPresented: self.$presentingSheet, onDismiss: {
                self.appState.currentTabSelection = self.appState.previousTabSelection
            }) { self.content }
            .onAppear {
                DispatchQueue.main.async {
                    self.presentingSheet = true
                }
            }
    }
}

class AppState: ObservableObject {
    private (set) var previousTabSelection = -1
    @Published var currentTabSelection = 0 {
        didSet {
            previousTabSelection = oldValue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingTabView()
    }
}
