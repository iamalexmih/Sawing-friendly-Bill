//
//  PersonsCountView.swift
//  Split Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class PersonsCountView: UIView {

    var countPerson = 2
    
    let countPersonlabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = Resources.Fonts.systemBold(with: 50)
        label.textColor = Resources.Colors.orangeDark
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let viewMiddle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Resources.Size.cornerRadiusContent
        view.backgroundColor = Resources.Colors.orangeLight
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private let personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "persons")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        var image = UIImage(named: "plus")
        image = image?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusButtonPress), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        var image = UIImage(named: "minus")
        image = image?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        
        button.addTarget(self, action: #selector(minusButtonPress), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Button action

    @objc func plusButtonPress() {
        countPerson += 1
        countPersonlabel.text = "\(countPerson)"
        minusButton.isEnabled = true
    }
    
    @objc func minusButtonPress() {
        countPerson -= 1
        countPersonlabel.text = "\(countPerson)"
        if countPerson == 2 {
            minusButton.isEnabled = false
        }
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    //MARK: - Setup func
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(plusButton)
        addSubview(minusButton)
        addSubview(viewMiddle)
        
        viewMiddle.addSubview(personImage)
        viewMiddle.addSubview(countPersonlabel)
    }
    
    
    
    private func setupConstraints() {
        minusButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        minusButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        minusButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: Resources.Size.viewItemHeight).isActive = true
        
        
        viewMiddle.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor).isActive = true
        viewMiddle.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor).isActive = true
        viewMiddle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewMiddle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        
        personImage.leadingAnchor.constraint(equalTo: viewMiddle.leadingAnchor,
                                             constant: Resources.Size.spaceMinPadding*3).isActive = true
        personImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        personImage.widthAnchor.constraint(equalToConstant: Resources.Size.viewItemHeight).isActive = true


        countPersonlabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        countPersonlabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor).isActive = true
        countPersonlabel.trailingAnchor.constraint(equalTo: viewMiddle.trailingAnchor).isActive = true
        
        
        plusButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        plusButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        plusButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: Resources.Size.viewItemHeight).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
