//
//  contact.swift
//  week6
//
//  Created by Appzoc on 28/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
import ContactsUI

class contact: UIViewController,CNContactPickerDelegate{

    @IBAction func pick(_ sender: Any) {
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lb: UITextField!

    @IBOutlet weak var phone: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func add(_ sender: Any) {
        
        
        let contact = CNMutableContact()
        
     
        
        contact.givenName = lb.text!
        
       
        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:phone.text!))]
        
        
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        try! store.execute(saveRequest)
        
       
        
        
        let alert = UIAlertController(title: "Alert", message: "Successful", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
      
        
        
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                //lb.textContentType = UITextContentType.telephoneNumber
                
                lb.text =  CNContactFormatter.string(from: contact, style: .fullName)
                phone.text = (contact.phoneNumbers[0].value ).value(forKey: "digits") as? String
                print("number is = \(phoneNumber)")
            }
        }
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
    }
    
    
    
    
    
    

}
