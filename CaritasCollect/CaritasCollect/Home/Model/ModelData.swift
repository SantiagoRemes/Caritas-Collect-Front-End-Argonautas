//
//  ModelData.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import Foundation

func callAPILista(idRecolector: Int, estado: String)-> Array<Recoleccion>  {
    var res : Array<Recoleccion> = []
    guard let url = URL(string:"http://192.168.1.131:10206/recolecciones?id=\(idRecolector)&estado=\(estado)") else{
        return res
    }
    
    let group = DispatchGroup()
   group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let recoleccionList = try jsonDecoder.decode([Recoleccion].self, from: data!)
                for recoleccionitem in recoleccionList {
                    res.append(Recoleccion(id: recoleccionitem.id, direccion: recoleccionitem.direccion))
                    print("Id: \(recoleccionitem.id) - Titulo: \(recoleccionitem.direccion) ")
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return res
}





var listaRecolecciones = cargardatos()

func cargardatos() -> Array<Recoleccion> {
    let listaRecolecciones = [
    Recoleccion(id: 1, direccion: "Juan Velazques,203"),
    Recoleccion(id: 2, direccion: "Arnoldo Star,403"),
    Recoleccion(id: 3, direccion: "Rodolfo Alamo,405"),
    Recoleccion(id: 4, direccion: "Bosques Palemira,453"),
    Recoleccion(id: 5, direccion: "Eleuterio Gonzales,192"),
    Recoleccion(id: 6, direccion: "Ruiz Cortines,342")
    ]
    
    return listaRecolecciones
}


