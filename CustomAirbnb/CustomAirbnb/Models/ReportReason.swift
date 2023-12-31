//
//  ReportReason.swift
//  CustomAirbnb
//
//  Created by Uri on 31/12/23.
//

import Foundation

struct ReportReason: Identifiable {
    let id = UUID()
    let reason: String
    let icon: String
    
    static func getReportReasons() -> [Self] {
        return [
            ReportReason(reason: "Joke", icon: "mustache.fill"),
            ReportReason(reason: "Spam", icon: "s.circle.fill"),
            ReportReason(reason: "Doubled listing", icon: "repeat.1.circle.fill"),
            ReportReason(reason: "Explicit content", icon: "eye.trianglebadge.exclamationmark.fill"),
            ReportReason(reason: "Photos don't match", icon: "camera.fill"),
            ReportReason(reason: "Forbidden content or service", icon: "xmark.seal.fill")
            ]
    }
}


