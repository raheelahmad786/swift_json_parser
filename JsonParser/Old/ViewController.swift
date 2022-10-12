//
//  ViewController.swift
//  JsonParser
//
//  Created by Raheel Ahmed on 04/10/2022.
//

import UIKit
import Alamofire

fileprivate class _Employee: Decodable {
    var name:String?
    var email = ""
    var age = 1
    
    init(name: String? = nil, email: String = "", age: Int = 1) {
        self.name = name
        self.email = email
        self.age = age
    }
}

fileprivate class _Employees: Decodable {
    var employees:[_Employee]
    init(employees: [_Employee] = []) {
        self.employees = employees
    }
}

fileprivate class SampleCell:UITableViewCell {
    @IBOutlet var lbl:UILabel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate var employeesList:_Employees = _Employees()
    @IBOutlet var tbleView:UITableView?
    
    
    override func viewDidLoad() {
        
        AF.request("https://mocki.io/v1/51b4858b-094a-45d0-b46a-89b98da24c8f")
          .validate()
          .responseDecodable(of: _Employees.self) { (response) in
            guard let films = response.value else { return }
              self.employeesList = films
              print(films.employees[0].email)
              self.tbleView?.reloadData()
              
          }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesList.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:SampleCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SampleCell;
        cell.lbl?.text = self.employeesList.employees[indexPath.row].name;
        return cell;
    }

}

