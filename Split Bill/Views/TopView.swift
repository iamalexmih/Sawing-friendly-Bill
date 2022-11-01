//
//  TopView.swift
//  Split Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class TopView: UIView {

    private let toplabel: UILabel = {
        let label = UILabel()
        label.text = "S p l i t     B i l l".localized()
        label.font = Resources.Fonts.systemRegular(with: Resources.Size.topLabel)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let imagePeople: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "topImage")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
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
        
        addSubview(toplabel)
        addSubview(imagePeople)
    }
    
    
    private func setupConstraints() {
        toplabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        toplabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        imagePeople.topAnchor.constraint(equalTo: toplabel.bottomAnchor, constant: 10).isActive = true
        imagePeople.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imagePeople.heightAnchor.constraint(equalToConstant: Resources.Size.topImage).isActive = true
        imagePeople.widthAnchor.constraint(equalToConstant: Resources.Size.topImage).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
