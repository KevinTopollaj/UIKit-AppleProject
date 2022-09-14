//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Kevin on 13.09.22.
//

import UIKit

extension ReminderListViewController {
  
  typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID>
  //  A snapshot represents the state of your data at a specific point in time.
  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>
  
  func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
    let reminder = reminder(for: id)
    
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = reminder.title
    contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
    contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
    cell.contentConfiguration = contentConfiguration
    
    var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
    doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
    cell.accessories = [.customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)]
    
    var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
    backgroundConfiguration.backgroundColor = .todayListCellBackground
    cell.backgroundConfiguration = backgroundConfiguration
  }
  
  func completeReminder(with id: Reminder.ID) {
    var reminder = reminder(for: id)
    reminder.isComplete.toggle()
    update(reminder, with: id)
  }
  
  private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
    let symbolName = reminder.isComplete ? "circle.fill" : "circle"
    let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
    let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
    
    let button = UIButton()
    button.setImage(image, for: .normal)
    return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
  }
  
  func reminder(for id: Reminder.ID) -> Reminder {
    let index = reminders.indexOfReminder(with: id)
    return reminders[index]
  }
  
  func update(_ reminder: Reminder, with id: Reminder.ID) {
    let index = reminders.indexOfReminder(with: id)
    reminders[index] = reminder
  }
}
