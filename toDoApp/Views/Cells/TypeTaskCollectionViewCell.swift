//
//  TypeTaskCollectionViewCell.swift
//  toDoApp
//
//  Created by Nikita Savchik on 09/04/2023.
//

import UIKit
import SnapKit

class TypeTaskCollectionViewCell: UICollectionViewCell {
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.3860394955, green: 0, blue: 0.223900795, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        layer.cornerRadius = layer.frame.size.width / 2
    }
}
