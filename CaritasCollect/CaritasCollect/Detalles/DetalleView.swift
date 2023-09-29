//
//  DetalleView.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetalleView: View {
    @State private var recoleccion: RecoleccionDetalles = RecoleccionDetalles(_id_donador: 0, _id_recibo: 0, _id_recolector: 0, comentarios: "", direccion: "", estado_recogido: "", lnombre_donador: "", pnombre_donador: "", tel_casa: 0, tel_celular: 0)
    
    @Environment(\.dismiss) private var dismiss
    
    let idRecibo: Int
    
    init(idRecibo: Int) {
            self.idRecibo = idRecibo
        }
    
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
                    }.offset(x:0 , y:50)
                    
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
                        HStack{
                            
                            if(recoleccion.estado_recogido != "Recogido"){
                                Button{
                                    PutEstado(id: idRecibo, estado: "Recogido", comentarios: "")
                                    dismiss()
                                }label: {
                                    Text("Entregado")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        .frame(width: 120.0, height: 70.0)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color("1575C"))
                                .offset(x:-20)
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
                        }
                        .padding(.top)
                    }
                    
                    Spacer()
                }
                .offset(x:0, y:-70)
                .onAppear(){
                    recoleccion = GetDetalles(id: idRecibo)
                }
            }
        }
    }

struct DetalleView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleView(idRecibo: 0)
    }
}
