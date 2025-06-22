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
            TextField("Enter the amount", text: $spentValue)
                .disableAutocorrection(true)
                .border(.black)
        }
        .padding()
    }
}
