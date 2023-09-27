//
//  PendienteOpciones.swift
//  CaritasCollect
//
//  Created by Alumno on 27/09/23.
//

import SwiftUI

struct PendienteOpciones: View {
    
    var recoleccion:Recoleccion
    @State private var OpcionSeleccionada: Int = 1
    @State private var mensaje: String = ""
    
    
    var body: some View {
        VStack{
            
            NavigationStack{
                
                VStack{
                    Text("\(recoleccion.direccion)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                    Text("Numero de Orden: \(recoleccion.id)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                    
                    
                    
                    Text("Pendiente")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top)
                        .foregroundColor(Color("320C"))
                    
                    Text("Elija la razon por la que esta recoleccion esta pendiente")
                        .font(.title3)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    Picker(selection: $OpcionSeleccionada, label: Text("Picker"))
                    {
                        Text("No esta en la ubicacion").tag(1)
                        
                        Text("No quizo pagarlo").tag(2)
                        
                        Text("Direccion incorrecta").tag(3)
                        
                        Text("No tiene el dinero completo").tag(4)
                        
                    }
                    .onChange(of: OpcionSeleccionada){
                        
                        value in mensaje="Opcion Seleccinada \(value)"
                    }
                    
                    
                    
                }.offset(x:0 , y:50)
                
                
                
                
                Spacer()
                Text(mensaje)
            }
            
        }
        
       
    }
    
}

struct PendienteOpciones_Previews: PreviewProvider {
    static var previews: some View {
        PendienteOpciones(recoleccion: listaRecolecciones[0])
    }
}
