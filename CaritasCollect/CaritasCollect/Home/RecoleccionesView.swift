//
//  RecoleccionesView.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct RecoleccionesView: View {
    @State var seleccionRecolecciones : String = "No Cobrado"

    let opcionesRecolecciones = ["No Cobrado","Cobrado"]
    
    @State private var listaRecolecciones : [Detalles] = []
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("1575C"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color("1575C"))], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .white
    }
    
    var body: some View {
        
        VStack {
            NavigationStack{
                
                ZStack{
                   
                    Text("Recolecciones")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                    
                    Picker("Opciones",selection: $seleccionRecolecciones){
                        ForEach(opcionesRecolecciones, id: \.self){
                            opcion in Text(opcion)
                                .tag(opcion)
                        }
                    }
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("1575C"), lineWidth: 4))
                    .frame(height: 1)
                    .padding(.horizontal, 16)
                    .offset(x:0,y:35)
                    .pickerStyle(SegmentedPickerStyle()).foregroundColor(Color.orange)
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 1.02, height: 1.3))
                    .onChange(of: seleccionRecolecciones) {
                        value in
                        listaRecolecciones = callAPIRecolecciones(idRecolector: idRecolector, estado: seleccionRecolecciones).recolecciones
                    }
                        
                    
                }.offset(x:0,y:-9)
                    .padding(.bottom, 30)
                
                VStack{
                    List(listaRecolecciones) { recoleccionItem in
                        NavigationLink(
                            destination: DetalleView(idRecibo: recoleccionItem.id),
                            label: {
                                RecoleccionRow(recoleccion: recoleccionItem)
                            }
                        )
                    }.listStyle(.inset)
                    
                }
                .frame(height: 350.0)
                .offset(y: 10)
                
                Image("logo-caritas")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .offset(x:0,y:30)
                    
                    
            }
            
        }
        .onAppear(){
            listaRecolecciones = callAPIRecolecciones(idRecolector: idRecolector, estado: seleccionRecolecciones).recolecciones
        }
        .refreshable {
            listaRecolecciones = callAPIRecolecciones(idRecolector: idRecolector, estado: seleccionRecolecciones).recolecciones
        }
    }
}

struct RecoleccionesView_Previews: PreviewProvider {
    static var previews: some View {
        RecoleccionesView()
    }
}
