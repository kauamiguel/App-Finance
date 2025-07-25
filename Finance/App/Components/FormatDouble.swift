//
//  FormatDouble.swift
//  Finance
//
//  Created by Kaua Miguel on 25/07/25.
//

import Foundation

extension String{
    func toDouble() -> Double{
        return Double(self) ?? 0.0
    }
}
