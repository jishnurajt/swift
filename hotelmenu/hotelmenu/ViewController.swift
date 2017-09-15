//
//  ViewController.swift
//  hotelmenu
//
//  Created by Appzoc on 21/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate{
    
    
    var food = ["chappathi","curry","lassi","mutton","paneer","tikka"]
    var image:[UIImage] = [UIImage(named:"chappathi.jpg")!, UIImage(named:"curry.jpg")!, UIImage(named:"lassi.jpg")!, UIImage(named:"matton.jpg")!, UIImage(named:"paneer.jpg")!, UIImage(named:"tikka.jpg")! ]
    
    var price = ["123","342","634","643","786","674"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    { return food.count  }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
 
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for:indexPath as IndexPath) as! CollectionViewCell
        cell.name.text = food[indexPath.row]
        cell.img.image = image[indexPath.row]
        
        
        
        
        
        
        return cell}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    
     return food.count
    
    
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
  
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
    
        let tcell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! TableViewCell
        tcell.title.text = food[indexPath.row]
        tcell.price.text = price[indexPath.row]
    
    
    return tcell
    
   }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//    
//    let cell = TableViewCell()
//        cell.btn?.addTarget(self, action: #selector(ViewController.next(_:)), for: UIControlEvents.touchUpInside)
//    
//    
//    
//    }
//    
//
//
//
//    func next (_sender:UIButton)  {
//        
//    }
//    
    
    
    
}

