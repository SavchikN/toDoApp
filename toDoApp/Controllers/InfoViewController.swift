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
    
    let statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.3
        view.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
        setConstraints()
    }
    
    private func setupNavBar() {
        title = "Info about task"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(statusView)
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
        
        statusView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-15)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        statusView.layoutIfNeeded()
        statusView.layer.cornerRadius = statusView.frame.size.width / 2
    }
}
