//
//  ViewController.swift
//  Sawing friendly Bill
//
//  Created by Алексей Попроцкий on 01.11.2022.
//

import UIKit



class ViewController: UIViewController {

    private let topView = TopView()
    private let sumCheckView = SumCheckView()
    private let personsCountView = PersonsCountView()
    private let tipsView = TipsView()
    private let calculateButtonView = CalculateButtonView()
    private let resultView = ResultView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButtonView.calculateButton.addTarget(self, action: #selector(calculateButtonPress), for: .touchUpInside)
        
        setupView()
        setupConstraints()
        setupTapForHideKeyboard()
    }
    
    
    @objc func calculateButtonPress() {
        guard let sumCheckCount = sumCheckView.textFieldSumCheck.text,
              let sumCheckCountDouble = Double(sumCheckCount),
              sumCheckCountDouble < Double(Int.max)
        else {
            UIView.transition(with: resultView,
                              duration: 0.3,
                              options: .transitionCrossDissolve) { [weak self] in
                self?.resultView.topLabel.text = "Введите корректное число"
                self?.resultView.bottomLabel.isHidden = true
                
            }
            return
        }
        
        let sum = sumCheckCountDouble + sumCheckCountDouble * tipsView.selectedTips / 100
        let persons = Double(personsCountView.countPerson)
        let result = Int(sum / persons)
        
        UIView.transition(with: resultView,
                          duration: 0.3,
                          options: .transitionCrossDissolve) { [weak self] in
            self?.resultView.topLabel.text = "\(result)"
            self?.resultView.bottomLabel.isHidden = false
        }
    }

    
    private func setupTapForHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    //MARK: - Setup func

    private func setupView() {
        view.backgroundColor = Resources.Colors.orangeBackground

        view.addSubview(topView)
        view.addSubview(sumCheckView)
        view.addSubview(personsCountView)
        view.addSubview(tipsView)
        view.addSubview(calculateButtonView)
        view.addSubview(resultView)
    }
}


    //MARK: - Constraints

extension ViewController {
    private func setupConstraints() {
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Resources.Size.topView).isActive = true
        
        
        resultView.bottomAnchor.constraint(equalTo: sumCheckView.topAnchor,
                                        constant: -Resources.Size.padding).isActive = true
        resultView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultView.widthAnchor.constraint(equalToConstant: Resources.Size.widthContent).isActive = true
        resultView.heightAnchor.constraint(equalToConstant: Resources.Size.resultViewHeight).isActive = true
        
        
        sumCheckView.bottomAnchor.constraint(equalTo: personsCountView.topAnchor,
                                         constant: -Resources.Size.padding).isActive = true
        sumCheckView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sumCheckView.widthAnchor.constraint(equalToConstant: Resources.Size.widthContent).isActive = true
        sumCheckView.heightAnchor.constraint(equalToConstant: Resources.Size.viewItemHeight).isActive = true
       
        
        personsCountView.bottomAnchor.constraint(equalTo: tipsView.topAnchor,
                                                 constant: -Resources.Size.padding).isActive = true
        personsCountView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        personsCountView.widthAnchor.constraint(equalToConstant: Resources.Size.widthContent).isActive = true
        personsCountView.heightAnchor.constraint(equalToConstant: Resources.Size.viewItemHeight).isActive = true
        
        
        tipsView.bottomAnchor.constraint(equalTo: calculateButtonView.topAnchor,
                                         constant: -Resources.Size.padding).isActive = true
        tipsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tipsView.widthAnchor.constraint(equalToConstant: Resources.Size.widthContent).isActive = true
        tipsView.heightAnchor.constraint(equalToConstant: Resources.Size.tipsCollectionView).isActive = true
        
        
        calculateButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                    constant: -Resources.Size.buttonBottomSpace).isActive = true
        calculateButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButtonView.widthAnchor.constraint(equalToConstant: Resources.Size.widthContent).isActive = true
        calculateButtonView.heightAnchor.constraint(equalToConstant: Resources.Size.viewItemHeight).isActive = true
    }
}

