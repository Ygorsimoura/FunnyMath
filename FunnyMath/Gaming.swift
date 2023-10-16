//
//  Gaming.swift
//  FunnyMath
//
//  Created by Ygor Simoura on 05/10/23.
//

import SwiftUI

struct Gaming: View {
    @Binding var tables: Double
    @Binding var numberOfRounds: Int?
    @State private var animation = 1
    @State private var value1: Int
    @State private var value2: Int
    @State private var results: Int = 0
    @State private var wrongOption: Int = 0
    @State private var correctButtonIndex: Int = 0
    @State private var correctAnswers = 0
    
    @State private var median = 0
    @State private var rounds = 0.0
    
    @State private var shouldNavigateToSetGame = false
    @State private var winLoseview: Bool = true
    

    init(tables: Binding<Double>, numberOfRounds: Binding<Int?>) {
        self._tables = tables
        self._numberOfRounds = numberOfRounds
        _value1 = State(initialValue: Int.random(in: 1...Int(tables.wrappedValue)))
        _value2 = State(initialValue: Int.random(in: 1...Int(tables.wrappedValue)))
    }

    var body: some View {
        if winLoseview {
            ZStack {
                Color(red: 173.0/255.0, green: 216.0/255.0, blue: 230.0/255.0)
                    .ignoresSafeArea()
                
                Rectangle()
                    .frame(width:350, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 90))
                    .padding(.bottom, 35)
                    .foregroundColor(.white)
                        VStack{
                            VStack{
                                    Image(systemName: "trophy.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(Color(red: 247.0 / 255.0, green: 212.0 / 255.0, blue: 123.0 / 255.0))
                                    

                                    ProgressView(value:rounds, total: Double(numberOfRounds ?? 5))
                                        .accentColor(Color(red: 247.0 / 255.0, green: 212.0 / 255.0, blue: 123.0 / 255.0))
                                        .padding(EdgeInsets(top: 0, leading: 160, bottom: 0, trailing: 160))

                                
                            }.padding(EdgeInsets(top: -30, leading: 0, bottom: 40, trailing: 0))
                            
                            Text("How Much Is")
                                .font(.system(size: 20))
                                .fontDesign(.rounded)
                                .fontWeight(.black)
                                .foregroundColor(.gray)
                                
                            Text("\(value1) x \(value2)")
                                .font(.system(size: 95))
                                .fontDesign(.rounded)
                                .fontWeight(.black)
                                .foregroundColor(Color(red: 173.0/255.0, green: 216.0/255.0, blue: 230.0/255.0))
                                
                            
                            ZStack {
                                Rectangle()
                                    .clipShape(RoundedRectangle(cornerRadius: 120))
                                    .frame(width: 310, height: 154)
                                    .foregroundColor(.black).opacity(0.06)
                                    
                                
                                
                                
                                HStack(spacing: 30) {
                                    ForEach(0..<2) { number in
                                        Button{
                                            if number == correctButtonIndex {
                                                correctAnswers += 1
                                            }
                                            rounds += 1
                                            value1 = Int.random(in: 1...Int(tables))
                                            value2 = Int.random(in: 1...Int(tables))
                                            endGame()
                                            generateResults()
                                            
                                            
                                        } label: {
                                            if number == correctButtonIndex {
                                                Text("\(String(format: "%02d", results))")
                                                    .frame(width: 120, height: 120)
                                            } else {
                                                Text("\(String(format: "%02d", wrongOption))")
                                                    .frame(width: 120, height: 120)
                                            }
                                        }
                                        .font(.system(size: 50))
                                        .fontWeight(.black)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.white)
                                        .background(Color(red: 247.0 / 255.0, green: 212.0 / 255.0, blue: 123.0 / 255.0))
                                        .fontDesign(.rounded)
                                        .clipShape(RoundedRectangle(cornerRadius: 100))
                                    }
                                }
                            }
                        }
                        .onAppear{
                            generateResults()
                           
                        }
                        
            
            }
        
        } else {
            if correctAnswers < median{
                ZStack {
                    Color(red: 1, green: 0.45, blue: 0.45)
                        .ignoresSafeArea()

                    VStack{
                        Text("DEFEAT!")
                            .font(.system(size: 65))
                            .fontWeight(.black)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: -200, leading: 0, bottom: 0, trailing: 0))
                        
                        Image("PinguDeaft")
                            .resizable()
                            .frame(width: 243, height: 240)
                            .padding(EdgeInsets(top: -150, leading: 0, bottom: 20, trailing: 0))
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 340, height: 170)
                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                .foregroundColor(.white)
                                .shadow(color: Color(.black).opacity(0.40), radius: 1, x: 6, y: 6)
                            
                            
                            Text("Great effort! Your score was \(correctAnswers)/\(numberOfRounds ?? 5) this time. Don't worry, you're doing great and improving with every game. Keep practicing, as the determination you show is amazing. Next time, you'll conquer the tables with an even bigger smile on your face. Keep it up; I'm proud of you!")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 13))
                                .foregroundColor(.black).opacity(0.5)
                                .fontWeight(.black)
                                .padding(EdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 70))
                            
                        }
                        
                        
                        NavigationLink(destination: SetGame()){
                            HStack(spacing: 15){
                                Image(systemName: "arrow.counterclockwise")
                                Text("Create a new Game")
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .black, design: .rounded))
                        }
                        .frame(width: 340, height: 80)
                        .background(Color(red: 247.0 / 255.0, green: 212.0 / 255.0, blue: 123.0 / 255.0))
                        .clipShape(RoundedRectangle(cornerRadius: 35))
                        .shadow(color: Color(.black).opacity(0.40), radius: 1, x: 6, y: 6)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: -500, trailing: 0))
                        
                        
                    }
                }
                
            }else{
                ZStack {
                    Color(red: 0x37 / 255.0, green: 0xFF / 255.0, blue: 0x87 / 255.0)
                        .ignoresSafeArea()

                    VStack{
                        Text("VICTORY!")
                            .font(.system(size: 65))
                            .fontWeight(.black)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: -200, leading: 0, bottom: 0, trailing: 0))
                        
                        Image("PinguWin")
                            .resizable()
                            .frame(width: 200, height: 240)
                            .padding(EdgeInsets(top: -150, leading: 0, bottom: 20, trailing: 0))
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 340, height: 170)
                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                .foregroundColor(.white)
                                .shadow(color: Color(.black).opacity(0.40), radius: 1, x: 6, y: 6)
                            
                            
                            Text("Wow! You nailed it, your score was \(correctAnswers)/\(numberOfRounds ?? 5)! That's right, you're a Master of tables! Next time we play, go for an extra challenge because your victory was simply amazing! I'm really happy for you.")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 13))
                                .foregroundColor(.black).opacity(0.5)
                                .fontWeight(.black)
                                .padding(EdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 70))
                        }
                        
                        
                        NavigationLink(destination: SetGame()){
                            HStack(spacing: 15){
                                Image(systemName: "arrow.counterclockwise")
                                Text("Create a new Game")
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .black, design: .rounded))
                        }
                        .frame(width: 340, height: 80)
                        .background(Color(red: 173.0/255.0, green: 216.0/255.0, blue: 230.0/255.0))
                        .clipShape(RoundedRectangle(cornerRadius: 35))
                        .shadow(color: Color(.black).opacity(0.40), radius: 1, x: 6, y: 6)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: -500, trailing: 0))
                        
                        
                    }
                }
            }
            
            
        }
    }
    
    func calculateMedian(){
        if let numberOfRounds = numberOfRounds {
            let sixtyPercent = Double(numberOfRounds) * 0.6
            let resultInt = Int(sixtyPercent)
            median = resultInt
            
        }
    }
    
    func endGame(){
        if Int(rounds) == numberOfRounds {
            winLoseview = false
        }
        calculateMedian()
        
    }
    
    func generateResults() {
        results = value1 * value2
        wrongOption = (value1 * value2) * 2 - 5
        correctButtonIndex = Bool.random() ? 0 : 1
        
    }
}

struct Gaming_Previews: PreviewProvider {
    static var previews: some View {
        Gaming(tables: .constant(5), numberOfRounds: .constant(5))
            
        
    }
}
