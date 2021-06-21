//
//  ContentView.swift
//  BMIApp
//
//  Created by André Santana on 18/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedGender: Gender = genders.first!
        
    var body: some View {
        FormView(selectedGender: $selectedGender)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
