//
//  ContentView.swift
//  Finance
//
//  Created by Kaua Miguel on 22/06/25.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            Expenses()
                .tabItem {
                    Label("Expenses", systemImage: "plus.circle.fill")
                }
            
            Categories()
                .tabItem {
                    Label("Categories", systemImage: "tag.fill")
                }
            
            Dashboards()
                .tabItem {
                    Label("Dashboards", systemImage: "chart.pie.fill")
                }
        }
        .padding()
    }
}

#Preview {
    TabBar()
}
