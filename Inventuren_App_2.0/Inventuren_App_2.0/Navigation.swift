//
//  Navigation.swift
//  Inventuren_App_2.0
//
//  Created by Jojo on 22.08.23.
//

import SwiftUI

struct Navigation: View {
    @State var vodkagesammt: Double = 0
    @State var weingesammt: Double = 0
    var body: some View {
        TabView{
        //   ScrollView(.horizontal){
         //       HStack{
                    ContentView(vodkagesammt: self.$vodkagesammt)

             //     }
         //   }
                .tabItem {Label("Home", systemImage: "house")}
            Liste_Flasche(vodkagesammt: self.$vodkagesammt, weingesammt: self.$weingesammt)
                .tabItem{Label("Liste", systemImage: "list.bullet")}
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
