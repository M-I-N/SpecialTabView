//
//  LandingTabView.swift
//  SpecialTabView
//
//  Created by Mufakkharul Islam Nayem on 12/26/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import SwiftUI

struct LandingTabView: View {

    @State var showAddSheet: Bool = false

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                TabView {

                    Text("List View")
                        .tabItem {
                            Image(systemName: "list.bullet.below.rectangle")
                    }

                    SheetPresenter(presentingSheet: self.$showAddSheet, content: Text("Add New"))
                        .tabItem {
                            Image(systemName: "plus.circle.fill")
                    }

                    Text("Grid View")
                        .tabItem {
                            Image(systemName: "square.grid.2x2")
                    }
                }

            }

        }
    }
}

struct SheetPresenter<Content>: View where Content: View {
    @Binding var presentingSheet: Bool
    var content: Content
    var body: some View {
        Rectangle().fill(Color.clear)
            .sheet(isPresented: self.$presentingSheet, content: { self.content })
            .onAppear {
                DispatchQueue.main.async {
                    self.presentingSheet = true
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingTabView()
    }
}
