//
//  EntryViewController.swift
//  todoListApp
//
//  Created by Danielle Kaye on 6/26/24.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var update:(()-> Void)? // Need to review??? 

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
       
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn( _ textField:UITextField) -> Bool{
        
        // Function called saveTask
        saveTask()
        
        return true
        
    }

    
    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        // Going to save a count of how many tasks we have so far
        // Going to give the tasks a given number
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount,forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
        
        
    
    }


}
