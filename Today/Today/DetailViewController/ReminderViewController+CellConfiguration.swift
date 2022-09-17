//
//  ReminderViewController+CellConfiguration.swift
//  Today
//
//  Created by Kevin on 17.09.22.
//

import UIKit

extension ReminderViewController {
  
  // Default list view cell configration
  func defaultConfiguration(for cell: UICollectionViewListCell, at row: Row) -> UIListContentConfiguration {
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = text(for: row)
    contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
    contentConfiguration.image = row.image
    return contentConfiguration
  }
  
  // Header Configuration
  func headerConfiguration(for cell: UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = title
    return contentConfiguration
  }
  
  //
  func titleConfiguration(for cell: UICollectionViewListCell, with title: String?) -> TextFieldContentView.Configuration {
    var contentConfiguration = cell.textFieldConfiguration()
    contentConfiguration.text = title
    return contentConfiguration
  }
  
  // Get text for each specific row
  func text(for row: Row) -> String? {
    switch row {
      case .viewDate:  return reminder.dueDate.dayText
      case .viewNotes: return reminder.notes
      case .viewTime:  return reminder.dueDate.formatted(date: .omitted, time: .shortened)
      case .viewTitle: return reminder.title
      default: return nil
    }
  }
  
}
