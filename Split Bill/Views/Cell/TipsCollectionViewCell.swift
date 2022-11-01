//
//  TipsCollectionViewCell.swift
//  Split Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class TipsCollectionViewCell: UICollectionViewCell {
    
    let labelCountTips: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.font = Resources.Fonts.systemBold(with: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = Resources.Colors.orangeDark.cgColor
            } else {
                layer.borderWidth = 0
            }
            
        }
    }
    
    //MARK: - Setup func

    private func setupView() {
        addSubview(labelCountTips)
        
        backgroundColor = Resources.Colors.greenDark
        layer.cornerRadius = Resources.Size.cornerRadiusTipsCell
        clipsToBounds = true
    }
    
    
    private func setConstraints() {
        labelCountTips.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelCountTips.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
