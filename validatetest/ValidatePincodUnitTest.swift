//
//  ValidatePincodUnitTest.swift
//  weather forecast test
//
//  Created by Atiwat Punboonchu on 23/6/2566 BE.
//

import XCTest


final class ValidatePincodUnitTest: XCTestCase {
    
    let pincode : String = "124578"
    
    func test_pincode_count () {
        let validatePincode = Validatapincode()
        let valid = validatePincode.validatePincode(pincode: pincode)
        
        XCTAssertTrue(valid)
    }
    
    func test_duplicate_char_pincode () {
        let validatePincode = Validatapincode()
        let valid = validatePincode.duplicatePincode(pincode: pincode)
        
        XCTAssertTrue(valid)
    }
    
    func test_sort_char_pincode () {
        let validatePincode = Validatapincode()
        let valid = validatePincode.Checknumsort(pincode: pincode)
        
        XCTAssertTrue(valid)
    }
    
    func test_double_char_pincode () {
        let validatePincode = Validatapincode()
        let valid = validatePincode.duplicate2(pincode: pincode)
        
        XCTAssertTrue(valid)
    }
}
