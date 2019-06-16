//
//  Extension.swift
//  StopWatch
//
//  Created by Adakhanau on 16/06/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import Foundation

extension Int {
    func toTimeScreen() -> String {
        let hours = Int(self / 3600)
        let minutes = Int(self / 60) % 60
        let seconds = self % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
