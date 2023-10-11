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
    @State private var score = 0
    @State private var rounds = 0.0
    
    @State private var showingAlert = false
    @State private var shouldNavigateToSetGame = false

    

    init(tables: Binding<Double>, numberOfRounds: Binding<Int?>) {
        self._tables = tables
        self._numberOfRounds = numberOfRounds
        _value1 = State(initialValue: Int.random(in: 1...Int(tables.wrappedValue)))
        _value2 = State(initialValue: Int.random(in: 1...Int(tables.wrappedValue)))
    }

    var body: some View {
        VStack {
            VStack{
                Image(systemName: "trophy.fill")
                    .font(.system(size: 40))
                    .foregroundColor(Color(red: 1.5, green: 0.6, blue: 0.3))
                
                ProgressView(value:rounds, total: Double(numberOfRounds ?? 5))
                    .accentColor(Color(red: 1.5, green: 0.6, blue: 0.3))
                    .padding(EdgeInsets(top: 0, leading: 160, bottom: 0, trailing: 160))
                 
                
            }
            
            Text("\(value1) x \(value2)")
                .font(.system(size: 95))
                .fontDesign(.rounded)
                .fontWeight(.bold)
            
            HStack(spacing: 30) {
                ForEach(0..<2) { number in
                    Button{
                        value1 = Int.random(in: 1...Int(tables))
                        value2 = Int.random(in: 1...Int(tables))
                        generateResults()
                        withAnimation{
                            rounds += 1
                            
                        }
                    } label: {
                        if number == correctButtonIndex {
                            Text("\(String(format: "%02d", results))")
                                .frame(width: 150, height: 150)
                        } else {
                            Text("\(String(format: "%02d", wrongOption))")
                                .frame(width: 150, height: 150)
                        }
                    }
                    .font(.system(size: 75))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(Color(.init(red: 0, green: 0, blue: 1, alpha: 0.5)))
                    .fontDesign(.rounded)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                }
            }
            
        }
        .onAppear {
            generateResults()
        }
    }
        
    func generateResults() {
        results = value1 * value2
        wrongOption = Int.random(in: 1...100)
        correctButtonIndex = Bool.random() ? 0 : 1

    }
}

struct Gaming_Previews: PreviewProvider {
    static var previews: some View {
        Gaming(tables: .constant(5), numberOfRounds: .constant(5))
        
    }
}
