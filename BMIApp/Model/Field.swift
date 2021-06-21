//
//  Field.swift
//  BMIApp
//
//  Created by André Santana on 21/06/2021.
//

import Foundation

struct Field: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String
}

var fields = [
    
    Field(title: "Age"),
    Field(title: "Height"),
    Field(title: "Weight")

]
