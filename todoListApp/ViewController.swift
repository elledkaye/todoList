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
        // Do any additional setup after loading the view.
    
        //Get all current saved tasks
    }
    
    // Action is gonna handle
    @IBAction func didTapAdd(){
        // Going to show another view controller
        
        let vc = storyboard?.instantiateViewController(identifier:"entry") as! EntryViewController
        vc.title = "New Task"
        navigationController?.pushViewController(vc, animated: true)
    }
}

//QUESTION: what are extensions????
extension ViewController: UITableViewDelegate {
    
    //wanna handle taps on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        
        
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
