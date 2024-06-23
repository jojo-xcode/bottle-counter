//
//  Flasche .swift
//  Inventuren_App_2.0
//
//  Created by Jojo on 23.08.23.
//

import SwiftUI
import Combine



struct Flasche_: View {// Verwenden Sie die aktualisierte Klassendefinition
    @Binding var vodkagesammt: Double
    @Binding var weingesammt: Double
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("1.75 ml")
                    .padding()
            }
            
            Image("Vodka")
                .resizable()
                .frame(width: 225, height: 550)
            Text("Flaschen")
                .foregroundColor(.blue)
                .font(.title3)
            Text("\(self.vodkagesammt, specifier: "%.1f")")
                .foregroundColor(.blue)
                .bold()
                .font(.title)
            Spacer()
        }
    }
}
