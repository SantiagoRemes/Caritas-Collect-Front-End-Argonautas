//
//  ContentView.swift
//  CaritasCollect
//
//  Created by Alumno on 05/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Banner()
                .frame(width: 400, height: 80)
                .ignoresSafeArea()
            
            LoginScreen()
                .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
