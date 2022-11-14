//
//  InputTextFieldView.swift
//  TodoListExample_RxSwift
//
//  Created by 임현규 on 2022/11/14.
//

import Foundation
import UIKit
import SnapKit

class InputTextFieldView: UIView {
    
    // MARK: - Properties
    
    var inputTextField: UITextField = {
            
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.placeholder = "I want to ..."
        textField.font = .systemFont(ofSize: 14)
        textField.adjustsFontSizeToFitWidth = true
        
        return textField
    }()
    
    var todayButton: UIButton = {
        let button = UIButton()
        
        var config = UIButton.Configuration.plain()
        
        let attribute = AttributedString.init("today")
        
        config.attributedTitle = attribute
        config.baseForegroundColor = .lightGray
        
        button.configuration = config
        button.titleLabel?.font = .systemFont(ofSize: 15)
        
        return button
    }()
    
    var addButton: UIButton = {
        let button = UIButton()
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "plus")
        config.baseForegroundColor = .black
        
        button.configuration = config
        
        return button
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Functions

extension InputTextFieldView {
    func configureUI() {
        [inputTextField, todayButton, addButton] .forEach { addSubview($0) }
        
        backgroundColor = UIColor.secondarySystemFill
        
        inputTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.trailing.equalTo(todayButton.snp.leading).inset(10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(34)
        }
        
        todayButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(35)
            $0.trailing.equalTo(addButton.snp.leading).inset(10)
            $0.centerY.equalToSuperview()
        }
        
        addButton.snp.makeConstraints {
            $0.width.height.equalTo(35)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
