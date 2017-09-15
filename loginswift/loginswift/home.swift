//
//  home.swift
//  loginswift
//
//  Created by Appzoc on 14/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class home: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
       
    var index = Int()

    
    var plants = ["Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune"]
    var images: [UIImage] = [UIImage(named:"09_mercury.jpg")!,UIImage(named:"09_venus.jpg")!,UIImage(named:"09_earth.jpg")!,UIImage(named:"09_mars.jpg")!,UIImage(named:"09_jupiter.jpg")!,UIImage(named:"09_saturn.jpg")!,UIImage(named:"09_uranus.gif")!,UIImage(named:"09_neptune.jpg")!]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return plants.count
    }
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
  
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "textCellIdentifier", for: indexPath)
        
            //    let row = indexPath.row
            //    cell.textLabel?.text = plants[row]
        
        let cell1: Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! Cell
        
        cell1.lb.text = plants[indexPath.row]
        
        cell1.img.image = images[indexPath.row]
        

        
        
        
        
                return cell1

     
    }
    
    
    
    private func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
       // self.performSegue(withIdentifier: "pop", sender: self)
       // let popup = pop()
        
      // popup.lb.text = plants[indexPath.row]
       // popup.img.image =
       // print(popup.txt.text)
        
        //let popup = self.storyboard?.instantiateViewController(withIdentifier: "pop") as! pop
      //  self.present(pop1, animated: true, completion: nil)
               // let row = indexPath.row
//        popup.lb.text = plants[indexPath.row]
//        popup.img.image = images[indexPath.row]
        
        
//        let popup = pop()
//        
//         index = indexPath.row
//        let a = index
//        popup.txt = plants[a]
//        popup.txt2 = images[a]
//        popup.row = a
//
//        self.present(popup, animated: true, completion: nil)
//
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            plants.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let popup =  segue.destination as! pop
        
       //  Pass the selected object to the new view; controller.
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let a = indexPath.row
            popup.txt = plants[a]
            popup.txt2 = images[a]
            popup.row = a
        
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
