//
//  ViewController.swift
//  week9
//
//  Created by Appzoc on 07/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    
    
    @IBAction func addnames(_ sender: Any) {
        
        
//        let alert = UIAlertController(title: "New name", message: "Add", preferredStyle: .alert)
//        let saveaction = UIAlertAction(title: "save", style: .default){
//        
//            
//            
//            
//        [unowned self]action in
//            guard let UITextField = alert.textFields?.first, let nameTosave = UITextField.text else{  return }
//            
//            
//            
//             guard let UITextField2 = alert.textFields?.last, let nameTosave2 = UITextField2.text else{  return }
//            
//            
//            self.save(name: nameTosave , name2: nameTosave2)
//            self.table.reloadData()
//        
//        
//        
//        }
//        
//        
//        let cancelaction = UIAlertAction(title: "cancel", style: .default)
//        alert.addTextField()
//        alert.addAction(saveaction)
//        alert.addAction(cancelaction)
//        present(alert, animated: true, completion: nil)
//        
//        
//        
        
        
        
        let alert = UIAlertController(title: "Add",
                                      message: "new Car.",
                                      preferredStyle: .alert)
        
        // Add 1 textField (for username)
        
        alert.addTextField { (textField: UITextField) in
           
            textField.placeholder = "Type Car Name"
          
        }
        
        // Add 2nd textField (for password)
        alert.addTextField { (textField: UITextField) in
           
            textField.placeholder = "Type Car Model"
            
        }
        
        // Add 3rd textField (for phone no.)
        alert.addTextField { (textField: UITextField) in
            
            
            textField.placeholder = "CAr price"
            
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            // Get TextFields text
         let carname = alert.textFields![0]
            let carmodel = alert.textFields![1]
           let carprice = alert.textFields![2]
            
          self.save(name: carname.text! , name2: carmodel.text! ,name3: carprice.text!)
           // self.save(name: carname.text!)
                       self.table.reloadData()
            
            
         // print(carname.text)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        
        
        // Add action buttons and present the Alert
        alert.addAction(saveAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    @IBOutlet weak var addname: UIBarButtonItem!
    @IBOutlet weak var table: UITableView!
    
    var cars_name: [NSManagedObject] = []
       //var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CAR "
       // table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    
    
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Car1")
        do {
        //    cars_name = try getContext().fetch(fetchRequest)
            //go get the results
            cars_name = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(cars_name.count)")
            table.reloadData()
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in cars_name as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                print("\(trans.value(forKey: "car_name"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func save(name: String , name2: String , name3: String) {
        
        
        //, name2: String, name3: String
        
       print(name3)
              let entity =
            NSEntityDescription.entity(forEntityName: "Car1",
                                       in: getContext())!
        
        let c = NSManagedObject(entity: entity,
                                     insertInto: getContext())
        
        // 3
        c.setValue(name, forKeyPath: "car_name")
        c.setValue(name2, forKeyPath: "car_model")
        c.setValue(name3, forKeyPath: "car_price")
        
        // 4
        do {
            try getContext().save()
            
            
            cars_name.append(c)
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
    
    return cars_name.count
    
    
    }
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    

    {   let carname = cars_name[indexPath.row]
       
        let cell :TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
    
  //  cell.textLabel?.text = carname.value(forKey: "car_name") as? String
        
       cell.lb1.text = carname.value(forKey: "car_name") as? String
       cell.lb2.text = carname.value(forKey: "car_model") as? String
        cell.lb3.text = carname.value(forKey: "car_price") as? String
        
                    return cell
    
    
    
    
    
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            
            let context:NSManagedObjectContext = getContext()
            context.delete(cars_name[indexPath.row] as NSManagedObject)
            cars_name.remove(at: indexPath.row)
          
            do {
                try getContext().save()
                
                
                          } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }

            tableView.reloadData()
        }
        
        
        
    }
    
    
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
        let selecteditem: NSManagedObject = cars_name[(tableView.indexPathForSelectedRow!).row]
        
        let alert = UIAlertController(title: "edit",
                                      message: " Car Details",
                                      preferredStyle: .alert)
        
        // Add 1 textField (for username)
        
        alert.addTextField { (textField: UITextField) in
                       textField.text = selecteditem.value(forKey: "car_name")  as? String
            
        }
        
        // Add 2nd textField (for password)
        alert.addTextField { (textField: UITextField) in
          
            textField.text = selecteditem.value(forKey: "car_model")  as? String
                    }
        
        // Add 3rd textField (for phone no.)
        alert.addTextField { (textField: UITextField) in
                        textField.text = selecteditem.value(forKey: "car_price")  as? String
            
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            // Get TextFields text
            let carname = alert.textFields![0]
            let carmodel = alert.textFields![1]
            let carprice = alert.textFields![2]
            
            
            
            selecteditem.setValue(carname.text! as String, forKey: "car_name")
                selecteditem.setValue(carmodel.text! as String, forKey: "car_model")
                selecteditem.setValue(carprice.text! as String, forKey: "car_price")
                

            
            do {
                try self.getContext().save()
                
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
           
        

            
            
            
            
            
            
            
            
          //  self.update(name: carname.text! , name2: carmodel.text! ,name3: carprice.text!)
            // self.save(name: carname.text!)
            self.table.reloadData()
            
            
            
            
            
            
            // print(carname.text)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        
        
        // Add action buttons and present the Alert
        alert.addAction(saveAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    }
    

}


//let selecteditem: NSManagedObject = array[(tableView.indexPathForSelectedRow!).row] as! NSManagedObject
//nextViewCont.existingItem = selecteditem
//
//if(existingItem != nil)
//{
//    existingItem.setValue(nametextfield.text! as String, forKey: "name")
//    existingItem.setValue(agetextfield.text! as String, forKey: "age")
//    existingItem.setValue(placetextfield.text! as String, forKey: "place")
//    
//}



