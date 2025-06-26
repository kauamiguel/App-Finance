//
//  Expenses.swift
//  Finance
//
//  Created by Kaua Miguel on 22/06/25.
//

import SwiftUI

struct Expenses : View {
    @State private var spentValue : String = ""
    
    var body: some View {
        VStack {
            Text("Quantidade")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            HStack {
                Text("R$")
                    .foregroundColor(.gray)
                    .padding(.leading, 12)
                
                TextField("0,00", text: $spentValue)
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
            
            Spacer()
            
            Text("Categorias")
        }
    }
}

#Preview {
    Expenses()
}
