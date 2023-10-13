//
//  teste.swift
//  FunnyMath
//
//  Created by Ygor Simoura on 11/10/23.
//

import SwiftUI

struct teste: View {
    var body: some View {
        ZStack {
            Color(.sRGB, red: 0xFC / 255, green: 0xFB / 255, blue: 0xF5 / 255)
            Text("Let's start multiplying? Below, you can choose up to which multiplication table you'd like and how many rounds you want to play!"
            )
            .font(.system(size: 20))
            .fontWeight(.medium)
            .fontDesign(.rounded)
        .padding(40)
        }
    }
}

struct teste_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
