//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Yigit on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCad: UILabel!
    
    @IBOutlet weak var lblTry: UILabel!
    
    @IBOutlet weak var lblChf: UILabel!
    
    @IBOutlet weak var lblJpy: UILabel!
    
    @IBOutlet weak var lblGbp: UILabel!
    
    @IBOutlet weak var lblUsd: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGetRatesClicked(_ sender: Any) {
        
//        1) Request & Session
//        2) Response & Data
//        3) Parsing & JSON Serialization
            
        
//        1)
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK!", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true,completion: nil)
            }else{
//                2)
                if data != nil {
                    
                    
                    
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with:  data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double{
                                    self.lblCad.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.lblChf.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.lblGbp.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.lblJpy.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.lblUsd.text = "USD: \(usd)"
                                }
                                if let tr = rates["TRY"] as? Double{
                                    self.lblTry.text = "TRY: \(tr)"
                                }
                                
                                    
                            }
                        }
                        
                        
                    } catch {
                        print("Error")
                }
                
                
            }
                
        }
            
        
    }
        task.resume()
    
}

}
