//
//  ContentView.swift
//  Finance
//
//  Created by Kaua Miguel on 22/06/25.
//

import SwiftUI

struct TabBarContainer: View {
    var body: some View {
        NavigationStack {
            TabView {
                ExpensesView(expensesViewModel: ExpensesViewModel())
                    .tabItem {
                        Label("Expenses", systemImage: "plus.circle.fill")
                    }
                
                CategoriesView(categoryViewModel: CategoryViewModel())
                    .tabItem {
                        Label("Categories", systemImage: "tag.fill")
                    }
                
                DashboardsView()
                    .tabItem {
                        Label("Dashboards", systemImage: "chart.pie.fill")
                    }
            }
            .navigationBarItems(leading:
                                    Text("Despesas")
                .bold()
                .font(.title)
                .foregroundColor(.accentColor)
                                ,
                                trailing: Button(action: {
                
            }, label: {
                Image(systemName: "plus.circle.fill")
            }))
        }
    }
}

#Preview {
    TabBarContainer()
}
