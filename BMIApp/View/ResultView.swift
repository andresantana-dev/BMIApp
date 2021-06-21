//
//  ResultView.swift
//  BMIApp
//
//  Created by André Santana on 21/06/2021.
//

import SwiftUI

struct ResultView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color.white
                
                VStack(spacing: 10) {
                    Text("Your BMI is")
                        .foregroundColor(.black)
                        .font(Font.custom("Gilroy-Bold", size: 40))
                    
                    Text("21.1")
                        .foregroundColor(Constants.green)
                        .font(Font.custom("Gilroy-Bold", size: 55))
                    
                    Text(
                        "This value is in the normal range \nof 20.25 for your age group.\n"
                            
                            +
                            
                            "Keep up the good work!"
                    )
                    .font(Font.custom("Gilroy-Regular", size: 15))
                    .multilineTextAlignment(.center)
                    
                    Image("person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .offset(x: -30)
                    
                }
                .padding()
                
            }
            .frame(width: 320, height: 450)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 1, y: 1)
            
            
            Spacer()
            
            Button(action: {
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
        ResultView()
    }
}
