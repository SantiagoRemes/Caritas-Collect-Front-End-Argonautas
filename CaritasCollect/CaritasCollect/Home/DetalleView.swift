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
        Text("Datos Recoleccion")
        Text("Numero de Orden = \(recoleccion.id)")
    }
}

struct DetalleView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleView(recoleccion: listaRecolecciones[0])
    }
}
