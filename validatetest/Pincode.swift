//
//  Pincode.swift
//  weather forecast test
//
//  Created by Atiwat Punboonchu on 23/6/2566 BE.
//

import Foundation


class Validatapincode {
    
    func validatePincode(pincode: String) -> Bool {
     
        guard let _ = Int(pincode) else {
            return false
        }
        
        
        if pincode.count >= 6 {
            return true
        } else {
            return false
        }
    }
    
    
    func duplicatePincode (pincode : String) -> Bool {
        
        var duplicateCount = 0
           var prevDigit: Character?

           for digit in pincode {
               if digit == prevDigit {
                   duplicateCount += 1
                   if duplicateCount > 2 {
                       return false
                   }
               } else {
                   duplicateCount = 0
               }
               
               prevDigit = digit
           }
           
           return true
    }
    

    
    func Checknumsort (pincode : String) -> Bool {
        
        
        let digits = Array(pincode)
           
           var consecutiveCount = 1
           
           for i in 1..<digits.count {
               let currentDigit = Int(String(digits[i])) ?? -1
               let previousDigit = Int(String(digits[i-1])) ?? -1
               
               if (currentDigit == previousDigit + 1) || (currentDigit == previousDigit - 1) {
                   consecutiveCount += 1
                   if consecutiveCount > 2 {
                       return false
                   }
               } else {
                   consecutiveCount = 1
               }
           }
           
           return true
    }
    
    func duplicate2(pincode: String) -> Bool {

        
        let pincodeArray = Array(pincode)
        var duplicateCount = 0
        var previousDigit: Character?
        
        for digit in pincodeArray {
            if digit == previousDigit {
                duplicateCount += 1
                if duplicateCount >= 2 {
                    // More than 2 sets of duplicate numbers found
                    return false
                }
            } else {
                duplicateCount = 0
            }
            
            previousDigit = digit
        }
        
        // Passed all conditions, pincode is valid
        return true
    }

    
    
    
}
