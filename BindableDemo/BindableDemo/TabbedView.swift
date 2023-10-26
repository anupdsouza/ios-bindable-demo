//
//  TabbedView.swift
//  BindableDemo
//
//  Created by Anup D'Souza on 25/10/23.
//

import SwiftUI

struct TabbedView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Schedule", systemImage: "list.dash.header.rectangle")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabbedView()
}
