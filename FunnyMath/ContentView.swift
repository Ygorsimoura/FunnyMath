//
//  ContentView.swift
//  FunnyMath
//
//  Created by Ygor Simoura on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var scale: CGFloat = 1
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 0x9D / 255.0, green: 0x91 / 255.0, blue: 0xFF / 255.0)
                    .ignoresSafeArea()
                VStack {
                    Text("FunnyMath")
                        .font(.system(size: 60))
                        .fontWeight(.black)
                        .fontDesign(.rounded)
                        .padding(.top, 50)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image("penguinMath")
                        .resizable()
                        .frame(width: 370, height: 290)
                    
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
                    .background(Color(red: 247.0 / 255.0, green: 212.0 / 255.0, blue: 123.0 / 255.0))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color(.black).opacity(0.40), radius: 1, x: 5, y: 6)
                    .scaleEffect(scale)
                    .animation(
                        Animation.easeInOut(duration: 2.5)
                            .repeatForever(autoreverses: true)
                    )
                    .onAppear() {
                        withAnimation{
                            self.scale = 1.1
                        }
                    }
                    
                    
                    Spacer()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
