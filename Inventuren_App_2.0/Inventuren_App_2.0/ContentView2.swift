//
//  ContentView2.swift
//  Inventuren_App_2.0
//
//  Created by Jojo on 18.09.23.
//

import SwiftUI
struct ContentView2: View {
    @State private var yOffset: CGFloat = 0
    @GestureState private var dragOffset: CGFloat = 0
    let minHeight: CGFloat = -520
    let maxHeight: CGFloat = 0
    @State private var counter: Double = 0
    @State private var flasche_counter: Double = 0
    @Binding var weingesammt : Double
    func minmal(füllstand: CGFloat, Flaschen: Double) -> Double {
        var füllstand = abs(yOffset / -540)
        var flaschen = counter + flasche_counter
        var gesammt = füllstand + flaschen
        return gesammt
    }
    var body: some View {
        var füllstand = abs(yOffset / -540)
        var flaschen = counter + flasche_counter
        NavigationView {
                VStack{
                    
                    
                    Text("\(füllstand, specifier: "%.1f")")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .bold()
                        .font(.title2)
                    ZStack {
                        
                        HStack{
                            ZStack{
                                
                                
                            }
                            Image("Wein")
                                .resizable()
                                .position(x: 140, y: 300)
                                .frame(width: 270, height: 650)
                        }
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 250, height: 9)
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
                                            self.weingesammt = self.minmal(füllstand: füllstand, Flaschen: flaschen)
                                        }
                                )
                            
                            
                            
                        }.position(x: 150, y: 600)
                    }
                    .frame(width: 300, height: 600)
                    .background(Color.white)
                    
                    
                    VStack{
                        HStack{
                            if counter <= 0 {
                                Button {
                                } label: {
                                    Text(Image(systemName: "minus.circle"))
                                        .bold()
                                        .font(.title)
                                        .hidden()
                                }
                            }else{
                                Button {
                                    counter -= 1
                                    self.weingesammt = self.minmal(füllstand: füllstand, Flaschen: flaschen)
                                } label: {
                                    Text(Image(systemName: "minus.circle"))
                                        .bold()
                                        .font(.title)
                                }
                            }
                            Spacer()
                                .frame(width: 90)
                            Text("\(self.weingesammt, specifier: "%.1f")")
                                .foregroundColor(.blue)
                                .bold()
                                .font(.title)
                            Spacer()
                                .frame(width: 90)
                            Button {
                                counter += 1
                                self.weingesammt = self.minmal(füllstand: füllstand, Flaschen: flaschen)
                            } label: {
                                Text(Image(systemName: "plus.circle"))
                                    .bold()
                                    .font(.title)
                            }
                            
                        }.padding(0)
                        HStack{
                            NavigationLink {
                                ContentView(vodkagesammt: self.$weingesammt)
                               .navigationBarBackButtonHidden()
                            } label: {
                                Text("Zurück")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.green)
                                    .padding()
                            }

                            
                                Text("Nächste Flasche")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.green)
                                    .padding()
                            
                            
                        }
                    }
                    Spacer()
                        .frame(height: 50)
                }
                
            }
        }
    }

