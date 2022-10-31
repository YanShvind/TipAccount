//
//  TipsCollectionViewCell.swift
//  Total bill
//
//  Created by Yan Shvyndikov on 30.10.2022.
//

import UIKit

 class TipsCollectionViewCell: UICollectionViewCell{
    
    let procentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        // label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     
     // подсвечивание ячейки когда ее выбираешь
     override var isSelected: Bool{
         didSet{
             if isSelected{
                 layer.borderWidth = 3
                 layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
             }else{
                 layer.borderWidth = 0
             }
         }
     }
    
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
         
         procentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
     }
     
    func setupView(){
        backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491841197, blue: 0.9404790998, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(procentLabel)
    }
    
    func setConstrains(){
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
