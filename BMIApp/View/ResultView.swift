//
//  ResultView.swift
//  BMIApp
//
//  Created by André Santana on 21/06/2021.
//

import SwiftUI

struct ResultView: View {
    
    private var resultData: BMIResultData? = nil
    
    @Environment(\.presentationMode) var presentation
    
    init(result: BMIResultData) {
        self.resultData = result
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color.white
                
                InfoView(result: resultData ?? BMIResultData(bmi: "", result: BMIResult("")))
                
            }
            .frame(width: 320, height: 450)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 1, y: 1)
            
            
            Spacer()
            
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Try Again")
                    .frame(width: 300, height: 50, alignment: .center)
                    .font(Font.custom("Gilroy-Bold", size: 15))
                    .foregroundColor(.white)
                    .background(Constants.blue)
                    .clipShape(Capsule())
            })
            .offset(y: -30)
        }
        .navigationBarBackButtonHidden(true)
        .offset(y: 30)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    
    @State var result: BMIResultData
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Your BMI is")
                .foregroundColor(.black)
                .font(Font.custom("Gilroy-Bold", size: 40))
            
            Text(result.bmi)
                .foregroundColor(Constants.green)
                .font(Font.custom("Gilroy-Bold", size: 55))
            
            Text(result.result.description)
            .font(Font.custom("Gilroy-Regular", size: 15))
            .multilineTextAlignment(.center)
            
            HStack(spacing: -100) {
                Image("person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .offset(x: -30, y: 20)
                
                Image("message")
                    .resizable()
                    .frame(width: 100, height: 80)
                    .offset(x: -60, y: -70)
                    .overlay(
                        Text(result.result.title)
                            .font(Font.custom("Gilroy-Regular", size: 11))
                            .offset(x: -60, y: -80)
                    )
            }
            .offset(y: 15)
            
        }
        .padding()
    }
}
