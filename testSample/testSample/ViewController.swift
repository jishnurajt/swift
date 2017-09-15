//
//  ViewController.swift
//  testSample
//
//  Created by Appzoc on 25/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,TestDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func go(_ sender: UIButton)
    {
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "_ViewController") as! _ViewController
    
        secondVC.delegate = self
        
        present(secondVC, animated: true, completion: nil)
        
    }
    
    func toggleLeftPanel(text:String)
    {
        print(text)
    }
    
    

}

protocol TestDelegate
{
    func toggleLeftPanel(text:String)
}

