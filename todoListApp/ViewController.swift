//
//  ViewController.swift
//  todoListApp
//
//  Created by Danielle Kaye on 6/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    //Another thing we need to implement is the tableView deletegate and the datasource which supplies the data and handles the cells on the tableview
    
    //This @IBOutlet lets us control the table view on the storyboard
    @IBOutlet var tableView: UITableView!
    
    
    //Array of tasks to hold tasks that user has entered and data type is String
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Setup
        // If this isn't set up we want to set some initial defualts
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().setValue(true, forKey: "setup") // Once we've set up on the first launch won't come back in here
            // Also want to set a value for that key
            UserDefaults().set(0, forKey: "count") // Number of tasks we currently have
            
        }
        // Get all current saved tasks
        updateTasks()
    
    }
    
    func updateTasks(){
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        for x in 0..<count{ // Saying we want to create a for loop that is going to iterate, this is 0 up until this count
            
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String{
                tasks.append(task)
                
                
            } // Want to make sure it's not empty
            
            
        }
        
        // Want to reload our table view
        tableView.reloadData()
        
    } // End of updateTasks function
    
    // Action is gonna handle...
    @IBAction func didTapAdd(){
        // Going to show another view controller
        
        let vc = storyboard?.instantiateViewController(identifier:"entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            // Everytime we call this function in the viewcontroller we want to reload this tableview and refresh the tasks that were saved
            DispatchQueue.main.async{ // What is DispatchQue?? -> basically says we want to make sure we are prioritizing updating the actual tasks
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

//QUESTION: what are extensions????
// Delegate function
extension ViewController: UITableViewDelegate {
    
    //wanna handle taps on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        
        
        
        let vc = storyboard?.instantiateViewController(identifier:"task") as! TaskViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
        
    }// End of function tableView

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection:Int) -> Int{
        return tasks.count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        // Dequing a cell means using the template over and over as to get an instance of a cell
        // and then we're gonna configure the cell,supply the data into the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Come back to time stamp 10:00<---!!!!!!
        cell.textLabel?.text = tasks[indexPath.row]
        
        //we want to return a cell
        return cell
        
    }
    
    
}
