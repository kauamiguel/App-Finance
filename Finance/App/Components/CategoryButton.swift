//
//  CategoryButton.swift
//  Finance
//
//  Created by Kaua Miguel on 21/07/25.
//

import SwiftUI

struct CategoryButton : View {
    @State private var isSelected : Bool = false
    var categoryImageName : String
    var categoryName : String
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(self.isSelected ? Color.green : Color.gray, lineWidth: 2)
                .frame(width: 100, height: 100)
                .overlay {
                    VStack{
                        Image(systemName: self.categoryImageName)
                            .foregroundStyle(Color.blue)
                            .scaledToFill()
                            .font(.system(size: 40))
                        
                        Text(categoryName)
                            .fontWeight(.regular)
                            .font(.system(size: 10))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
        }
    }
}
