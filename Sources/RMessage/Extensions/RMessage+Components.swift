//
//  RMessage+Components.swift
//
//  Created by Adonis Peralta on 8/6/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit

extension RMessage {
    func iconImageView(withImage image: UIImage, imageTintColor: UIColor?, superview: UIView) -> UIImageView {
        let iconImageView = UIImageView(image: image)
        iconImageView.clipsToBounds = true
        iconImageView.tintColor = imageTintColor
        iconImageView.contentMode = .scaleAspectFit
        
        setup(leftView: iconImageView, inSuperview: superview)
        return iconImageView
    }
    
    func setup(leftView view: UIView, inSuperview superview: UIView) {
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -15),
            view.topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor, constant: 10),
            view.bottomAnchor.constraint(lessThanOrEqualTo: superview.bottomAnchor, constant: -10)
        ])
    }
    
    func setup(rightView view: UIView, inSuperview superview: UIView) {
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let viewTrailingOptConstraint = view.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -15
        )
        viewTrailingOptConstraint.priority = UILayoutPriority(rawValue: 749)
        
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            view.trailingAnchor.constraint(lessThanOrEqualTo: superview.trailingAnchor, constant: -15),
            view.topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor, constant: 10),
            view.bottomAnchor.constraint(lessThanOrEqualTo: superview.bottomAnchor, constant: -10),
            viewTrailingOptConstraint
        ])
    }
    
    func backgroundImageView(withImage image: UIImage, superview: UIView) -> UIImageView {
        let resizeableImage = image.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        let backgroundImageView = UIImageView(image: resizeableImage)
        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .scaleToFill
        setup(backgroundView: backgroundImageView, inSuperview: superview)
        return backgroundImageView
    }
    
    func setup(backgroundView view: UIView, inSuperview superview: UIView) {
        superview.insertSubview(view, at: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }
    
    func setupBlurBackgroundView(inSuperview superview: UIView) {
        let blurEffect: UIBlurEffect
        if #available(iOS 13.0, *) {
            blurEffect = UIBlurEffect(style: .systemMaterial)
        } else {
            blurEffect = UIBlurEffect(style: .light)
        }
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        superview.insertSubview(blurView, at: 0)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            
            blurView.topAnchor.constraint(equalTo: superview.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }
}
