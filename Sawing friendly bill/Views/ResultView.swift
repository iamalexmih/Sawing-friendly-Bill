//
//  ResultView.swift
//  Sawing friendly Bill
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
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "per person".localized()
        label.textAlignment = .center
        label.font = Resources.Fonts.systemRegular(with: Resources.Size.bottomLabelResult)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        return stackView
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }
    
    //MARK: - Setup View and Constraints func
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = Resources.Size.cornerRadiusContent
        backgroundColor = Resources.Colors.orangeLight
        
        layer.borderWidth = 2
        layer.borderColor = Resources.Colors.orangeDark.cgColor
        
        
        addSubview(stackView)
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(bottomLabel)
    }
    
    
    private func setupConstraints() {
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: Resources.Size.spaceMinPadding).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Resources.Size.spaceMinPadding*2).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Resources.Size.spaceMinPadding*2).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Resources.Size.spaceMinPadding).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
