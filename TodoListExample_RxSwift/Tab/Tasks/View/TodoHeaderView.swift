//
//  TodoHeaderView.swift
//  TodoListExample_RxSwift
//
//  Created by 임현규 on 2022/11/15.
//

import Foundation
import UIKit
import SnapKit

class TodoHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "TodoHeaderView"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "test"
        return label
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodoHeaderView {
    func configureUI() {
        [titleLabel] .forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview()
        }
    }
}
