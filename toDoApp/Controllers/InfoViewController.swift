//
//  InfoViewController.swift
//  toDoApp
//
//  Created by Nikita Savchik on 02/04/2023.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Medium", size: 30)
        label.text = "222"
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.text = "Description"
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
        setConstraints()
    }
    
    func setupNavBar() {
        title = "Info about task"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
    }
}

extension InfoViewController {
    private func setConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-15)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
    }
}
