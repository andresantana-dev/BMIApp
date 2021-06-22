//
//  ViewModel.swift
//  BMIApp
//
//  Created by André Santana on 22/06/2021.
//

import Foundation
import SwiftUI

enum BMIResult: String {
    case notHealthy, healthy, overWeight, none
    init(_ BMI: String?) {
        switch BMI {
        case "notHealthy": self = .notHealthy
        case "healthy": self = .healthy
        case "overWeight": self = .overWeight
        default: self = .none
        }
    }
    
    var title: String {
        switch self {
        case .notHealthy: return "You need to eat!"
        case .healthy: return "You're healthy!"
        case .overWeight: return "You're a bit fat"
        default: return ""
        }
    }

    
    var description: String {
        switch self {
        case .notHealthy: return "This value is under the normal range \n for your age group.\n" + "Try some fast food!"
        case .healthy: return "This value is in the normal range \n for your age group.\n" + "Keep up the good work!"
        case .overWeight: return "This value is above the normal range \n for your age group.\n" + "Please go to a doctor!"
        default: return ""
        }
    }
}

struct BMIData {
    var height: String
    var weight: String
}

class BMIResultData: ObservableObject {
    var bmi: String
    var result: BMIResult
    
    init(bmi: String, result: BMIResult) {
        self.bmi = bmi
        self.result = result
    }
}

class ViewModel: ObservableObject {
    init() { }
    
    public func calculateBMI(bmiData: BMIData) -> BMIResultData {
        let weight = Double(bmiData.weight) ?? 0.0
        let height = Double(bmiData.height) ?? 0.0
        let bmi = (weight / (height * 2)) * 100
        let bmiString = String(format: "%.0f", bmi)
                
        switch bmi {
        case 0..<18.5:
            return BMIResultData(bmi: bmiString, result: .notHealthy)
        case 18.5..<25:
            return BMIResultData(bmi: bmiString, result: .healthy)
        case 25...:
            return BMIResultData(bmi: bmiString, result: .overWeight)
        default:
            return BMIResultData(bmi: bmiString, result: .none)
        }
    }
}
