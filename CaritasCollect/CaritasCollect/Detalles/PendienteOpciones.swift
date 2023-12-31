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
    
    
    let options = ["No esta en la ubicación","No quizo pagarlo","Dirección incorrecta","No tiene el dinero completo"]
    
    @Environment(\.dismiss) private var dismiss
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "arrow.left.circle.fill").resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(height: 35.0).offset(y:-5).ignoresSafeArea().tint(Color ("1575C")) // Usa una imagen del sistema
        }
    }
    
    var body: some View {
        VStack{
            
            NavigationStack{
                
                VStack{
                    Text("\(recoleccion.direccion)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: backButton)
                    Text("Numero de Orden: \(recoleccion._id_recibo)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                    
                    
                    
                    Text("No cobrado")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top)
                        .foregroundColor(Color("320C"))
                    
                    Text("Elija la razón por la que esta recoleccion no esta cobrada")
                        .font(.title)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.top)

                        Picker("Comentario", selection: $OpcionSeleccionada){
                            ForEach(0..<options.count){ index in Text(options[index])
                                    .font(.title)
                            }
                        }
                        .pickerStyle(.wheel)
                        .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color("1575C"), lineWidth: 4))
                        .padding(.horizontal, 20)
                        
                    Button{
                        PutEstado(id: recoleccion._id_recibo, estado: "NoCobrado", comentarios: options[OpcionSeleccionada])
                        regresar = true
                        dismiss()
                    }label: {
                        Text("No Cobrado")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .frame(width: 120.0, height: 70.0)
                    }
                    .padding(.top, 40)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("1575C"))
                    Spacer()
                    }
                }.offset(x:0 , y:0)
                Spacer()
        }.offset(y:-20)
    }
}

struct PendienteOpciones_Previews: PreviewProvider {
    static var previews: some View {
        PendienteOpciones(recoleccion: RecoleccionDetalles(_id_donador: 0, _id_recibo: 0, _id_recolector: 0, comentarios: "", lat: 0, lon: 0, direccion: "", estado_recogido: "", lnombre_donador: "", pnombre_donador: "", tel_casa: 0, tel_celular: 0))
    }
}
