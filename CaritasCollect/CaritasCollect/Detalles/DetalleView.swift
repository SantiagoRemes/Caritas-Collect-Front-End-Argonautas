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
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "arrow.left.circle.fill").resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(height: 35.0).offset(y:-5).ignoresSafeArea().tint(Color ("1575C")) // Usa una imagen del sistema
        }
    }
    
    let idRecibo: Int
    
    init(idRecibo: Int) {
            self.idRecibo = idRecibo
        }
    
    var body: some View {
        
            VStack{
                
                NavigationStack{
                    
                    VStack{
                        
                        Text("\(recoleccion.direccion)")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("302C"))
                            .offset(y:2).navigationBarBackButtonHidden(true)
                            .navigationBarItems(leading: backButton)
                        
                        Text("Numero de Orden: \(recoleccion._id_recibo)")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("302C"))
                            
                        HStack{
                            VStack{
                                Text("Donador: ").font(.title2).fontWeight(.bold).foregroundColor(Color("302C")).multilineTextAlignment(.leading).offset( x:-26,y:5)
                                
                                Text("Telefono de Casa: ").font(.title2).fontWeight(.bold).foregroundColor(Color("302C")).offset( x:16,y:5)
                                
                                Text("Telefono Celular: ").font(.title2).fontWeight(.bold).foregroundColor(Color("302C")).offset(x:12,y:5)
                            }
                            VStack{
                                Text("\(recoleccion.pnombre_donador) \(recoleccion.lnombre_donador)").font(.title2).fontWeight(.bold).foregroundColor(Color("302C")).offset(x:-20, y:5)
                                
                                Text(String(recoleccion.tel_casa) ).font(.title2).fontWeight(.bold).foregroundColor(Color("302C")).offset( y:5)
                                
                                Text(String(recoleccion.tel_celular) ).font(.title2).fontWeight(.bold).foregroundColor(Color("302C")).offset( y:5)
                                
                            }.offset()
                        }.frame(width: 400)
                    }.padding(.bottom,1)
                    
                    VStack{
                        MapaView(latitud: 25.649991, longitud: -100.29074)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(height: 230)
                    }
                 
                    VStack{
                        
                        
                        VStack{
                            if(recoleccion.comentarios != ""){
                                Text("Comentarios")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("302C"))
                                
                                Text("\(recoleccion.comentarios)")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("302C"))
                                
                                
                                
                            }
                        }
                            
                        VStack{
                            
                            if(recoleccion.estado_recogido != "Cobrado"){
                                Button{
                                    PutEstado(id: idRecibo, estado: "Cobrado", comentarios: "")
                                    
                                    dismiss()
                                }label: {
                                    Text("Cobrado")
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .frame(width: 300, height: 55.0)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color("1575C"))
                                
                               
                                NavigationLink(destination: PendienteOpciones(recoleccion: recoleccion)) {
                                    Text("No cobrado")
                                        .foregroundColor(Color("1575C"))
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .frame(width: 300.0, height: 55.0)
                                        .frame(width: 300.0, height: 55.0)
                                    
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.white)
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("1575C"), lineWidth: 4))
                                .offset(y:10)
                                .onAppear() {
                                    if (regresar) {
                                        regresar = false
                                        dismiss()
                                    }
                                }
                            }
                        }
                        
                        
                    }
                    
                    Spacer()
                }.offset(y:-20)
                
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
