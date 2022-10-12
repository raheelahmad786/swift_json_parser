//
//  Models.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import Foundation


// Abstract Employee
protocol Employeable: CodableModel {
    var name: String? {get set}
    var email: String {get set}
    var age: Int {get set}
    
}
// Abstract EmployeeList
protocol EmployeableList: CodableModel {
    associatedtype EmployeeType: Employeable
    var employees: [EmployeeType] {get set}
}



// Employee Implementation
struct Employee: Employeable {
    var name:String?
    var email = ""
    var age = 1
}

// General Employee List Implementation
/// You can create a hard list by this EmployeeList<_Employee> or any other you want.
typealias Employees = EmployeeList<Employee>
struct EmployeeList<E: Employeable>: EmployeableList {
    typealias EmployeeType = E
    var employees: [E]
}



