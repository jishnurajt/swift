//
//  ViewController.swift
//  loginswift
//
//  Created by Appzoc on 13/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pass: UITextField!

    @IBOutlet var btn: UIButton!
    @IBOutlet var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnactio0n(_ sender: UIButton) {
        
        if (email.text == "abc" && pass.text == "123") {
//            let sv = mainscreen ()
//            self.present(sv, animated: true, completion: nil)
            let mainscreen:UITabBarController = self.storyboard?.instantiateViewController(withIdentifier: "mainscreen") as! UITabBarController
           // self.navigationController?.pushViewController(mainscreen!, animated: true)
            self.present(mainscreen, animated: true, completion: nil)
        }
        else
        {
        
          let alert = UIAlertView(title: "Error", message: "invalid Email Or Password", delegate:self , cancelButtonTitle: "OK" )
            
            
        alert .show()
        }
        
        
        
        
        
    }


}

