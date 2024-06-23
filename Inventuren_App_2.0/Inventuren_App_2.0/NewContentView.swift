//
//  ContentView.swift
//  Inventuren_App_2.0
//
//  Created by Jojo on 22.08.23.
//

import SwiftUI
struct NewContentView: View {
 
    
    @State private var yOffset: CGFloat = 0
    @GestureState private var dragOffset: CGFloat = 0
    let minHeight: CGFloat = -520
    let maxHeight: CGFloat = 0
    @State private var counter: Double = 0
    @State private var flasche_counter: Double = 0
    
    var body: some View {
        let füllstand = abs(yOffset / -520)
        let flaschen = counter + flasche_counter
        let gesammt = füllstand + flaschen
        
        NavigationView {
            VStack {
                Text("\(füllstand, specifier: "%.1f")")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    .bold()
                    .font(.title2)
                
                ZStack {
                //    HStack {

                            Image("Vodka")
                                .resizable()
                                .position(x: 140, y: 300)
                                .frame(width: 270, height: 630)
                                .hidden()
                        }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 3)
                            .foregroundColor(.blue)
                            .offset(y: yOffset + dragOffset)
                            .gesture(
                                DragGesture()
                                    .updating($dragOffset) { value, state, _ in
                                        state = value.translation.height
                                    }
                                    .onEnded { value in
                                        let newOffset = yOffset + value.translation.height
                                        yOffset = min(max(newOffset, minHeight), maxHeight)
                                    }
                            )
                            
                    }.position(x: 150, y: 600)
                        .hidden()
                }
                .frame(width: 300, height: 600)
                .background(Color.gray)
                
            
                HStack {
                    if counter <= 0 {
                        Button {
                        } label: {
                            Text(Image(systemName: "minus.circle"))
                                .bold()
                                .font(.title)
                                .hidden()
                        }
                    } else {
                        Button {
                            counter -= 1
                        } label: {
                            Text(Image(systemName: "minus.circle"))
                                .bold()
                                .font(.title)
                        }
                    }
                    Spacer()
                        .frame(width: 90)
                    Text("\(gesammt, specifier: "%.1f")")
                        .foregroundColor(.blue)
                        .bold()
                        .font(.title)
                    Spacer()
                        .frame(width: 90)
                    
                    Button {
                        counter += 1
                    } label: {
                        Text(Image(systemName: "plus.circle"))
                            .bold()
                            .font(.title)
                    }
                }
                .padding(0)
                Spacer()
                    .frame(height: 50)
            }
        }
    }


struct NewContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewContentView()
    }
}
