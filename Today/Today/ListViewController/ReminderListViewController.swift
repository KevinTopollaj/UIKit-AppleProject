//
//  ViewController.swift
//  Today
//
//  Created by Kevin on 12.09.22.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
  
  var dataSource: DataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let listLayout = listLayout()
    collectionView.collectionViewLayout = listLayout
    
    // register a cell
    let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
    
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

