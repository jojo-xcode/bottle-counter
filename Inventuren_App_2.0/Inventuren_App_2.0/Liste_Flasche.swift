//
//  Liste_Flasche.swift
//  Inventuren_App_2.0
//
//  Created by Jojo on 23.08.23.
//

import SwiftUI

struct Liste_Flasche: View {
    @Binding var vodkagesammt : Double
    @Binding var weingesammt : Double
    var body: some View {
        NavigationStack{
            List {
                Section{
                    NavigationLink {
                        Flasche_(vodkagesammt: self.$vodkagesammt, weingesammt: self.$weingesammt)
                    } label: {
                        HStack{
                            Image("Vodka")
                                .resizable()
                                .frame(width: 20, height: 60)
                            VStack{
                                Text("Absolut Vodka")
                                    .bold()
                                    .padding(.vertical, 0)
                                    .font(.title3)
                                Text("1.75 ml")
                            }.padding(.horizontal)
                        }
                    }

                        
                }
            }.navigationTitle("Getränke")
        }
    }
}
