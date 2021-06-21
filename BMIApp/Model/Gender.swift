//
//  Gender.swift
//  BMIApp
//
//  Created by André Santana on 21/06/2021.
//

import Foundation

struct Gender: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String
}

var genders = [
    
    Gender(title: "Female"),
    Gender(title: "Male"),
    Gender(title: "Other")

]
