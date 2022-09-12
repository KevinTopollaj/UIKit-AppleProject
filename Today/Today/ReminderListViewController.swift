//
//  ViewController.swift
//  Today
//
//  Created by Kevin on 12.09.22.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

  typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
  
  //  A snapshot represents the state of your data at a specific point in time.
  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
  
  var dataSource: DataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let listLayout = listLayout()
    collectionView.collectionViewLayout = listLayout
    
    // register a cell
    let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell,
                                                                indexPath: IndexPath,
                                                                itemIdentifier: String) in
      
      let reminder = Reminder.sampleData[indexPath.item]
      var contentConfiguration = cell.defaultContentConfiguration()
      contentConfiguration.text = reminder.title
      
      cell.contentConfiguration = contentConfiguration
    }
    
    // initialize datasource
    dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView,
                                                               indexPath: IndexPath,
                                                               itemIdentifier: String) in
      
      return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
    }
    
    // initialize snapshot and apply it to datasource
    var snapshot = Snapshot()
    snapshot.appendSections([0])
    snapshot.appendItems(Reminder.sampleData.map { $0.title })
    dataSource.apply(snapshot)
    
    collectionView.dataSource = dataSource
  }

  private func listLayout() -> UICollectionViewCompositionalLayout {
    var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
    listConfiguration.showsSeparators = false
    listConfiguration.backgroundColor = .clear
    return UICollectionViewCompositionalLayout.list(using: listConfiguration)
  }

}

