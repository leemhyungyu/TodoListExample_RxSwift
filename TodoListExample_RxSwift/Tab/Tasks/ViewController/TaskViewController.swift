//
//  TaskViewController.swift
//  TodoListExample_RxSwift
//
//  Created by 임현규 on 2022/11/14.
//

import UIKit
import SnapKit

class TaskViewController: UIViewController {
    
    // MARK: - Properties

    let viewModel = TaskViewModel()
    
    let inputTextFieldView: InputTextFieldView = {
       
        let view = InputTextFieldView()
        
        return view
    }()
    
    lazy var todoTableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.identifier)
        tableView.register(TodoHeaderView.self, forHeaderFooterViewReuseIdentifier: TodoHeaderView.identifier)
        
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - Functions

extension TaskViewController {

    func configureUI() {
        view.backgroundColor = .white
        
        [inputTextFieldView, todoTableView] .forEach { view.addSubview($0) }
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.separatorStyle = .none
        todoTableView.sectionFooterHeight = 0
        
        inputTextFieldView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        todoTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(inputTextFieldView.snp.top)
        }
    }
}

extension TaskViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numOfsection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension TaskViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier, for: indexPath) as? TodoCell else { return UITableViewCell() }
        
        cell.listLabel.text = "test"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TodoHeaderView.identifier) as? TodoHeaderView else { return UITableViewHeaderFooterView() }
        
        headerView.titleLabel.text = viewModel.sectionTitle(sectionNum: section)
        
        return headerView
    }
}
