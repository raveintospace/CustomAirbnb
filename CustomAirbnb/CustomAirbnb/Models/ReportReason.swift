//
//  ReportReason.swift
//  CustomAirbnb
//
//  Created by Uri on 31/12/23.
//

import Foundation

struct ReportReason: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    
    static func getReportReasons() -> [Self] {
        return [
            ReportReason(name: "Joke", icon: "mustache.fill"),
            ReportReason(name: "Spam", icon: "s.circle.fill"),
            ReportReason(name: "Doubled listing", icon: "repeat.1.circle.fill"),
            ReportReason(name: "Explicit content", icon: "eye.trianglebadge.exclamationmark.fill"),
            ReportReason(name: "Photos don't match", icon: "camera.fill"),
            ReportReason(name: "Forbidden content or service", icon: "xmark.seal.fill")
            ]
    }
}


