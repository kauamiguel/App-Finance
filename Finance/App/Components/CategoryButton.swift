//
//  CategoryButton.swift
//  Finance
//
//  Created by Kaua Miguel on 21/07/25.
//

import SwiftUI

struct CategoryButton: View {
    var categoryImageName: String
    var categoryName: String
    var isSelected : Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.green.opacity(0.4) : Color.gray, lineWidth: 3)
                .background(Color.white)
                .cornerRadius(10)

            VStack {
                Image(systemName: categoryImageName)
                    .foregroundStyle(Color.blue)
                    .font(.system(size: 40))

                Text(categoryName)
                    .font(.system(size: 10))
                    .foregroundStyle(.blue)
            }
        }
        .frame(width: 100, height: 100)
        .contentShape(Rectangle()) // ← garante área tocável
    }
}
