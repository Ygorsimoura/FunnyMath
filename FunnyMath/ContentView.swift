//
//  ContentView.swift
//  FunnyMath
//
//  Created by Ygor Simoura on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("FunnyMath")
                    .font(.system(size: 45))
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding(.top, 50)
                
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                    .opacity(0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .padding(.top, 70)
                
                Spacer()
                
                NavigationLink(destination: SetGame()) {
                    
                    Text("Start")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 22))

                }
                .padding(EdgeInsets(top: 20, leading: 30, bottom:20, trailing: 30))
                .background(Color(.orange))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 1.0, green: 0.4, blue: 0.0), lineWidth: 3)
                )
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
