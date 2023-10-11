//
//  SetGame.swift
//  FunnyMath
//
//  Created by Ygor Simoura on 05/10/23.
//

import SwiftUI

struct SetGame: View {
    
    @State private var tables: Double = 8
    @State private var questions: Int? = nil
    @State private var numberOfRounds: Int? = nil
    
    let numberOfQuestions = ["05", "10", "15"]
    
    
    var body: some View {
        VStack{
            Text("FunnyMath")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            
            Rectangle()
                .foregroundColor(.blue)
                .opacity(0.25)
                .frame(width: 247, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            Section { // Set Tables and number of questions
                Text("\(String(format: "%02d", Int(tables)))")
                    .font(.system(size: 140))
                    .padding()
                
                Slider(value: $tables, in: 1...10)
                    .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 80))
                
                HStack {
                    ForEach(0..<numberOfQuestions.count) { number in
                        Button {
                            questions = number
                            makerounds()
                        }label: {
                            Text(numberOfQuestions[number])
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                                .padding(15)
                        }
                        .background(Color(.orange))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(6)
                        
                    }
                }
                
            }
            
            NavigationLink(destination: Gaming(tables: $tables, numberOfRounds: $numberOfRounds)){
                Image(systemName: "play.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)
            }
            .background(Color(red: 0.5, green: 0.7, blue: 1.0))
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .padding(.top, 40)
            
            
            
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
