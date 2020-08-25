//
//  CalculatorViewController.swift
//  CalcProgRestraints35
//
//  Created by Todd Crandall on 8/25/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    var buttons: [UIButton] {
        return [tenPercentButton, fifteenPercentButton, twentyPercentButton]
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        addAllSubviews()
        constrainAmountTextField()
        setUpButtonStackView()
        setUpLabelStackView()
        setUpFinalStackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemIndigo
        
        activateButton()
    }
    
    //MARK: - Methods
    func addAllSubviews() {
        self.view.addSubview(amountTextField)
        self.view.addSubview(tenPercentButton)
        self.view.addSubview(fifteenPercentButton)
        self.view.addSubview(twentyPercentButton)
        self.view.addSubview(buttonStackView)
        self.view.addSubview(tipAmountLabel)
        self.view.addSubview(finalAmountLabel)
        self.view.addSubview(labelStackView)
        self.view.addSubview(finalStackView)
    }
    
    func constrainAmountTextField() {
        amountTextField.anchor(top: finalStackView.topAnchor, bottom: nil, leading: finalStackView.leadingAnchor, trailing: finalStackView.trailingAnchor, paddingTop: 16, paddingLeading: 20, paddingTrailing: -20, paddingBottom: 30, width: nil, height: 30)
    }
    
    func setUpButtonStackView() {
        buttonStackView.addArrangedSubview(tenPercentButton)
        buttonStackView.addArrangedSubview(fifteenPercentButton)
        buttonStackView.addArrangedSubview(twentyPercentButton)
        
        buttonStackView.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 16).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: amountTextField.leadingAnchor, constant: 0).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 0).isActive = true
        
    }
    
    func setUpLabelStackView() {
        labelStackView.addArrangedSubview(tipAmountLabel)
        labelStackView.addArrangedSubview(finalAmountLabel)
        
        labelStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 16).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: amountTextField.leadingAnchor, constant: 0).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 0).isActive = true
    }
    
    func setUpFinalStackView() {
        finalStackView.addArrangedSubview(amountTextField)
        finalStackView.addArrangedSubview(buttonStackView)
        finalStackView.addArrangedSubview(labelStackView)
        
        finalStackView.anchor(top: safeArea.topAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 50, paddingLeading: 50, paddingTrailing: -50, paddingBottom: 16)
    }
    
    @objc func selectButton(sender: UIButton) {
        buttons.forEach { $0.setTitleColor(.lightGray, for: .normal) }
        sender.setTitleColor(.green, for: .normal)
        switch sender {
        case tenPercentButton:
            tenPercent()
        case fifteenPercentButton:
            fifteenPercent()
        case twentyPercentButton:
            twentyPercent()
        default:
            return
        }
    }
    
    func activateButton() {
        buttons.forEach { $0.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside) }
    }
    
    func tenPercent() {
        let amount = Double(amountTextField.text!) ?? 0
        let tip = amount * 0.1
        let totalAmount = tip + amount
        
        tipAmountLabel.text = "$\(tip)"
        finalAmountLabel.text = "$\(totalAmount)"
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        finalAmountLabel.text = String(format: "$%.2f", totalAmount)
    }
    
    func fifteenPercent() {
        let amount = Double(amountTextField.text!) ?? 0
        let tip = amount * 0.15
        let totalAmount = tip + amount
        
        tipAmountLabel.text = "$\(tip)"
        finalAmountLabel.text = "$\(totalAmount)"
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        finalAmountLabel.text = String(format: "$%.2f", totalAmount)
    }
    
    func twentyPercent() {
        let amount = Double(amountTextField.text!) ?? 0
        let tip = amount * 0.2
        let totalAmount = tip + amount
        
        tipAmountLabel.text = "$\(tip)"
        finalAmountLabel.text = "$\(totalAmount)"
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        finalAmountLabel.text = String(format: "$%.2f", totalAmount)
    }
    //MARK: - Views
    let amountTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Enter amount here..."
        textField.textAlignment = .center
        textField.backgroundColor = .systemTeal
        textField.keyboardType = .decimalPad
        
        return textField
    }()
    
    let tenPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let fifteenPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("15%", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let twentyPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let tipAmountLabel: UILabel = {
        let tipLabel = UILabel()
        
        tipLabel.backgroundColor = .systemTeal
        tipLabel.textAlignment = .center
        
        return tipLabel
    }()
    
    let finalAmountLabel: UILabel = {
        let finalLabel = UILabel()
        
        finalLabel.backgroundColor = .systemTeal
        finalLabel.textAlignment = .center
        
        return finalLabel
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let finalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
}//End of Class
