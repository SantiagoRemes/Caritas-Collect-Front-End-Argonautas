//
//  MapaView.swift
//  CaritasCollect
//
//  Created by Alumno on 20/09/23.
//

import SwiftUI

struct MapaView: View {
    var recoleccion:Recoleccion
    var body: some View {
        VStack{
            Banner().frame(height: 100.0).ignoresSafeArea()
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
                }
                
                VStack{
                    
                }
             
                
                Spacer()
            }
            
        }
    }
}
struct MapaView_Previews: PreviewProvider {
    static var previews: some View {
        MapaView(recoleccion: listaRecolecciones[0])
    }
}
