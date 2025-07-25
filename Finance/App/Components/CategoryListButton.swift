//
//  CategoryListButton.swift
//  Finance
//
//  Created by Kaua Miguel on 25/07/25.
//

import SwiftUI


struct CategoryListButton : View {
    var imageUrl:String
    var name:String
    var expenseAmount:Double
    var expenseCount:Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 80)
                .foregroundStyle(.white)
                .padding(.vertical, 5)
                .overlay {
                    HStack{
                        Image(systemName: imageUrl)
                            .foregroundStyle(Color.blue)
                            .font(.system(size: 40))
                            .padding(.horizontal,8)
                        
                        VStack(alignment: .leading){
                            Text(name)
                                .foregroundStyle(Color.black)
                                .bold()
                                .font(.system(size: 20))
                            
                            Text("\(expenseCount) expenses")
                                .font(.system(size: 15))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        VStack (alignment: .center){
                            Text("R$\(expenseAmount, specifier:"%.2f")")
                                .foregroundStyle(Color.black)
                                .bold()
                            Text("This month")
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal,8)
                    }
                }
        }
    }
}

#Preview {
    CategoryListButton(imageUrl: "fork.knife.circle.fill", name: "Food", expenseAmount: 80.0, expenseCount: 2)
}
