//
//  2ViewController.swift
//  testSample
//
//  Created by Appzoc on 25/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class _ViewController: UIViewController
{
    var delegate: TestDelegate?

    @IBOutlet weak var myTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func show(_ sender: UIButton)
    {
        
        self.delegate?.toggleLeftPanel(text: myTextField.text!)
        
        
    }

}
