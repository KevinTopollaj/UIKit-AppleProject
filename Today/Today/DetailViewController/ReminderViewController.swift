//
//  ReminderViewController.swift
//  Today
//
//  Created by Kevin on 15.09.22.
//

import UIKit

class ReminderViewController: UICollectionViewController {
  
  // MARK: - Type Alias -
  private typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
  private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>
  
  // MARK: - Properties -
  var reminder: Reminder
  private var dataSource: DataSource!
  
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
  
  // MARK: - Life Cycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
    dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
      return collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                          for: indexPath,
                                                          item: itemIdentifier)
    }
    
    navigationItem.title = NSLocalizedString("Reminder", comment: "Reminder view controller title")
    
    updateSnapshot()
    
  }
  
  // MARK: - Register the cell -
  func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
    
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = text(for: row)
    contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
    contentConfiguration.image = row.image
    cell.contentConfiguration = contentConfiguration
    cell.tintColor = .todayPrimaryTint
  }
  
  // MARK: - Update Snapshot -
  private func updateSnapshot() {
    
    var snapshot = Snapshot()
    snapshot.appendSections([.view])
    snapshot.appendItems([.viewTitle, .viewDate, .viewTime, .viewNotes], toSection: .view)
    dataSource.apply(snapshot)
    
  }
  
  // Returns the section for a row that you pass in
  private func section(for indexPath: IndexPath) -> Section {
    let sectionNumber = isEditing ? indexPath.section + 1 : indexPath.section
    guard let section = Section(rawValue: sectionNumber) else { fatalError("Unable to find matching section") }
    return section
  }
  
  // Get text for each specific row
  func text(for row: Row) -> String? {
    switch row {
      case .viewDate:  return reminder.dueDate.dayText
      case .viewNotes: return reminder.notes
      case .viewTime:  return reminder.dueDate.formatted(date: .omitted, time: .shortened)
      case .viewTitle: return reminder.title
    }
  }
}
