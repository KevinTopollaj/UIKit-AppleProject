//
//  ViewController.swift
//  Today
//
//  Created by Kevin on 12.09.22.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
  
  // MARK: - Properties -
  var dataSource: DataSource!
  var reminders: [Reminder] = Reminder.sampleData
  
  // MARK: - Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let listLayout = listLayout()
    collectionView.collectionViewLayout = listLayout
    
    // register a cell
    let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
    
    // initialize datasource
    dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView,
                                                               indexPath: IndexPath,
                                                               itemIdentifier: Reminder.ID) in
      
      return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
    }
    
    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAddButton(_:)))
    addButton.accessibilityLabel = NSLocalizedString("Add reminder", comment: "Add button accessibility label")
    navigationItem.rightBarButtonItem = addButton
    
    updateSnapshot()
    
    collectionView.dataSource = dataSource
  }
  
  // MARK: - CollectionViewDelegate -
  override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    let id = reminders[indexPath.item].id
    showDetail(for: id)
    return false
  }
  
  // MARK: - Navigate to Detail View -
  func showDetail(for id: Reminder.ID) {
    let reminder = reminder(for: id)
    let viewController = ReminderViewController(reminder: reminder) { [weak self] reminder in
      self?.update(reminder, with: reminder.id)       // update the model
      self?.updateSnapshot(reloading: [reminder.id])  // update the UI
    }
    navigationController?.pushViewController(viewController, animated: true)
  }

  // MARK: - Create Layout -
  private func listLayout() -> UICollectionViewCompositionalLayout {
    var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
    listConfiguration.showsSeparators = false
    listConfiguration.trailingSwipeActionsConfigurationProvider = makeSwipeAction
    listConfiguration.backgroundColor = .clear
    return UICollectionViewCompositionalLayout.list(using: listConfiguration)
  }
  
  // MARK: - Create swipe action configuration -
  
  private func makeSwipeAction(for indexPath: IndexPath?) -> UISwipeActionsConfiguration? {
    guard let indexPath = indexPath,
          let id = dataSource.itemIdentifier(for: indexPath) else {
      return nil
    }

    let deleteActionTitle = NSLocalizedString("Delete", comment: "Delete action title")
    let deleteAction = UIContextualAction(style: .destructive, title: deleteActionTitle) { [weak self] _, _, completion in
      self?.deleteReminder(with: id)
      self?.updateSnapshot()
      completion(false)
    }
    
    return UISwipeActionsConfiguration(actions: [deleteAction])
  }

}

