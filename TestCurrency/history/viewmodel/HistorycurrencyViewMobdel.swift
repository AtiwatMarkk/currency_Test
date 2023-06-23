//
//  HistorycurrencyViewMobdel.swift
//  weather forecast test
//
//  Created by Atiwat Punboonchu on 22/6/2566 BE.
//

import Foundation
import UIKit

class HistorycurrencyViewModel: NSObject {
    
    var rootViewController : Historycurrency_ViewController!
    lazy var model : HistorycurrencyViewModel = {
        let Model = HistorycurrencyViewModel()
        return Model
    }()
    
    // MARK: -------- properties --------
    lazy var appDelegate : AppDelegate = {
        let appdelegate =  UIApplication.shared.delegate as? AppDelegate
        return appdelegate!
    }()
    
    
    
    func test (){
        if appDelegate.TempDataArr.count > 1 {
            appDelegate.TempDataArr = NSMutableArray(array: appDelegate.TempDataArr.reversed())
        }
//        for i in 0...appDelegate.TempDataArr.count-1{
//            let temp = appDelegate.TempDataArr[i]
//            print(temp)
            
            self.rootViewController.returnData(data: appDelegate.TempDataArr )
//        }
    }
    

    
}
 

