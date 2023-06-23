//
//  ResponseData.swift
//  weather forecast test
//
//  Created by Atiwat Punboonchu on 22/6/2566 BE.
//

import Foundation

class currency_model: NSObject {
    
    var ResponseData : ResponseData!
}


struct ResponseData: Codable {

  var time       : Time?   = Time()
  var disclaimer : String? = nil
  var chartName  : String? = nil
  var bpi        : Bpi?

}
