//
//  ReminderStore.swift
//  Today
//
//  Created by Kevin on 24.09.22.
//

import Foundation
import EventKit

class ReminderStore {
  
  // MARK: - Properties -
  static let shared = ReminderStore()
  
  private let ekStore = EKEventStore()
  
  var isAvailable: Bool {
    EKEventStore.authorizationStatus(for: .reminder) == .authorized
  }
}
