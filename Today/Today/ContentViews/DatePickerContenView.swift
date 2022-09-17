//
//  DatePickerContenView.swift
//  Today
//
//  Created by Kevin on 17.09.22.
//

import UIKit

class DatePickerContentView: UIView, UIContentView {
  
  // MARK: -4 Configuration Object -
  
  struct Configuration: UIContentConfiguration {
    var date = Date.now
    
    func makeContentView() -> UIView & UIContentView {
      return DatePickerContentView(self)
    }
  }
  
  // MARK: -1 Properties -
  
  let datePicker = UIDatePicker()
  
  var configuration: UIContentConfiguration {
    didSet {
      configure(configuration: configuration)
    }
  }
  
  // MARK: -2 Initializer -
  
  init(_ configuration: UIContentConfiguration) {
    self.configuration = configuration
    
    super.init(frame: .zero)
    
    addPinnedSubview(datePicker)
    datePicker.preferredDatePickerStyle = .inline
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -3 Helper Method -
  
  func configure(configuration: UIContentConfiguration) {
    guard let configuration = configuration as? Configuration else { return }
    datePicker.date = configuration.date
  }
  
}

// MARK: -5 Extension -

extension UICollectionViewListCell {
  
  func datePickerConfiguration() -> DatePickerContentView.Configuration {
    DatePickerContentView.Configuration()
  }
}
