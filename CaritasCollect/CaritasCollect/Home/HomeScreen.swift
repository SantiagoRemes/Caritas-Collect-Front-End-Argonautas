//
//  ContentView.swift
//  CaritasCollect
//
//  Created by Alumno on 05/09/23.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        
        TabView{
            
            RecoleccionesView()
                
                .tabItem{
                    Label("Home",systemImage: "house.circle")
                        
                }
                
            ConfiguracionView()
                
                .tabItem{
                    Label("Configuracion",systemImage: "gearshape.fill")
                    LogInView()
                }
                
                
            LogInView()
                .tabItem{
                    Label("Log Out", systemImage: "door.left.hand.open")
                }
        }.tint(.white)
        
            .onAppear(){
                UITabBar.appearance().barTintColor = UIColor(Color("302C"))
                UITabBar.appearance().backgroundColor = UIColor(Color("302C"))
            }.tint(.white)
            
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
