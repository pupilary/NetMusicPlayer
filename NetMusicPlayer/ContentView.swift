//
//  ContentView.swift
//  NetMusicPlayer
//
//  Created by TAKESI NANASE on 2021/6/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Text("้ฆ้กต") }
                    .tag(1)
                Text("Tab Content 2")
                    .tabItem {
                        Text("ๆ็")
                    }
                    .tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

