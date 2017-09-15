//
//  monthview.swift
//  week8
//
//  Created by Appzoc on 02/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class monthview: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource{
    var index = Int()
var i = 0
     var arry = [Int ()]
    
    let month = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","NOV","DEC"]
        var sum = 0
    let monthday = [31,28,31,30,31,30,31,31,30,31,30,31]
    let day = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(index)
          mont.text = month[index]
        print(monthday[index])
        while i<index {
            sum = sum + monthday[i]
            i = i+1
            
            
        }
        var ii = 0
       var c = 0
        let d = (7 + sum) % 7
        i = 0
        while i<42 {
            
          if (i < d )
          {
            arry.insert(0, at: i)
            
            
            }
           else
          {
            c = i-d
            if ( c < monthday[index])
            {
                
                ii = ii + 1
             arry.insert(ii, at: i)
              
               
            }
        else if (c >= monthday[index])
            
            {arry.insert(0, at: i)
                
           }
        }
            
        i=i+1
        }
       
        
        
        print(arry)
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var mont: UILabel!
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return arry.count
        
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let CCell:dayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "daycell", for:indexPath) as! dayCell
        
        if arry[indexPath.row] == 0 {
             CCell.day.isHidden = true
            CCell.contentView.isHidden = true
          //   cell.layer.borderColor = UIColor.white.cgColor
        }
        else
        {
            CCell.day.text =  String( arry[indexPath.row] ) }
       
        return CCell
        
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
