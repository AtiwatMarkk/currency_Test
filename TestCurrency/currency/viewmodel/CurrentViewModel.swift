//
//  CurrentViewModel.swift
//  weather forecast test
//
//  Created by Tankhun on 14/5/2566 BE.
//

import UIKit

class CurrentViewModel: NSObject {
    var rootViewController : Currency_ViewController!
    lazy var model : currency_model = {
       let Model = currency_model()
        return Model
    }()
    
    // MARK: -------- properties --------
    lazy var appDelegate : AppDelegate = {
        let appdelegate =  UIApplication.shared.delegate as? AppDelegate
        return appdelegate!
    }()
    

    func getdata(){
        Service.shared.updatecurrency() { [self] result , error in
            if let error = error {
                print("Error: \(error.localizedDescription)")

                
            }else if result == nil && error == nil {
  
            } else {
                appDelegate.TempDataArr.add(result)
                rootViewController.setdata(data: result!)
            }
        }

    }
    
    func getnameCurrency(row : Int) -> String {
        
        switch row {
        case 0:
            return "USD"
        case 1:
            return "GBP"
        case 2:
            return "EUR"
        default:
            print("Error")
            return ""
        }
    }
    


}

