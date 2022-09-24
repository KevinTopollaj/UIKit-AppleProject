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
  
  // MARK: - Helper Methods -
  
  func readAll() async throws -> [Reminder] {
    guard isAvailable else { throw TodayError.accessDenied }
    
    let predicate = ekStore.predicateForReminders(in: nil)
    let ekReminders = try await ekStore.fetchReminders(matching: predicate)
    
    // The resulting array contains only the reminders that have alarms corresponding to their due dates.
    let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
      do {
        return try Reminder(with: ekReminder)
      } catch TodayError.reminderHasNoDueDate {
        return nil
      }
    }
    
    return reminders
    
  }
}
