//
//  mail.swift
//  week6
//
//  Created by Appzoc on 26/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
import MessageUI

class mail: UIViewController,MFMailComposeViewControllerDelegate {

    @IBAction func send(_ sender: Any) {
        
        let emailTitle: String = "Great Photo and Doc"
        let messageBody: String = "Hey, check this out!"
        let toRecipents: [Any] = ["support@appcoda.com"]
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
    
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents as? [String] ?? [String]())
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      
        }
        
        
        // Do any additional setup after loading the view.
    }

    func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failure: \(error?.localizedDescription)")
               }
        
        // Close the Mail Interface
      //  dismiss(animated: true)
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


