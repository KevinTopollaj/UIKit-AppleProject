//
//  ReminderListStyle.swift
//  Today
//
//  Created by Kevin on 20.09.22.
//

import Foundation

enum ReminderListStyle: Int {
  case today
  case future
  case all
  
  func shouldInclude(date: Date) -> Bool {
    // the current calendar date based on the user’s region settings
    let isInToday = Locale.current.calendar.isDateInToday(date)
    
    switch self {
      case .today:  return isInToday
      case .future: return (date > Date.now) && !isInToday
      case .all:    return true
    }
  }
}
