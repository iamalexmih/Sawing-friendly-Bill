//
//  CalculateButtonView.swift
//  Sawing friendly Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class CalculateButtonView: UIView {

     lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = Resources.Fonts.systemBold(with: 30)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Resources.Colors.greenDark
        button.setTitle("Calculate".localized(), for: .normal)
        button.layer.cornerRadius = Resources.Size.cornerRadiusContent
        button.clipsToBounds = true
        
        return button
    }()

    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }

    
    //MARK: - Setup func
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(calculateButton)
    }
    
    private func setConstraints() {
        calculateButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
