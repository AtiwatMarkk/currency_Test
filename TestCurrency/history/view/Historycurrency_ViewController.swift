//
//  Historycurrency_ViewController.swift
//  weather forecast test
//
//  Created by Atiwat Punboonchu on 19/6/2566 BE.
//

import UIKit

class Historycurrency_ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
 
    var name_currency : String = ""
    var TempData  : NSMutableArray = []
    
    @IBOutlet weak var head_lb: UILabel!
    @IBOutlet weak var table_view: UITableView!
    
    lazy var viewModel: HistorycurrencyViewModel = {
        let viewModel = HistorycurrencyViewModel()
        viewModel.rootViewController = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.viewModel.test()
        initTable()
    }
    
    func initTable (){
        
        self.head_lb.text     = name_currency
        
        table_view.delegate = self
        table_view.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TempData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let history_cell = table_view.dequeueReusableCell(withIdentifier: "History_TableViewCell") as! History_TableViewCell
        let data = self.TempData[indexPath.row] as! ResponseData
        history_cell.time_lb.text = data.time?.updated
        switch name_currency {
            case "USD":
            history_cell.currency_lb.text = data.bpi?.USD.rate
            break
            case "GBP":
                history_cell.currency_lb.text = data.bpi?.GBP.rate
            break
            case "EUR":
                history_cell.currency_lb.text = data.bpi?.EUR.rate
            break
            default:
                print("error")
            break
            }

        return history_cell
    }
    
    
  
    @IBAction func back_btn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func returnData(data : NSMutableArray ) {
        
        self.TempData = data
        self.table_view.reloadData()
    }
    
    

}
