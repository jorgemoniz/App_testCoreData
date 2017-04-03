//
//  ViewController.swift
//  App_IntroCoreData
//
//  Created by Jorge Moñiz on 3/4/17.
//  Copyright © 2017 jorgemoniz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //MARK: - Variables locales
    var managedContext : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1 -> Creamos la instacia a través de la cual salvaremos los datos en CoreData
        let customPersona = Persona(context: managedContext)
        customPersona.firstname = "Jorge"
        customPersona.lastname = "Moñiz"
        customPersona.phone = "566778899"
        
        //2 -> Salvar los datos a través del contexto
        do {
            try managedContext.save()
            //print("datos salvados correctamente")
        } catch {
            print("Error salvando datos")
        }
        
        //3 -> Recuperación de datos - Query
        let customRequest : NSFetchRequest<Persona> = Persona.fetchRequest()
        let customPredicate = NSPredicate(format : "nombre = 'Felipe'")
        let customSortDescriptor = NSSortDescriptor(key: "lastname", ascending: false)
        
        customRequest.predicate = customPredicate
        customRequest.sortDescriptors = [customSortDescriptor]
        
        do {
            let multitud = try managedContext.fetch(customRequest)
            for c_persona in  multitud {
                print("Nombre: \(c_persona.firstname!)\nApellido: \(c_persona.lastname!)\nMovil: \(c_persona.phone)\n\n")
            }
        } catch {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

