//
//  Operation.swift
//  calculator
//
//  Created by Ilya Latugovskii on 11.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import Foundation

enum Operations {
    case sqrt
    case tenInExponent
    case factorial
}

class Operation {
    
    func execute(operation: Operations, currentValue: Double) -> Double {
        switch operation {
        case .sqrt:
            return tapSqrt(currentValue: currentValue)
        case .tenInExponent:
            return tapOnTenInExponent(currentValue: currentValue)
        case .factorial:
            return tapOnFactorial(currentValue: currentValue)
        }
    }
    
    
    private func tapSqrt(currentValue: Double?) -> Double {
        return sqrt(currentValue!)
    }
    
    private func tapOnTenInExponent(currentValue: Double?) -> Double {
        return pow(10, currentValue!)
    }
    
    private func tapOnFactorial(currentValue: Double?) -> Double {
        
        
        let number = Int(currentValue!)
        return Double(factorial(factorialNumber: number))
    }
    
    private func factorial(factorialNumber: Int) -> Int {
        if factorialNumber == 0 {
            return 1
        } else {
            return factorialNumber * factorial(factorialNumber: factorialNumber - 1)
        }
    }
}
