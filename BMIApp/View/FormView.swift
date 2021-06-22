//
//  FormView.swift
//  BMIApp
//
//  Created by André Santana on 21/06/2021.
//

import SwiftUI

struct FormView: View {
    
    @StateObject var vm = ViewModel()
    @Binding var selectedGender: Gender
    @State var age: String = ""
    @State var height: String = ""
    @State var weight: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: -10) {
                Text("Let's calculate your current BMI")
                    .font(Font.custom("Gilroy-Bold", size: 35))
                    .padding()
                
                Text("You can find out whether you are overweight, underweight or ideal weight.")
                    .font(Font.custom("Gilroy-Regular", size: 15))
                    .padding()
                
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    HStack(alignment: .center, spacing: 15) {
                        
                        ForEach(genders) { gender in
                            HStack(spacing: 10) {
                                
                                Text(gender.title)
                                    .foregroundColor(selectedGender.id == gender.id ? .white : .black)
                                    .font(Font.custom("Gilroy-Regular", size: 15))
                            }
                            .padding()
                            .frame(width: 90, height: 45)
                            .background(selectedGender.id == gender.id ? Constants.gray : Color.clear)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(Constants.gray.opacity(0.4), lineWidth: selectedGender.id == gender.id ? 0 : 1)
                            )
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedGender = gender
                                }
                            }
                        }
                        
                    }
                    
                })
                .padding()
                .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    FormField(title: "Age", property: $age)
                    Divider()
                    
                    FormField(title: "Height", property: $height)
                    Divider()
                    
                    FormField(title: "Weight", property: $weight)
                    Divider()
                    
                }
                .padding()
                .onAppear(perform: {
                    age = ""
                    height = ""
                    weight = ""
                })
                
                Spacer()
                
                NavigationLink(
                    destination: ResultView(result:
                                                vm.calculateBMI(bmiData:
                                                                    BMIData(
                                                                        height: height,
                                                                        weight: weight))),
                    label: {
                        Text("Calculate BMI")
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(Font.custom("Gilroy-Regular", size: 15))
                            .foregroundColor(.white)
                            .background(Constants.blue)
                            .clipShape(Capsule())
                    })
                    .disabled(!allDataIsFilled())
                    .opacity(!allDataIsFilled() ? 0.5 : 1.0)
                    .padding()
                    .offset(y: 35)
            }
            .padding()
            
        }
    }
    
    private func allDataIsFilled() -> Bool {
        var isReady = false
        if !age.isEmpty && !height.isEmpty && !weight.isEmpty {
            isReady = true
        }
        return isReady
    }
}

struct FormField: View {
    
    public var title: String
    @Binding var property: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(property.isEmpty ? "" : title)
                .foregroundColor(Constants.gray.opacity(0.5))
                .font(Font.custom("Gilroy-Regular", size: 15))
            HStack {
                TextField(title, text: $property)
                    .keyboardType(.numberPad)
                    .foregroundColor(Constants.gray)
                    .font(Font.custom("Gilroy-Bold", size: 15))
                
                Text(title == "Age" ? "" : title == "Height" ? "cm" : title == "Weight" ? "kg" : "")
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
