//
//  RecoleccionesView.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct RecoleccionesView: View {
    @State var seleccionRecolecciones : String = "Recolecciones Pnedientes"

    let opcionesRecolecciones = ["Pendientes","Completadas"]
    
    var body: some View {
        
        VStack {
            Banner().frame(height: 100.0).ignoresSafeArea()
            NavigationStack{
                
                ZStack{
                   
                    Text("Recolecciones")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                    
                    Picker("Opciones",selection: $seleccionRecolecciones){
                        ForEach(opcionesRecolecciones, id: \.self){
                            opcion in Text(opcion).tag(opcion)
                        }
                    }.offset(x:0,y:40).pickerStyle(SegmentedPickerStyle())
                        
                    
                }.offset(x:0,y:-9)
                VStack{
                    List(listaRecolecciones){
                        recoleccionItem in NavigationLink{
                            DetalleView(recoleccion: recoleccionItem)
                        }label: {
                            RecoleccionRow(recoleccion: recoleccionItem)
                        }
                    
                    }.listStyle(.inset)
                    
                }
                .frame(height: 350.0)
                
                Image("logo-caritas")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .offset(x:0,y:30)
                    
                    
            }
            
        }
    }
}

struct RecoleccionesView_Previews: PreviewProvider {
    static var previews: some View {
        RecoleccionesView()
    }
}
