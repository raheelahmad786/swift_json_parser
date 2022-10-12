//
//  EmployeeController.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import UIKit

class EmployeeListViewController<E: EmployeableList>: BaseVC<AFService<AFGetRequest, E>>, UITableViewDataSource {
    typealias C = EmployeeView<E.EmployeeType>
    
    var tableView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    lazy var stackView: UIStackView = {
        tableView.dataSource = self
        tableView.register(C.self, forCellReuseIdentifier: C.identifier)
        let st = UIStackView(arrangedSubviews: [tableView])
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    override var model: E? {
        didSet { self.tableView.reloadData() }
    }
    override func loadView() {
        super.loadView()
        view = stackView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (model?.employees.count) ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: C.identifier) as? C, let emp = model?.employees[indexPath.row] {
            cell.employee = emp
            return cell
        }
        return UITableViewCell()
    }
}



