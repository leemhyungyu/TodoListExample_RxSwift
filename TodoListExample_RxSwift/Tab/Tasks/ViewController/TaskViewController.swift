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

    let inputTextFieldView: InputTextFieldView = {
       
        let view = InputTextFieldView()
        
        return view
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
        
        [inputTextFieldView] .forEach { view.addSubview($0) }
        
        inputTextFieldView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
}
