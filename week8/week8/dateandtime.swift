//
//  dateandtime.swift
//  week8
//
//  Created by Appzoc on 01/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit

class dateandtime: UIViewController {

    @IBOutlet weak var dat: UILabel!
    @IBOutlet weak var tim: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        weak var timer: Timer?
        
        
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                
                

        
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        self?.dat.text = result
       
        
      
        
      //  repeat{
          //  sleep(1)
        
        
        
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        self?.tim.text = "\(hour):\(minutes):\(seconds)"
      //  }while 1 == 1
            
        
            }
        
        
            
            
            
        }
        
        
        
        
        
        
        
        
        
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
