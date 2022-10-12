//
//  EmployeeVC.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import UIKit

final class EmployeeVC: EmployeeListViewController<EmployeeList<Employee>> {
    required init() {
        super.init(nibName: "EmployeeVC", bundle: nil)
    }
    required init(nibName: String, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
    required init?(coder: NSCoder) {
        super.init()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await fetchEmployee()
        }
    }
    private func fetchEmployee() async {
        do {
            self.model = try await service?.perform()
        }
        catch {
            self.model = nil
        }
    }
}
