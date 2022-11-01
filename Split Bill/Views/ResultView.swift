//
//  ResultView.swift
//  Split Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class ResultView: UIView {
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = Resources.Fonts.systemBold(with: Resources.Size.topLabelResult)
        label.textColor = Resources.Colors.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "per person".localized()
        label.textAlignment = .center
        label.font = Resources.Fonts.systemRegular(with: Resources.Size.bottomLabelResult)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }
    
    //MARK: - Setup func
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = Resources.Size.cornerRadiusContent
        backgroundColor = Resources.Colors.orangeLight
        
        layer.borderWidth = 2
        layer.borderColor = Resources.Colors.orangeDark.cgColor
        
        addSubview(topLabel)
        addSubview(bottomLabel)
    }
    
    
    private func setupConstraints() {
        
        topLabel.topAnchor.constraint(equalTo: topAnchor, constant: Resources.Size.spaceMinPadding).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: Resources.Size.spaceMinPadding).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
