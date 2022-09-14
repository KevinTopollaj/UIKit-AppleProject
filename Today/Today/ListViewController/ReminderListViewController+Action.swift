//
//  ReminderListViewController+Action.swift
//  Today
//
//  Created by Kevin on 14.09.22.
//

import Foundation

extension ReminderListViewController {
  
  @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
    
    guard let id = sender.id else { return }
    completeReminder(with: id)
  }
  
}
