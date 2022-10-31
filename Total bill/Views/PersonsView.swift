//
//  PersonsView.swift
//  Total bill
//
//  Created by Yan Shvyndikov on 30.10.2022.
//

import UIKit

final class PersonsView: UIView{
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        // label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewColor: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491841197, blue: 0.9404790998, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let minusPersonButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.3658930063, green: 0.4213069081, blue: 0.4971049428, alpha: 1)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let plusPersonButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.3658930063, green: 0.4213069081, blue: 0.4971049428, alpha: 1)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let amountPersonsLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .black
        // label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        amountPersonsLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }
    
    func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
        
        minusPersonButton.addTarget(self, action: #selector(minusPersonButtonTapped), for: .touchUpInside)
        plusPersonButton.addTarget(self, action: #selector(plusPersonButtonTapped), for: .touchUpInside)
        
        addSubview(titleLabel)
        addSubview(viewColor)
        viewColor.addSubview(minusPersonButton)
        viewColor.addSubview(plusPersonButton)
        viewColor.addSubview(amountPersonsLabel)
    }
    
    @objc func minusPersonButtonTapped(){
        counter -= 1
        if counter == 1{
            minusPersonButton.isEnabled = false
        }
        amountPersonsLabel.text = "\(counter)"
    }
    
    @objc func plusPersonButtonTapped(){
        counter += 1
        minusPersonButton.isEnabled = true
        amountPersonsLabel.text = "\(counter)"
    }
    
    func setConstrains(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            viewColor.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            viewColor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            viewColor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            viewColor.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            minusPersonButton.topAnchor.constraint(equalTo: viewColor.topAnchor, constant: 0),
            minusPersonButton.leadingAnchor.constraint(equalTo: viewColor.leadingAnchor, constant: 0),
            minusPersonButton.heightAnchor.constraint(equalTo: viewColor.heightAnchor),
            minusPersonButton.widthAnchor.constraint(equalToConstant: 100),
            
            plusPersonButton.topAnchor.constraint(equalTo: viewColor.topAnchor, constant: 0),
            plusPersonButton.trailingAnchor.constraint(equalTo: viewColor.trailingAnchor, constant: 0),
            plusPersonButton.heightAnchor.constraint(equalTo: viewColor.heightAnchor),
            plusPersonButton.widthAnchor.constraint(equalToConstant: 100),
            
            amountPersonsLabel.centerYAnchor.constraint(equalTo: viewColor.centerYAnchor),
            amountPersonsLabel.leadingAnchor.constraint(equalTo: minusPersonButton.leadingAnchor, constant: 10),
            amountPersonsLabel.trailingAnchor.constraint(equalTo: plusPersonButton.trailingAnchor,
                                                         constant: -10),
        ])
    }
}
