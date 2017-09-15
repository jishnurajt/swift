//
//  ViewController.swift
//  swiftui
//
//  Created by Appzoc on 12/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = " Test label"
        self.view.addSubview(label)
        
        
        let button = UIButton(frame: CGRect(x: 100, y:100 , width: 120, height: 50))
        button.setTitle("click", for:UIControlState .normal)
        button.setTitleColor(UIColor .white, for: .normal )
        button.setTitle("done", for:UIControlState .highlighted)
        button.backgroundColor=UIColor .blue
        button.addTarget(self, action:#selector(nextpage), for: UIControlEvents .touchUpInside)
        self.view.addSubview(button)
        
        
        
        let textfield=UITextField(frame: CGRect (x: 100, y:170, width: 200, height: 30))
        textfield.placeholder=" enter name"
        textfield.borderStyle = UITextBorderStyle .bezel
        self.view.addSubview(textfield)
        
        
        let textview=UITextView(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        textview.text=" text view abcdef"
        textview.textColor = UIColor .brown
        self.view.addSubview(textview)
        
        
        
        let imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x: 100, y: 250, width: 100, height: 100))
        imageView.image = UIImage(named:"image.jpg")
        self.view.addSubview(imageView)
        
        
        
        let webV:UIWebView = UIWebView(frame: CGRect(x: 0, y: 370, width: 500, height: 200))
        self.view.addSubview(webV)
        
        let myURL = URL(string: "https://www.google.com")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webV.loadRequest(myURLRequest)
        
        
        
        
        
        
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 100, y: 20, width: 40, height: 40)
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(actInd)
        actInd.startAnimating()
        
        
        
    }
    
    
    
    func nextpage(sender:UIButton!) -> Void {
          let sv = ViewController1 ()
       self.present(sv, animated: true, completion: nil)
//        let ViewController1 = self.storyboard?.instantiateViewController(withIdentifier: "vc1")
//        self.navigationController?.pushViewController(ViewController1!, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

