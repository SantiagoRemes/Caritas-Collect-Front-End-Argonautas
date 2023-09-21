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
                }.offset(x:0 , y:20)
                
                VStack{
                    Image("mty2")
                        .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350.0, height: 350.0)
                }.offset(x:0 , y:20)
             
                VStack{
                    Text("Estatus de Recoleccion")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
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
