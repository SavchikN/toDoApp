//
//  SettingsViewController.swift
//  toDoApp
//
//  Created by Nikita Savchik on 09/04/2023.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter task name:"
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter task description:"
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.textColor = .black
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Avenir Next", size: 18)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        textField.textAlignment = .center
        return textField
    }()
    
    let descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Avenir Next", size: 18)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let taskView = TaskTypeView()
    var mainVC: MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
        setConstraints()
    }
    
    private func setupNavBar() {
        title = "Add new task!"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(nameTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(taskView)
        view.addSubview(saveButton)
    }
    
    @objc func saveButtonTapped() {
        if nameTextField.text == "" {
            showAlert(title: "Oops!", message: "Enter a name for your task!")
        } else if taskView.selectedType == nil {
            showAlert(title: "Oops!", message: "Enter a type for your task!")
        } else {
            let newTask = DoList(name: nameTextField.text!, description: descriptionTextField.text!, status: taskView.selectedType!)
            mainVC?.doList.append(newTask)
            mainVC?.tableView.reloadData()
        }
        
        showAlert(title: "Great!", message: "Task was added!")
    }
}

extension SettingsViewController {
    private func setConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(view.snp.leading).inset(25)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).inset(-10)
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).inset(-20)
            make.leading.equalTo(view.snp.leading).inset(25)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-10)
            make.height.equalTo(80)
            make.width.equalTo(300)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        taskView.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextField.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(130)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(taskView.snp.bottom).inset(-60)
            make.height.equalTo(60)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
}

extension SettingsViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.nameTextField.text = ""
            self.descriptionTextField.text = ""
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
