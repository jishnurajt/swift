//
//  ViewController4.swift
//  vk
//
//  Created by Appzoc on 12/09/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
var jsonData :NSArray=[]


class ViewController4: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var a = NSArray()
    var jdata = NSArray()
    
    @IBOutlet weak var actv: UIActivityIndicatorView!
    var btag = Int()
    let home = ["http://app.eazyhost.in/visit_kochi/api/see/seecategories","http://app.eazyhost.in/visit_kochi/api/dolist/docategories","http://app.eazyhost.in/visit_kochi/api/transportation/transportationcategories","http://app.eazyhost.in/visit_kochi/api/eat/eatcategory","http://app.eazyhost.in/visit_kerala/api/stay/staycategories","http://app.eazyhost.in/visit_kochi/api/pray/praycategories","http://app.eazyhost.in/visit_kochi/api/atm/atmcategories","http://app.eazyhost.in/visit_kochi/api/care/carecategories","http://app.eazyhost.in/visit_kochi/api/enjoy/enjoycategories"]
    
    var imagelink = "http://app.eazyhost.in/visit_kochi/"


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.png")!)
        tableview.delegate = self
        tableview.dataSource = self
       
        actv.startAnimating()
        DispatchQueue.main.async {
            
            
            self.jdata = self.getdata()
            
          
            
        }
    }
        
        func getdata() -> NSArray {
            
            
            var homelink = home[btag]
            
            let request = NSMutableURLRequest(url: URL( string:homelink )!)
            let session = URLSession.shared
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request as URLRequest,
                                        completionHandler: { (data, response, error) in
                                            
                                            
                                            do {
                                                jsonData = try! JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.mutableContainers ) as! NSArray
                                                
                                                print("jsonData : \(jsonData)")
                                                
                                                self.jdata = jsonData
                                                
                                                self.datasend (jdata: self.jdata)
                                                
                                                DispatchQueue.main.async {
                                                    
                                                  //  self.actv.stopAnimating()
                                                }
                                                
                                                
                                                //print(self.jdata)
                                                
                                            }
                                            
            })
            
            //        DispatchQueue.main.async {
            //            self.tableView.reloadData()
            //        }
            
            
            task.resume()
            
            
            
            return jsonData
            
            
        }
        
       
    
    
    
    func datasend( jdata:NSArray) -> Void {
        
        
        a = jdata
        print(a)
        DispatchQueue.main.async {
             self.tableview.reloadData()
            self.actv.stopAnimating()
            self.actv.hidesWhenStopped = true
        }
        

       
     
        
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return jsonData.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath)as! TableViewCell
        
       // print(a[indexPath.row])
        cell.lb.textColor = UIColor.blue
        let l = (jsonData[indexPath.row] as AnyObject).value(forKey: "image") as? String
 let ll = imagelink+l!
        print(ll)
        if let url = NSURL(string: ll) {
            if let data = NSData(contentsOf: url as URL) {
                cell.imag.image = UIImage(data: data as Data)
            }        
        }
        
        
        cell.lb.text=(jsonData[indexPath.row] as AnyObject).value(forKey: "name") as? String
        
        
        return cell
        }
     public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
     {
        let tview:ViewController5 = self.storyboard?.instantiateViewController(withIdentifier: "table2")as! ViewController5
        tview.id = ((jsonData[indexPath.row] as AnyObject).value(forKey: "id") as? String)!
        tview.btag = btag
       
        
        self.navigationController!.pushViewController(tview, animated: true)

    
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
