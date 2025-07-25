//
//  Categories.swift
//  Finance
//
//  Created by Kaua Miguel on 22/06/25.
//

import SwiftUI

struct CategoriesView : View {
    
    @StateObject var categoryViewModel : CategoryViewModel
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(categoryViewModel.fetchAllCategories(), id: \.id) { category in
                    Button {
                        // Go to categories detail view
                    } label: {
                        CategoryListButton(imageUrl: category.imageUrl, name: category.name, expenseAmount: categoryViewModel.fetchExpensePerCategoryName(categoryName: category.name), expenseCount: categoryViewModel.countExpesesPerCategortName(categoryName: category.name))
                    }
                }
            }
            .padding()
        }
        .onAppear(perform: {
            UIScrollView.appearance().delaysContentTouches = false
        })
    }
}


#Preview {
    CategoriesView(categoryViewModel: CategoryViewModel())
}
