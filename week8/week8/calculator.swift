//
//  calculator.swift
//  week8
//
//  Created by Appzoc on 01/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class calculator: UIViewController {
    var isTypingNumber = false
    @IBAction func calculationtapped(_ sender: UIButton) {
        
        isTypingNumber = false
        firstNumber = Int (calcdisplay.text!)!
        operation = sender.title(for: .normal)!
        
        optrion.text = operation
        
        
    }
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    @IBOutlet weak var calculation: UIButton!
    @IBOutlet weak var calcdisplay: UILabel!
    @IBOutlet weak var optrion: UILabel!
    @IBAction func numbertap(_ sender: UIButton) {
        
        let number = sender.title(for: .normal)
        
        if isTypingNumber {
            calcdisplay.text = calcdisplay.text! + number!
        } else {
            calcdisplay.text = number!
            isTypingNumber = true
        }
        
        
    }
   
    @IBAction func equaltapped(_ sender: Any) {
        
         optrion.text = " = "
        
        isTypingNumber = false
        var result = 0
        secondNumber = Int(calcdisplay.text!)!
        
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        }else if operation == "*" {
            result = firstNumber * secondNumber
        }else if operation == "/" {
            result = firstNumber / secondNumber
        }
    
        
        calcdisplay.text = "\(result)"
        
        
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
