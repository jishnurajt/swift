
//
//  ViewController5.swift
//  vk
//
//  Created by Appzoc on 12/09/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

//var jsonData1 :NSArray=[]

class ViewController5: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var a = NSArray()
    
    var jsonData1 = NSDictionary ()
    
    var jdata = NSDictionary ()
    var homelink = String()
    var btag = Int()
    var id = String()
    let home = ["http://app.eazyhost.in/visit_kochi/api/see/seedetails/","http://app.eazyhost.in/visit_kochi/api/dolist/dodetails/","http://app.eazyhost.in/visit_kochi/api/transportation/transportationdetails/","http://app.eazyhost.in/visit_kerala/api/stay/staydetails/","http://app.eazyhost.in/visit_kochi/api/eat/eatdetails/","http://app.eazyhost.in/visit_kochi/api/pray/praydetails/","http://app.eazyhost.in/visit_kochi/api/atm/atmdetails/","http://app.eazyhost.in/visit_kochi/api/care/caredetails/","http://app.eazyhost.in/visit_kochi/api/enjoy/enjoydetails/"]
    
    @IBOutlet weak var actv: UIActivityIndicatorView!
    var imagelink = ["http://app.eazyhost.in/visit_kochi/uploads/see_list/","http://app.eazyhost.in/visit_kochi/uploads/do_list/","http://app.eazyhost.in/visit_kochi/uploads/transportation_list/","","http://app.eazyhost.in/visit_kochi/uploads/eat_list/","http://app.eazyhost.in/visit_kochi/uploads/pray_list/","","http://app.eazyhost.in/visit_kochi/uploads/care_list/","http://app.eazyhost.in/visit_kochi/uploads/enjoy_list/"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.png")!)
         homelink = home[btag] + id
        print(homelink)
        tableview.delegate = self
        tableview.dataSource = self
        
        actv.startAnimating()
        DispatchQueue.main.async {
            
            
           self.jdata = self.getdata()
            
            //  self.tableView.reloadData()
            
        }
    }
    
    func getdata() -> NSDictionary {
        
        
       
        
        let request = NSMutableURLRequest(url: URL( string:homelink )!)
        let session = URLSession.shared
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest,
                                    completionHandler: { (data, response, error) in
                                        
                                        
                                        do {
                                            self.jsonData1 = try! JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.mutableContainers ) as! NSDictionary
                                            
                                            print("jsonData : \(self.jsonData1)")
                                            
                                            self.jdata = self.jsonData1
                                            
                                            self.datasend (jdata: self.jdata)
                                            
                                            
                                        }
                                        
        })
        
        
        task.resume()
        
        
        
        return jsonData1
        
        
    }
    
    
    
    
    
    func datasend( jdata:NSDictionary) -> Void {
        
        
        a = jdata["name"]     as! NSArray
        
       // a.filtered(using: )
        
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
        return a.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell2", for: indexPath)as! TableViewCell2
        
        //print(a[indexPath.row])
        cell.lb.textColor = UIColor.blue
        let l = (a[indexPath.row] as AnyObject).value(forKey: "image") as? String
        let ll = imagelink[btag]+l!
        print(ll)
        if let url = NSURL(string: ll) {
            if let data = NSData(contentsOf: url as URL) {
                cell.imag.image = UIImage(data: data as Data)
            }
        }
        
        
        cell.lb.text=(a[indexPath.row] as AnyObject).value(forKey: "name") as? String
        
       
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        
    {
        let tview:details = self.storyboard?.instantiateViewController(withIdentifier: "details")as! details
//        tview.id = id
//        tview.btag = btag
//        tview.index = indexPath.row
        
        
      let v = (a[indexPath.row] as AnyObject).value(forKey: "name") as? String
        tview.v = v!
        
        let v2 = (a[indexPath.row] as AnyObject).value(forKey: "description") as? String
        tview.v2 = v2!
        let v3 = (a[indexPath.row] as AnyObject).value(forKey: "address") as? String
        tview.v3 = v3!
        
            let v4 = (a[indexPath.row] as AnyObject).value(forKey: "contact_number") as? String
                tview.v4 = v4!
        let l = (a[indexPath.row] as AnyObject).value(forKey: "image") as? String
        let ll = imagelink[btag]+l!
        print(ll)
        if let url = NSURL(string: ll) {
            if let data = NSData(contentsOf: url as URL) {
                tview.im.image = UIImage(data: data as Data)
            }
        }
        
        let v5 = (a[indexPath.row] as AnyObject).value(forKey: "map_latitude") as? String
        tview.v5 = v5!
        let v6 = (a[indexPath.row] as AnyObject).value(forKey: "map_longitude") as? String
        tview.v6 = v6!
        
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
