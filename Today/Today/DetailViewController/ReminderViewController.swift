//
//  ReminderViewController.swift
//  Today
//
//  Created by Kevin on 15.09.22.
//

import UIKit

class ReminderViewController: UICollectionViewController {
  
  // MARK: - Properties -
  var reminder: Reminder
  
  // MARK: - Initializer -
  init(reminder: Reminder) {
    self.reminder = reminder
    var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    listConfiguration.showsSeparators = false
    let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
    super.init(collectionViewLayout: listLayout)
  }
  
  required init?(coder: NSCoder) {
    fatalError("Always initialize ReminderViewController using init(reminder:)")
  }
}
