//
//  popup.swift
//  popupview
//
//  Created by İlker isa Mercan on 8.09.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import UIKit
class Popup: UIView {
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        label.text = "SUCCESS"
        label.textAlignment = .center
        return label
    }()
    
    fileprivate let topImage: UIImageView = {
        let imageName = "tik1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    fileprivate let button1: UIButton = {
        let button = UIButton()
        button.setTitle("Success", for: UIControl.State.normal)
        button.setTitleColor(.blue, for: UIControl.State.init())
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    fileprivate let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.text = "message sent successfully Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut lorem interdum, mattis erat eget, dictum sem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed a urna lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer in vulputate erat."
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    fileprivate let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 24
        return v
    }()

    fileprivate lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [topImage, titleLabel, subtitleLabel, button1])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    @objc fileprivate func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        self.frame = UIScreen.main.bounds
        self.addSubview(container)
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        
        container.addSubview(stack)

        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: self.stack.heightAnchor, multiplier: 1).isActive = true
        container.heightAnchor.constraint(equalTo: self.stack.heightAnchor, constant: +32).isActive = true



        animateIn()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
