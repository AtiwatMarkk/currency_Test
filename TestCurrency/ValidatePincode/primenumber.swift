//
//  primenumber.swift
//  TestCurrency
//
//  Created by Atiwat Punboonchu on 23/6/2566 BE.
//

import Foundation
class primenumber {
    
    func generatePrimeNumbers(upTo limit: Int) -> [Int] {
        var primeNumbers = [Int]()
        
        for number in 2...limit {
            if isPrime(number) {
                primeNumbers.append(number)
            }
        }
        
        return primeNumbers
    }
    
    func isPrime(_ number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        for i in 2..<number {
            if number % i == 0 {
                return false
            }
        }
        
        return true
    }
}
