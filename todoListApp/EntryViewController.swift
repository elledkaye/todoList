//
//  EntryViewController.swift
//  todoListApp
//
//  Created by Danielle Kaye on 6/26/24.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
       
    }
    
    func textFieldShouldReturn( _ textField:UITextField) -> Bool{
        
        // Function called saveTask
        saveTask()
        
        return true
        
    }

    
    @IBAction func saveTask(){
        
        
        
    }


}
