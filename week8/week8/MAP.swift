//
//  MAP.swift
//  week8
//
//  Created by Appzoc on 31/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
import MapKit

class MAP: UIViewController , UIGestureRecognizerDelegate {

    @IBOutlet weak var mapview: MKMapView!
    override func viewDidLoad() {
        zoomToRegion()
        
    }
    
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func zoomToRegion() {
       
        let location = CLLocationCoordinate2D(latitude: 9.9971, longitude: 76.3028)
        
        let region = MKCoordinateRegionMakeWithDistance(location, 5000.0, 7000.0)
        
        
         let myAn1 = MyAnnotation(title: "Office", coordinate: location, subtitle: "MyOffice")
        mapview.setRegion(region, animated: true)
        mapview.addAnnotation(myAn1)
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


class MyAnnotation: NSObject,MKAnnotation {
    
    var title : String?
    var subTit : String?
    var coordinate : CLLocationCoordinate2D
    
    init(title:String,coordinate : CLLocationCoordinate2D,subtitle:String){
        
        self.title = title;
        self.coordinate = coordinate;
        self.subTit = subtitle;
        
    }
    
}
