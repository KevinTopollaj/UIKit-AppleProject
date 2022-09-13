//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Kevin on 13.09.22.
//

import UIKit

extension ReminderListViewController {
  
  typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
  //  A snapshot represents the state of your data at a specific point in time.
  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
  
  func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
    let reminder = Reminder.sampleData[indexPath.item]
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = reminder.title
    contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
    contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
    cell.contentConfiguration = contentConfiguration
  }
}
