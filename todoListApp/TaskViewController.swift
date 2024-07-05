//
//  TaskViewController.swift
//  todoListApp
//
//  Created by Danielle Kaye on 6/26/24.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    
    // This function will decrement the count because we are removing a task item
    @objc func deleteTask(){
       
      //  let newCount = count -1
        
     //   UserDefaults().SetValue(newCount, forKey: "count")
    //  UserDefaults().SetValue(nil, forkey: "task_\(currentPosition)")
                                
        
    }
    

    

}
