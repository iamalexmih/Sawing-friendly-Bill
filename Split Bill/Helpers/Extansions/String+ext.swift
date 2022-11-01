//
//  String+ext.swift
//  Split Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
