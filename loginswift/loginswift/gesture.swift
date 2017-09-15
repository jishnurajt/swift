//
//  gesture.swift
//  loginswift
//
//  Created by Appzoc on 18/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class gesture: UIViewController ,UIActionSheetDelegate {
    var plants = ["Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune"]
    var images: [UIImage] = [UIImage(named:"09_mercury.jpg")!,UIImage(named:"09_venus.jpg")!,UIImage(named:"09_earth.jpg")!,UIImage(named:"09_mars.jpg")!,UIImage(named:"09_jupiter.jpg")!,UIImage(named:"09_saturn.jpg")!,UIImage(named:"09_uranus.gif")!,UIImage(named:"09_neptune.jpg")!]
    var row=0;
    
//    @IBAction func leftGesture(_ sender: UISwipeGestureRecognizer) {
//        
//        
//        
//        print("aaa")
//    }
//    
//    @IBAction func rightGesture(_ sender: UISwipeGestureRecognizer) {
//        row += 1
//        imgv.image = images[row]
//        self.view.addSubview(imgv)
//        print("bbbbbb")
//    }
//    
//    
//    
    @IBAction func click(_ sender: Any) {
        
        
        let actionSheet = UIActionSheet(title: "Planet", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: plants[row] as String)
        
        actionSheet.show(in: self.view)
        
        
        
    }
    
    let sw1 = UISwipeGestureRecognizer()
    let sw2 = UISwipeGestureRecognizer()
    

    
    
    @IBOutlet var imgv: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sw1.addTarget(self, action: #selector(self.nextt))
        sw1.direction = UISwipeGestureRecognizerDirection.right
        sw1.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(sw1)
        
        sw2.addTarget(self, action: #selector(self.previous))
        sw2.direction = UISwipeGestureRecognizerDirection.left
        sw2.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(sw2)

        
        

        imgv.image = images[row]
        self.view.addSubview(imgv)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextt()
    {
        if(row>=0 && row != images.count - 1)
        { row += 1
            
            imgv.image = images[row]
            self.view.addSubview(imgv)
           
        }
        
    }
    func previous()
    {
        if(row != 0 &&  row <= images.count - 1)
        { row -= 1
            
            
            imgv.image = images[row]
             self.view.addSubview(imgv)
        }
        
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
