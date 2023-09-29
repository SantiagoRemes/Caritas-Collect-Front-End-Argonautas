//
//  PendienteOpciones.swift
//  CaritasCollect
//
//  Created by Santiago Remes Inguanzo on 28/09/2023.
//

import SwiftUI

struct PendienteOpciones: View {
    
    var recoleccion: RecoleccionDetalles
    @State private var OpcionSeleccionada: Int = 0
    
    
    let options = ["No esta en la ubicacion","No quizo pagarlo","Direccion incorrecta","No tiene el dinero completo"]
    
    var body: some View {
        VStack{
            
            NavigationStack{
                
                VStack{
                    Text("\(recoleccion.direccion)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                    Text("Numero de Orden: \(recoleccion._id_recibo)")
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
                    
                    Picker(selection: $OpcionSeleccionada, label: Text("Picker")){
                        ForEach(0..<options.count){ index in Text(options[index])}
                    }
                    Text("Opcion seleccionada: \(options[OpcionSeleccionada])")
                        
                        
                        NavigationLink(destination: PendienteOpciones(recoleccion: recoleccion)) {
                            Text("Pendiente")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .frame(width: 120.0, height: 70.0)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("1575C"))
                        .offset(x: 20)
                    
                    }
                    
                    
                    
                }.offset(x:0 , y:50)
                
                
                
                
                Spacer()
               
            }
        .toolbar(.hidden)
            
        }
        
       
    }
    


struct PendienteOpciones_Previews: PreviewProvider {
    static var previews: some View {
        PendienteOpciones(recoleccion: RecoleccionDetalles(_id_donador: 0, _id_recibo: 0, _id_recolector: 0, comentarios: "", direccion: "", estado_recogido: "", lnombre_donador: "", pnombre_donador: "", tel_casa: 0, tel_celular: 0))
    }
}
