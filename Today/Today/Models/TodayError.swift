//
//  TodayError.swift
//  Today
//
//  Created by Kevin on 24.09.22.
//

import Foundation

enum TodayError: LocalizedError {
  case failedReadingReminders
  
  var errorDescription: String? {
    switch self {
      case .failedReadingReminders:
        return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
    }
  }
}
