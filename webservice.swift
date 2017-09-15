//
//  webservice.swift
//  week10
//
//  Created by Appzoc on 14/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class webservice: UIViewController,UITableViewDataSource ,UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    var ratekey = [String]()
    var ratevalue = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        get_data_from_url()
        tableview.reloadData()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var lb1: UILabel!
    
    @IBOutlet weak var lb2: UILabel!
    
   
    func get_data_from_url()
    {
        let url:URL = URL(string:"http://api.fixer.io/latest" )!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        //request.httpMethod = "GET"
       // request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil
                else {
                return
            }
            
           // print(data)
           // self.extract_json(data!)
            
            
            do
            {
                let json:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                
                print(json)
                
                print((json["date"] as? String)!)
                let a = (json["date"] as? String)!
                print(a)
                self.lb1.text = a
                self.lb2.text = json["base"] as? String
                
                
                
                let rate = json["rates"] as! NSDictionary
                
                
                self.ratekey =  Array(rate.allKeys) as! [String]
                
                self.ratevalue = [String(describing: Array(rate.allValues))]
                print(self.ratevalue)
                
                
            }
                
            catch
            {
                return
            }
            

        })
        
         task.resume()
        DispatchQueue.main.async {
             self.tableview.reloadData()
        }
        
       
        
       
       
    }

    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        
        return ratevalue.count
        
        
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
        
    {
        
        let cell :TableViewCell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
      //print(ratekey)
        //var i = Int()
        cell.key.text = ratekey[indexPath.row]
        cell.value.text = ratevalue[indexPath.row]
        //i = i+1
        return cell
        
        
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
