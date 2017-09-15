//
//  ViewController.swift
//  vk
//
//  Created by Appzoc on 29/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
var t = NSArray()

class ViewController: UIViewController {
  
    @IBOutlet weak var btt: UIButton!
    @IBOutlet weak var button: UIButton!
 
    @IBAction func click(_ sender: UIButton) {
        print(sender.tag)
        
        
        let tview:ViewController4 = self.storyboard?.instantiateViewController(withIdentifier: "table")as! ViewController4
       tview.btag = sender.tag
        
       self.navigationController!.pushViewController(tview, animated: true)
        
    }
    
    @IBOutlet var bttn: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

