//
//  ViewController.swift
//  Core-Data-Demo
//
//  Created by Ajay Kumar on 05/02/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Ajay kumar", forKey: "name")
        newUser.setValue(24, forKey: "age")
        newUser.setValue("Ajay@123", forKey: "password")
        
        do {
            
            try context.save()
            print("Data are saved")
            print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")

            
        }catch {
            
            print("Error")
        }
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do{
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "name") as? String {
                        print(username)
                    }
                    
                }
            }else{
                print("error")
            }
        }catch{
            print("do notfech request")
        }
        
    }


}

