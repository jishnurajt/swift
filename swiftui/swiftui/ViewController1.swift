//
//  ViewController1.swift
//  swiftui
//
//  Created by Appzoc on 12/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
var pickerArray = ["Chess","Cricket","Football","Tennis","Volleyball"]
var firstView: UIView!
var secondView: UIView!

class ViewController1:UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        firstView = UIView(frame: CGRect(x: 32, y: 32, width: 128, height: 128))
        secondView = UIView(frame: CGRect(x: 32, y: 32, width: 128, height: 128))
        
        firstView.backgroundColor = UIColor.red
        secondView.backgroundColor = UIColor.blue
        
        secondView.isHidden = true
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        
        perform(#selector(flip), with: nil, afterDelay: 2)
        
        
        
        
        

        // Do any additional setup after loading the view.
        
        let switchDemo = UISwitch(frame:CGRect(x: 100, y:100 , width: 120, height: 50))
        switchDemo.setOn(true, animated: false)
        switchDemo.addTarget(self, action: #selector(switchValueDidChange), for:.valueChanged)
        self.view.addSubview(switchDemo)
        
        
        
        let  slid = UISlider (frame: CGRect(x: 100, y: 150, width: 50, height: 50))
        slid.maximumValue=50
        slid.minimumValue=0
        slid.isContinuous = true
        self.view.addSubview(slid)
        
        
        let pageControl = UIPageControl( frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        pageControl.numberOfPages = 5;
        pageControl.currentPage = 0;
        pageControl.backgroundColor = .brown
        self.view.addSubview (pageControl)
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        let stpr = UIStepper(frame: CGRect(x: 100, y: 420, width: 150, height: 50))
        stpr.wraps=true
        stpr.autorepeat = true
        stpr.maximumValue=20
        self.view.addSubview(stpr)
        
        
        
      
        

        let prgbar = UIProgressView (frame: CGRect(x: 100, y: 480, width: 250, height: 50))
        prgbar.progress = 0.5
        prgbar.progressViewStyle = UIProgressViewStyle .bar
        prgbar.progressTintColor = UIColor .cyan
        self.view.addSubview(prgbar)
        prgbar.bringSubview(toFront: view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        
       
      
        let myPickerView = UIPickerView (frame: CGRect(x: 100, y: 500, width: 100, height: 50))
        myPickerView.showsSelectionIndicator = true
        
        myPickerView.frame = CGRect(x: 100, y: 500, width: 100, height: 50)
        myPickerView.dataSource = self;
        myPickerView.delegate = self;
        self.view.addSubview(myPickerView)
        
        
        
        let mySegmentedControl = UISegmentedControl (items: ["One","Two","Three"])
        mySegmentedControl.frame = CGRect(x: 100, y: 550, width: 250, height: 50)
        mySegmentedControl.selectedSegmentIndex = 1
         mySegmentedControl.tintColor = UIColor.yellow
        mySegmentedControl.backgroundColor = UIColor.black
        mySegmentedControl.addTarget(self, action:#selector(segmentedValueChanged), for: .valueChanged)
        
        self.view.addSubview(mySegmentedControl)
        
        
        
        
        
        
        
            let myToolbar = UIToolbar(frame: CGRect(x: 400, y: 560, width: 500, height: 50))
        myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2+30, y: self.view.bounds.height-20.0)
        myToolbar.barStyle = .blackTranslucent
        myToolbar.tintColor = UIColor.white
        myToolbar.backgroundColor = UIColor.black
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Green", style:.plain, target: self, action: #selector(onClickBarButton))
        myUIBarButtonGreen.tag = 1
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Blue", style:.plain, target: self, action:#selector(onClickBarButton))
        myUIBarButtonBlue.tag = 2
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Red", style:.plain, target: self, action: #selector(onClickBarButton))
        myUIBarButtonRed.tag = 3
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]
        self.view.addSubview(myToolbar)
        
        
        
        
        
        
        
      
        
        
        
        
        
        
        
        
        
        
        
    }
    
        internal func onClickBarButton(sender: UIBarButtonItem) {
            
            switch sender.tag {
                
            case 1:
                self.view.backgroundColor = UIColor.green
            case 2:
                self.view.backgroundColor = UIColor.blue
            case 3:
                self.view.backgroundColor = UIColor.red
            default:
                print("ERROR!!")
            }
        }

        
    func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
    
        
        
    func flip() {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
            firstView.isHidden = true
        })
        
        UIView.transition(with: secondView, duration: 1.0, options: transitionOptions, animations: {
            secondView.isHidden = false
        })
    }

    
        
        
        
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func switchValueDidChange(sender:UISwitch!) -> Void {
        
       
    }
    func addTapped(sender:UISwitch!) -> Void {
        
        
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
     return 1
    }
    

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int

    {
    return (5)
    }

    
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
        {
            return pickerArray[row]
        }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
           self.view.layoutIfNeeded()
        }, completion: nil)
        
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
