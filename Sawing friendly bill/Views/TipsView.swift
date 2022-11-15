//
//  TipsView.swift
//  Sawing friendly Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class TipsView: UIView {

    private let labelTips: UILabel = {
        let label = UILabel()
        label.text = "T i p s ?".localized()
        label.font = Resources.Fonts.systemRegular(with: Resources.Size.labelTips)
        label.textColor = Resources.Colors.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private let collectionViewForTips: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    let tipsArray: [Double] = [0, 10, 15, 20]
    var selectedTips: Double = 0
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
        setupDelegate()
    }
    
    
    //MARK: - Setup func
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelTips)
        addSubview(collectionViewForTips)
        collectionViewForTips.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    
    private func setupConstraints() {
        labelTips.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelTips.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        collectionViewForTips.topAnchor.constraint(equalTo: labelTips.bottomAnchor, constant: Resources.Size.spaceMinPadding).isActive = true
        collectionViewForTips.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionViewForTips.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionViewForTips.heightAnchor.constraint(equalToConstant: Resources.Size.tipsCollectionViewCell).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    //MARK: - Collection View Delegate

extension TipsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupDelegate() {
        collectionViewForTips.delegate = self
        collectionViewForTips.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionViewForTips.frame.width/5,
               height: Resources.Size.tipsCollectionViewCell)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedTips = tipsArray[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tipsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewForTips.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let labelTipsInt = Int(tipsArray[indexPath.row])
        cell.labelCountTips.text = "\(labelTipsInt)%"
        let zeroTips = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: zeroTips, animated: false, scrollPosition: [])
        
        return cell
    }
}
