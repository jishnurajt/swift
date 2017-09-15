//
//  ViewController.swift
//  userdelegate
//
//  Created by Appzoc on 25/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,userDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vc2") as! ViewController2
        vc.delegate1 = self
        
       
        
        
   //     changeBackgroundColor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func changeBackgroundColor( _ color: UIColor?) {
        
        
        print("kkkk")
        view.backgroundColor = color
    }

//      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "go" {
//    let vc = segue.destination as! ViewController2
//    
//    vc.delegate1 = self
//    }
//}
   }



