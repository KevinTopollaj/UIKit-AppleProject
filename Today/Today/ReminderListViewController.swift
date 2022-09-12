//
//  ViewController.swift
//  Today
//
//  Created by Kevin on 12.09.22.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let listLayout = listLayout()
    collectionView.collectionViewLayout = listLayout
  }

  private func listLayout() -> UICollectionViewCompositionalLayout {
    var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
    listConfiguration.showsSeparators = false
    listConfiguration.backgroundColor = .clear
    return UICollectionViewCompositionalLayout.list(using: listConfiguration)
  }

}

