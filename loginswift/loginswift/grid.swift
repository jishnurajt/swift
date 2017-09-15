//
//  grid.swift
//  loginswift
//
//  Created by Appzoc on 17/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class grid: UIViewController,UICollectionViewDataSource ,UICollectionViewDelegate {
    @IBOutlet weak var collw: UICollectionView!
    var index = Int()
    var planets = ["Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune"]
    var images: [UIImage] = [UIImage(named:"09_mercury.jpg")!,UIImage(named:"09_venus.jpg")!,UIImage(named:"09_earth.jpg")!,UIImage(named:"09_mars.jpg")!,UIImage(named:"09_jupiter.jpg")!,UIImage(named:"09_saturn.jpg")!,UIImage(named:"09_uranus.gif")!,UIImage(named:"09_neptune.jpg")!]
    
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
        
        return planets.count
        
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let CCell:CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for:indexPath) as! CollectionCell
        
        CCell.lb.text = planets[indexPath.row]
        CCell.img.image = images[indexPath.row]
          CCell.btn?.layer.setValue(indexPath.row, forKey: "index")
         CCell.btn?.addTarget(self, action: #selector(grid.deletePhoto(_:)), for: UIControlEvents.touchUpInside)
       // collw.reloadData()
        
        return CCell
        
    }
 
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        index = indexPath.row
        
        
        
        
        
    }
    func deletePhoto(_ sender:UIButton) {
        
        let i : Int = (sender.layer.value(forKey: "index")) as! Int
       
        planets.remove(at: i)
        images.remove(at: i)
        DispatchQueue.main.async {
            self.collw.reloadData()
        }
        
        print(planets)
      
    }

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let popup =  segue.destination as! pop
        
        // Pass the selected object to the new view controller.
        //        if let indexPath = self.tableView.indexPathForSelectedRow {
        let a = index
        popup.txt = planets[a]
        popup.txt2 = images[a]
        popup.row = a
        
        
        
        
        // Pass the selected object to the new view controller.
    }
    
    
      //
    //    
    
}
//import UIKit
//
//let reuseIdentifier = "Cell"
//
//class AlbumViewController: UICollectionViewController {
//    
//    var Albums = Array<String>()
//    
//    @IBAction func EditAlbumPressed(_ sender : AnyObject) {
//        
//        if(self.navigationItem.rightBarButtonItem?.title == "Edit"){
//            
//            self.navigationItem.rightBarButtonItem?.title = "Done"
//            
//            //Looping through CollectionView Cells in Swift
//            //http://stackoverflow.com/questions/25490380/looping-through-collectionview-cells-in-swift
//            
//            for item in self.collectionView!.visibleCells as! [AlbumCell] {
//                
//                let indexpath : NSIndexPath = self.collectionView!.indexPath(for: item as AlbumCell)! as NSIndexPath
//                let cell : AlbumCell = self.collectionView!.cellForItem(at: indexpath as IndexPath) as! AlbumCell
//                
//                //Profile Picture
//                //var img : UIImageView = cell.viewWithTag(100) as UIImageView
//                //img.image = UIImage(named: "q.png") as UIImage
//                
//                //Close Button
//                let close : UIButton = cell.viewWithTag(102) as! UIButton
//                close.isHidden = false
//            }
//        } else {
//            self.navigationItem.rightBarButtonItem?.title = "Edit"
//            self.collectionView?.reloadData()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        Albums = ["a.png",  "b.png", "c.png", "d.png", "e.png", "f.png", "g.png", "h.png", "i.png", "j.png", "k.png", "l.png", "m.png"]
//    }
//    
//    /*
//     // #pragma mark - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//     {
//     // Get the new view controller using [segue destinationViewController].
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//    // #pragma mark UICollectionViewDataSource
//    
//    override func numberOfSections(in collectionView: UICollectionView?) -> Int {
//        return 1
//    }
//    
//    
//    override func collectionView(_ collectionView: UICollectionView?, numberOfItemsInSection section: Int) -> Int {
//        return Albums.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        /*
//         We can use multiple way to create a UICollectionViewCell.
//         */
//        
//        
//        //1.
//        //We can use Reusablecell identifier with custom UICollectionViewCell
//        
//        /*
//         let cell = collectionView!.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
//         
//         var AlbumImage : UIImageView = cell.viewWithTag(100) as UIImageView
//         AlbumImage.image = UIImage(named: Albums[indexPath.row])
//         */
//        
//        
//        
//        //2.
//        //You can create a Class file for UICollectionViewCell and Set the appropriate component and assign the value to that class
//        
//        let cell : AlbumCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AlbumCell
//        cell.backgroundView = UIImageView(image: UIImage(named: "photo-frame.png")) as UIView
//        cell.AlbumImage?.image = UIImage(named: Albums[indexPath.row])
//        
//        if self.navigationItem.rightBarButtonItem!.title == "Edit" {
//            cell.CloseImage?.isHidden = true
//        } else {
//            cell.CloseImage?.isHidden = false
//        }
//        
//        //Layer property in Objective C => "http://iostutorialstack.blogspot.in/2014/04/how-to-assign-custom-tag-or-value-to.html"
//        cell.CloseImage?.layer.setValue(indexPath.row, forKey: "index")
//        
//        
//        cell.CloseImage?.addTarget(self, action: #selector(AlbumViewController.deletePhoto(_:)), for: UIControlEvents.touchUpInside)
//        return cell
//    }
//    
//    func deletePhoto(_ sender:UIButton) {
//        let i : Int = (sender.layer.value(forKey: "index")) as! Int
//        Albums.remove(at: i)
//        self.collectionView!.reloadData()
//    }
//}
