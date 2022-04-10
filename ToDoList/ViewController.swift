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
    }

    
    @IBAction func tapeditButton(_ sender:UIBarButtonItem){
        guard !self.tasks.isEmpty else{return}
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem){
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해 주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: {[weak self] _ in
            guard let title = alert.textFields?[0].text else {return}
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "할 일을 입력해주세요"})
        self.present(alert, animated: true, completion: nil)
    }

}
