//
//  SumCheckView.swift
//  Sawing friendly Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class SumCheckView: UIView {
    
    let textFieldSumCheck: UITextField = {
        let textField = UITextField()
        //textField.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9529411765, blue: 0.9450980392, alpha: 1)
        textField.backgroundColor = Resources.Colors.orangeLight
        let placeholderText = "E n t e r    t o t a l    b i l l".localized()
        textField.textColor = Resources.Colors.orangeDark
        textField.clearButtonMode = .whileEditing
        textField.tintColor = Resources.Colors.orangeDark
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Resources.Size.cornerRadiusContent
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.font = Resources.Fonts.systemBold(with: 40)
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor: Resources.Colors.gray,
                                                                NSAttributedString.Key.font: Resources.Fonts.systemRegular(with:15)
                                                             ])
        textField.clipsToBounds = true
        
        return textField
    }()
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        setupView()
        setupConstraints()
    }
    
    //MARK: - Setup func
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textFieldSumCheck)
    }
    
    
    private func setupConstraints() {
        textFieldSumCheck.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textFieldSumCheck.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textFieldSumCheck.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textFieldSumCheck.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
