//
//  ViewController.swift
//  ToDoList
//
//  Created by 선민재 on 2022/04/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    var tasks = [Task]() {
        didSet {
            
            //self.saveTasks()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appear = UINavigationBarAppearance()
        appear.configureWithOpaqueBackground()
        self.navigationController?.navigationBar.standardAppearance = appear
        self.navigationController?.navigationBar.scrollEdgeAppearance = appear
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }


}
