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

//                    Text("plus")
//                        .tabItem {
//                            Text(" ")
//                    }

                    Text("Grid View")
                        .tabItem {
                            Image(systemName: "square.grid.2x2")
                    }
                }

                Button(action: {
                    self.showAddSheet.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.red)
                }
                .frame(width: 60, height: 60)
                .shadow(color: .secondary, radius: 1, x: 0, y: 5)
                .offset(x: geometry.size.width / 2 - 30, y: geometry.size.height - 80)

            }

        }
        .sheet(isPresented: $showAddSheet) {
            Text("Add New Modal")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingTabView()
    }
}
