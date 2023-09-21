//
//  ModelData.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import Foundation

func callAPILista(idRecolector: Int, estado: String) -> Recolecciones {
    
    var lista : Recolecciones = Recolecciones(recolecciones: [], success: false)
    
    guard let url = URL(string:"http://10.14.255.69:10206/recolecciones?id=\(idRecolector)&estado=\(estado)") else{
        return lista
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let getRecolecciones = try jsonDecoder.decode(Recolecciones.self, from: data!)
                lista = getRecolecciones
                print("success \(lista.success)")
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return lista
}


var aaaaa = callAPILista(idRecolector: 1, estado: "Pendiente")
