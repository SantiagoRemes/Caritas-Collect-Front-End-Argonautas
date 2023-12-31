//
//  Banner.swift
//  CaritasCollect
//
//  Created by Alumno on 05/09/23.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        VStack {
            Text("Cáritas Collect")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .offset(y: 50)
            HStack{
                Spacer()
            }
        }
        .padding(0)
        .frame(height: 200)
        .background(Color("302C"))
        .ignoresSafeArea()
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
