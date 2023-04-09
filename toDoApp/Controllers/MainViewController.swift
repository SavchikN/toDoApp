//
//  ViewController.swift
//  toDoApp
//
//  Created by Nikita Savchik on 02/04/2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Your ToDo list:"
        title.font = UIFont(name: "Avenir Next Bold", size: 30)
        title.textColor = .black
        return title
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var navBarButton: UIBarButtonItem!
    var doList: [DoList] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(barButtonTapped)
        )
        
        setDelegates()
        setupNavBar()
        setupViews()
        setConstrains()
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func setupNavBar() {
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = navBarButton
    }
    
    @objc func barButtonTapped() {
        let navigationVC = UINavigationController()
        navigationVC.setViewControllers([SettingsViewController()], animated: true)
        present(navigationVC, animated: true)
    }
}

extension MainViewController {
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.trailing.equalTo(view.snp.trailing).inset(10)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).inset(50)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let doList = doList[indexPath.row]
        cell.textLabel?.text = doList.name
        cell.detailTextLabel?.text = doList.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doList.count
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVC = InfoViewController()
        infoVC.nameLabel.text = doList[indexPath.row].name
        infoVC.descriptionLabel.text = doList[indexPath.row].description
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            doList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        tableView.reloadData()
    }
}

// MARK: - Alert Controller

extension MainViewController {
    private func showAlert(title: String, status: String) {
        let alert = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addTextField { textField in
            textField.placeholder = "task"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "description"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            if let name = alert.textFields?.first?.text, let description = alert.textFields?.last?.text {
//                let newTask = DoList(name: name, description: description, importance: )
//                self.doList.append(newTask)
            }
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
