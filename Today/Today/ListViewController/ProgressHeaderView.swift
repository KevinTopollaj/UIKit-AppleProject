//
//  ProgressHeaderView.swift
//  Today
//
//  Created by Kevin on 22.09.22.
//

import UIKit

class ProgressHeaderView: UICollectionReusableView {
  
  // MARK: - Properties -
  var progress: CGFloat = 0
  
  private let upperView = UIView(frame: .zero)
  private let lowerView = UIView(frame: .zero)
  private let containerView = UIView(frame: .zero)
  
  // MARK: - Subviews and constraints -
  private func prepareSubviews() {
    containerView.addSubview(upperView)
    containerView.addSubview(lowerView)
    addSubview(containerView)
    
    upperView.translatesAutoresizingMaskIntoConstraints = false
    lowerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    // Maintain a 1:1 fixed aspect ratio for the superview and container views.
    heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
    
    // Center the container view horizontally and vertically in the layout frame.
    containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
    
    upperView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    upperView.bottomAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
    lowerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    upperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    upperView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    lowerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    lowerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }
}
