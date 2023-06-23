//
//  Currency_ViewController.swift
//  weather forecast test
//
//  Created by Atiwat Punboonchu on 19/6/2566 BE.
//

import UIKit

class Currency_ViewController: UIViewController {
    
    
    var timerTemp : Timer?
    var data : ResponseData?
    var dataArrayUSD: [String] = []
    var Tempdata : NSMutableDictionary = [:]
    var tag : Int = 0
    
    @IBOutlet var view1: UIView!
    @IBOutlet weak var head_lb: UILabel!
    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var table_view: UITableView!
    @IBOutlet weak var time_lb: UILabel!
    
    
    @IBOutlet weak var bottom_view: UIView!
    
    @IBOutlet weak var eur_btn: UIButton!
    @IBOutlet weak var gbp_btn: UIButton!
    @IBOutlet weak var usd_btn: UIButton!
    
    @IBOutlet weak var currency_output: UILabel!
    @IBOutlet weak var tf_input: UITextField!
    @IBOutlet weak var description_lb: UILabel!
    
    // MARK: -------- Properties --------
    lazy var viewModel: CurrentViewModel = {
        let viewModel = CurrentViewModel()
        viewModel.rootViewController = self
        return viewModel
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Updatecurrency()
        timerTemp = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(Updatecurrency), userInfo: nil, repeats: true)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            view1.addGestureRecognizer(tapGesture)
        initTableView()
        initTextField()
        setbottomView()
    }
    
    @objc func handleTap() {
            view.endEditing(true)
        }
    

    
    
    func initTableView (){
        table_view.delegate = self
        table_view.dataSource = self
    }
    
    
    func initTextField(){
        tf_input.delegate = self
        tf_input.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setbottomView(){
        
        currency_output.text = "0"
        description_lb.text  = "USD"
        tf_input.text        = ""
        self.tag = 1
        
    }
    
    
     @objc func Updatecurrency (){
        viewModel.getdata()
    }
    
    @objc @IBAction func clickUSD(_ sender: Any) {
        self.tag = 1
        description_lb.text = "USD"
        currency_output.text = "0"
        tf_input.text = ""
        
    }
    
    @IBAction func clickGBP(_ sender: Any) {
        self.tag = 2
        description_lb.text = "GBP"
        currency_output.text = "0"
        tf_input.text = ""
    }
    
    @IBAction func clickEUR(_ sender: Any) {
        self.tag = 3
        description_lb.text = "EUR"
        currency_output.text = "0"
        tf_input.text = ""
    }
    
    func setdata(data: ResponseData){
        
        self.data = data

        
        DispatchQueue.main.async { [self] in
            self.time_lb.text = data.time?.updated
            self.dataArrayUSD.append("\(data.bpi?.USD.rate ?? "")|\(data.time?.updated ?? "")")
            self.table_view.reloadData()
        }
        
    
       
        
    }
    

}

extension Currency_ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currency_cell = table_view.dequeueReusableCell(withIdentifier: "Currency_TableViewCell") as! Currency_TableViewCell
        
            switch indexPath.row {
                case 0:
                    currency_cell.currency_lb.text = data?.bpi?.USD.code
                    currency_cell.currency_current.text = data?.bpi?.USD.rate
                break
                case 1:
                    currency_cell.currency_lb.text = data?.bpi?.GBP.code
                    currency_cell.currency_current.text = data?.bpi?.GBP.rate
                break
                case 2:
                    currency_cell.currency_lb.text = data?.bpi?.EUR.code
                    currency_cell.currency_current.text = data?.bpi?.EUR.rate
                break
                default:
                    print("error")
                break
                }
        currency_cell.btn_history.tag = indexPath.row
        currency_cell.btn_history.addTarget(self, action: #selector(TaptoHistory), for: .touchUpInside)
        

        return currency_cell
    }
    
    @objc func TaptoHistory (sender : UIButton) {
        
        let name_currency = self.viewModel.getnameCurrency(row: sender.tag )
        
        let main_storyboard = UIStoryboard(name: "Main", bundle:nil)
        let Historycurrency_ViewController = main_storyboard.instantiateViewController(identifier: "Historycurrency_ViewController") as! Historycurrency_ViewController
            Historycurrency_ViewController.name_currency = name_currency
        self.navigationController?.pushViewController(Historycurrency_ViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.table_view.deselectRow(at: indexPath, animated: true)
        
       
        
    }
    

    
    
}

extension Currency_ViewController :  UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let validString3 = CharacterSet(charactersIn: "1234567890")
        
        if string == ""{
            return true
        }
        if let range = string.rangeOfCharacter(from: validString3){
            return true
        }else{
            return false
        }
         
            
    }
        
    @objc func textFieldDidChange(_ textField: UITextField){
        var rate = Double((textField.text == "" ? "0" : textField.text)!)
        switch self.tag {
            case 1:
            let sum = (rate!)/Double((data?.bpi?.USD.rate_float)!)
            let formattedNumber = String(format: "%.6f", sum)
            Updateprice(sum: String(formattedNumber))
            break
            case 2:
            
            let sum = (rate!)/Double((data?.bpi?.GBP.rate_float)!)
            let formattedNumber = String(format: "%.6f", sum)
            Updateprice(sum: String(formattedNumber))
            break
            case 3:
            let sum = (rate!)/Double((data?.bpi?.EUR.rate_float)!)
            let formattedNumber = String(format: "%.6f", sum)
            Updateprice(sum: String(formattedNumber))
            break
            default:
                print("error")
            break
            }
        
    }
    
    func Updateprice (sum : String){
        self.currency_output.text = sum
    }

}

    
