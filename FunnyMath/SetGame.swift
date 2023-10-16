//
//  SetGame.swift
//  FunnyMath
//
//  Created by Ygor Simoura on 05/10/23.
//

import SwiftUI

struct SetGame: View {
    @State var scale2: CGFloat = 0.8
    @State private var tables: Double = 8
    @State private var questions: Int? = nil
    @State private var numberOfRounds: Int? = nil
    @State private var selectButton: Int = 0
    
    let numberOfQuestions = ["05", "10", "15"]
    
    
    var body: some View {
        ZStack {
            Color(.sRGB, red: 0xD0 / 255, green: 0x9E / 255, blue: 0xF5 / 255)
                .ignoresSafeArea()
            VStack(spacing: 1){
                ZStack {
                    Text("FunnyMath")
                        .font(.system(size: 45))
                        .fontWeight(.black)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: -120, leading: 0, bottom: -15, trailing: 0))
                        .zIndex(1)
                
                    Image("penguin2")
                        .resizable()
                        .frame(width: 260, height: 260)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: -22, trailing: 0))
                        .zIndex(-1)
                }
                    
                
                ZStack(){
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: -10, leading: 29, bottom: 16, trailing: 28))
                        .shadow(color: Color(.black).opacity(0.20), radius: 1, x: 7, y: 6)
                    
                    VStack(spacing: 0){
                        
                        Section(header: Text("Select Table Limit").fontWeight(.black).fontDesign(.rounded).foregroundColor(.gray)
                            .padding(.top,10)){
                               
                                Text("\(String(format: "%02d", Int(tables)))")
                                    .font(.system(size: 120))
                                    .fontDesign(.rounded)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0x9D / 255.0, green: 0x91 / 255.0, blue: 0xFF / 255.0))
                                    .padding(-5)
                                
                                                        
                                Slider(value: $tables, in: 1...10)
                                    .padding(EdgeInsets(top: 0, leading: 123, bottom: 0, trailing: 123))
                                    .accentColor(Color(red: 0x9D / 255.0, green: 0x91 / 255.0, blue: 0xFF / 255.0))
                                
                                
                        }
                        
                        
                        Section(header: Text("Challenge Level").fontWeight(.black).fontDesign(.rounded).foregroundColor(.gray).padding()){
                            HStack {
                                ForEach(0..<numberOfQuestions.count) { number in
                                    Button {
                                        questions = number
                                        withAnimation(Animation.easeInOut(duration: 1)){
                                            selectButton = number
                                        }
                                        makerounds()
                                    }label: {
                                        Text(numberOfQuestions[number])
                                            .font(.system(size: 35))
                                            .fontDesign(.rounded)
                                            .fontWeight(.black)
                                            .foregroundColor(.white)
                                            .padding(15)
                                    }
                                    .background(selectButton == number ? Color(red: 0x9D / 255.0, green: 0x91 / 255.0, blue: 0xFF / 255.0) : Color(red: 173.0/255.0, green: 216.0/255.0, blue: 230.0/255.0))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(color: Color(.black).opacity(0.40), radius: 1, x: 6, y: 2)
                                    .padding(6)
                                    
                                }
                                
                            }
                        }
                        
                        NavigationLink(destination: Gaming(tables: $tables, numberOfRounds: $numberOfRounds).navigationBarBackButtonHidden(true)){
                            Image(systemName: "play.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .frame(width: 90, height: 90)
                                
                        }
                        .background(Color(red: 247.0 / 255.0, green: 212.0 / 255.0, blue: 123.0 / 255.0))
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(color: Color(.black).opacity(0.40), radius: 1, x: 6, y: 2)
                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 30, trailing: 0))
                        
                    }
                }
            }
        }
    }
    
    func makerounds(){
        if questions == 0 {
            numberOfRounds = 5
        } else if questions == 1 {
            numberOfRounds = 10
        } else if questions == 2 {
            numberOfRounds = 15
        }
        
    }
}


struct SetGame_Previews: PreviewProvider {
    static var previews: some View {
        SetGame()
    }
}
