//
//  TodoCell.swift
//  TodoListExample_RxSwift
//
//  Created by 임현규 on 2022/11/14.
//

import Foundation
import UIKit
import SnapKit

class TodoCell: UITableViewCell {
    
    static let identifier = "TodoCell"
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        
        let pointSize: CGFloat = 13
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize)
        
        var config = UIButton.Configuration.filled()
        config.preferredSymbolConfigurationForImage = imageConfig
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .systemPink
        
        button.configuration = config
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(checkButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        
        let pointSize: CGFloat = 13
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize)
        
        var config = UIButton.Configuration.plain()
        config.preferredSymbolConfigurationForImage = imageConfig
        
        config.image = UIImage(systemName: "xmark.circle.fill")
        config.baseForegroundColor = .lightGray
    
        button.configuration = config
        return button
    }()
    
    var listLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    var straigthView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func checkButtonClicked(_ sender: UIGestureRecognizer) {
        checkButton.isSelected = !checkButton.isSelected
        deleteButton.isHidden = !checkButton.isSelected
        straigthView.isHidden = !checkButton.isSelected
    }
}

extension TodoCell {
    func configureUI() {
        
        selectionStyle = .none

        [checkButton, deleteButton, listLabel, straigthView] .forEach { contentView.addSubview($0) }
        
        deleteButton.isHidden = true
        straigthView.isHidden = true
            
        checkButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(15)
        }
        
        listLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(checkButton.snp.trailing).offset(30)
            $0.width.equalTo(250)
        }
        
        straigthView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(1)
            $0.leading.equalTo(checkButton.snp.trailing).offset(20)
        }
    }
}
