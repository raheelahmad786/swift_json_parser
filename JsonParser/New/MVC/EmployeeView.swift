//
//  EmployeeView.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import UIKit

class EmployeeView<E: Employeable>: UITableViewCell {
    var employee: E? {
        didSet { self.titleLabel.text = employee?.name ?? "N/A"}
    }
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        lbl.numberOfLines = 0
        return lbl
    }()
    private lazy var space: UIView = {
        let viewObj = UIView()
        viewObj.translatesAutoresizingMaskIntoConstraints = false
        return viewObj
    }()
    private lazy var horizontalStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [space, titleLabel])
        st.translatesAutoresizingMaskIntoConstraints = false
        st.axis = .horizontal
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: st.safeAreaLayoutGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: st.safeAreaLayoutGuide.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            space.heightAnchor.constraint(equalTo: st.heightAnchor),
            space.widthAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
        return st
    }()
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [horizontalStackView])
        st.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            horizontalStackView.topAnchor.constraint(equalTo: st.safeAreaLayoutGuide.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: st.safeAreaLayoutGuide.bottomAnchor),
            horizontalStackView.widthAnchor.constraint(equalTo: st.widthAnchor),
            horizontalStackView.heightAnchor.constraint(equalTo: st.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        return st
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addSubview(stackView)
        let constraints = [
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    override func removeFromSuperview() {
        super.removeFromSuperview()
        stackView.removeFromSuperview()
    }
}

extension EmployeeView {
    class var identifier: String {
        return NSStringFromClass(self)
    }
}
