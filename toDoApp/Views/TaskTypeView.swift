//
//  TaskTypeView.swift
//  toDoApp
//
//  Created by Nikita Savchik on 09/04/2023.
//

import UIKit
import SnapKit

class TaskTypeView: UIView {
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Select task type:"
        title.font = UIFont(name: "Avenir Next Medium", size: 20)
        title.textColor = .black
        return title
    }()
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let typeTask = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)]
    var selectedType = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(collectionView)
        collectionView.register(TypeTaskCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension TaskTypeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TypeTaskCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = typeTask[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
}

extension TaskTypeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            selectedType = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case 2:
            selectedType = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        default:
            selectedType = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
}

extension TaskTypeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: collectionView.frame.width / 4,
            height: collectionView.frame.width / 4
        )
    }
}

extension TaskTypeView {
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(10)
            make.leading.equalTo(snp.leading).inset(5)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.leading.equalTo(snp.leading).inset(0)
            make.trailing.equalTo(snp.trailing).inset(0)
            make.height.equalTo(100)
        }
    }
}


