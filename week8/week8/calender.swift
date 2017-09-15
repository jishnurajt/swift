//
//  calender.swift
//  week8
//
//  Created by Appzoc on 01/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class calender: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
  
    //var indexpath = Int()
    
    let month = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
      
        
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        
        
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return 12
        
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let CCell:calenderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:indexPath) as! calenderCell
        
        CCell.month.text = month[indexPath.row]
//        CCell.img.image = images[indexPath.row]
//        CCell.btn?.layer.setValue(indexPath.row, forKey: "index")
//        CCell.btn?.addTarget(self, action: #selector(grid.deletePhoto(_:)), for: UIControlEvents.touchUpInside)
        
        
        return CCell
        
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var view: monthview = self.storyboard?.instantiateViewController(withIdentifier: "monthview") as! monthview
        
        self.navigationController?.pushViewController(view, animated: true)
        //view.index = IndexPath.init(row: 1, section: 0)
  //let    indexPath = collectionView.indexPath
      //  let indexPaths = collectionView.indexPathsForSelectedItems
      //  let indexPath = indexPaths?[0] as! NSIndexPath
        
       // let selectedItem = items[indexPath.row]
     //   print(indexPath.row)
        
        
       view.index = indexPath.row
      
        
        
    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//          let popup =  segue.destination as! monthview
//        
//        let indexPath = collectionView.indexPathsForSelectedItems
//
//        // Pass the selected object to the new view controller.
//    }
//    

}
