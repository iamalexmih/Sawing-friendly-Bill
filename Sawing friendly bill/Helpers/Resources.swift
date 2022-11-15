//
//  Resources.swift
//  Sawing friendly Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit


enum Resources {
    enum Colors {
        static let greenDark = UIColor(hexString: "#2DB894")

        static let orangeLight = UIColor(hexString: "#FFEDDC")
        static let orangeDark = UIColor(hexString: "#FFA326")
        static let orangeBackground = UIColor(hexString: "#FFF9F3")
        
        static let gray = UIColor(hexString: "#757575")
    }
    
    enum Images {
        static let topImage = UIImage(named: "topImage")
        static let addPeople = UIImage(named: "persons")
        static let buttonPlus = UIImage(named: "plus")
        static let buttonMinus = UIImage(named: "minus")
    }
    
    enum Fonts {
        static func systemRegular(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size)
        }
        static func systemBold(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .heavy)
        }
    }
    
    enum Size {
        static let tipsCollectionViewCell = UIScreen.main.bounds.height/24
        static let tipsCollectionView = tipsCollectionViewCell+labelTips+spaceMinPadding
        
        static let viewItemHeight = UIScreen.main.bounds.height/11.6
        static let resultViewHeight = UIScreen.main.bounds.height/8.3
        
        static let topView = topLabel+topImage+(spaceMinPadding*2)
        static let topImage = UIScreen.main.bounds.height/4.4
        
        static let buttonBottomSpace = CGFloat(8)
        
        static let spaceMinPadding = CGFloat(5)
        static let padding = UIScreen.main.bounds.height/28
        static let widthContent = UIScreen.main.bounds.height/2.4
        
        static let cornerRadiusContent = CGFloat(15)
        static let cornerRadiusTipsCell = CGFloat(UIScreen.main.bounds.height/48)
        
        static let labelTips = CGFloat(10)
        static let topLabel = CGFloat(25)
        static let topLabelResult = resultViewHeight/2.4
        static let bottomLabelResult = resultViewHeight/3.8
    }
}
