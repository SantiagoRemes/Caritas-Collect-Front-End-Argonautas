//
//  DetalleView.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetalleView: View {
    var recoleccion: Detalles
    var body: some View {
        
        VStack {
            Text("Detalles de recolección")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("320C"))
                .padding(.bottom, 50)
            Text("Dirección: \(recoleccion.direccion)")
                .font(.title)
                .fontWeight(.semibold)
            Text("Estado: \(recoleccion.estadoRecogido.rawValue)")
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding(.bottom, 300)
    }
}

struct DetalleView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleView(recoleccion: Detalles(id: 1, idRecolector: 2, direccion: "Sample Address", estadoRecogido: .pendiente))
    }
}
