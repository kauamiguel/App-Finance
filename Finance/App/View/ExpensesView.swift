//
//  Expenses.swift
//  Finance
//
//  Created by Kaua Miguel on 22/06/25.
//

import SwiftUI

struct ExpensesView : View {
    var dataColumns : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @ObservedObject var expensesViewModel : ExpensesViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Quantidade")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("R$")
                        .foregroundColor(.gray)
                        .padding(.leading, 12)
                    
                    TextField("0,00", text: $expensesViewModel.spentValue)
                        .frame(height: 50)
                        .keyboardType(.decimalPad)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 8)
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .keyboardType(.decimalPad)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .frame(height: 50)
                .padding(.horizontal)
                
                
                
                Text("Categorias")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: dataColumns, spacing: 16) {
                    ForEach(expensesViewModel.getDefaultCategories(), id: \.id) { expense in
                        Button {
                            
                        } label: {
                            CategoryButton(categoryImageName: expense.imageName, categoryName: expense.name)
                        }
                    }
                }
                .buttonStyle(.plain)
                
                Text("Note (Optional)")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextEditor(text: $expensesViewModel.note)
                    .padding(12)
                    .frame(height: 120)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .font(.system(size: 16))
                    .foregroundStyle(.primary)
                
                Spacer()
                
                Button {
                    // MARK: Add expensive on core data and how on categorie view
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 60)
                        .padding()
                        .overlay {
                            Text("Adicionar despesa")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .bold()
                        }
                }
            }
        }
        .onAppear(perform: {
            UIScrollView.appearance().delaysContentTouches = false
        })
    }
}

#Preview {
    ExpensesView(expensesViewModel: ExpensesViewModel())
}
