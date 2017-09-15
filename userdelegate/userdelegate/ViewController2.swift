//
//  ViewController2.swift
//  userdelegate
//
//  Created by Appzoc on 25/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
 var delegate1:userDelegate?
    
   var a = UIColor()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController2.Long))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController2.Tap))
         tapGesture.numberOfTapsRequired = 2
       // red.addGestureRecognizer(longGesture)
        blue.addGestureRecognizer(longGesture)
        //red.addGestureRecognizer(tapGesture)
        blue.addGestureRecognizer(tapGesture)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    @IBAction func close(_ sender: Any) {
//        
//         navigationController?.dismiss(animated: true)
//    }
    func Tap() {
        
        print("Tap happend")
        self.view.backgroundColor = getRandomColor()
        //delegate1?.changeBackgroundColor(view.backgroundColor)

    }
    
    func Long() {
        
        print("Long press")
         a = getRandomColor()
        self.view.backgroundColor = a
        delegate1?.changeBackgroundColor(a)
        print(a)
        
    }
    
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
       
    
    
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var close: UIButton!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
