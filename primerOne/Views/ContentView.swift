//
//  ContentView.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                ExploreView()
                    .tabItem {
                        Image(systemName: "safari.fill")
                        Text("Explore")
                    }
                
                SavedView()
                    .tabItem {
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                        Text("Saved")
                    }
            }.accentColor(.green)
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
