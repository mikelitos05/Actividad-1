// ===============================================
//  Gestion de Contactos (PSeInt)
// ===============================================

Funcion ok <- EsSoloDigitos(texto)
    Definir i Como Entero
    Definir c Como Cadena
    ok <- Verdadero
    
    Si Longitud(texto) = 0 Entonces
        ok <- Falso
    SiNo
        Para i <- 1 Hasta Longitud(texto) Hacer
            c <- Subcadena(texto, i, i)
            Si No (c >= "0" Y c <= "9") Entonces
                ok <- Falso
                i <- Longitud(texto)   // fuerza salida del bucle
            FinSi
        FinPara
    FinSi
    
    Escribir "Debug: ok=", ok  // opcional para pruebas
FinFuncion

Funcion numeroValido <- ValidadorNumero(mensaje, mensajeError)
    Definir numero Como Cadena
    numeroValido <- ""
    Escribir mensaje
    Repetir
        Leer numero
        Si EsSoloDigitos(numero) Entonces
            numeroValido <- numero
        SiNo
            Escribir mensajeError
        FinSi
    Hasta Que numeroValido <> ""
FinFuncion

Funcion idValido <- ValidadorId(mensaje, mensajeError)
    Definir id Como Entero
    Definir listo Como Logico
    listo <- Falso
    Repetir
        Escribir mensaje
        Leer id
        Si id >= 0 Entonces
            listo <- Verdadero
        SiNo
            Escribir mensajeError
        FinSi
    Hasta Que listo
    idValido <- id
FinFuncion

SubProceso MostrarMenu
    Escribir "--------------------------------------------------"
    Escribir "1. Mostrar contactos"
    Escribir "2. Agregar contacto"
    Escribir "3. Eliminar contacto por id"
    Escribir "4. Eliminar primer contacto"
    Escribir "5. Eliminar ultimo contacto"
    Escribir "6. Ordenar por nombre"
    Escribir "7. Ordenar por id"
    Escribir "8. Salir"
    Escribir "--------------------------------------------------"
FinSubProceso

SubProceso MostrarContactos(ids, nombres, direcciones, numeros, n)
    Si n = 0 Entonces
        Escribir "=================================================="
        Escribir "No hay contactos"
    SiNo
        Definir i Como Entero
        Para i <- 1 Hasta n Hacer
            Escribir "Id: ", ids[i]
            Escribir "Nombre: ", nombres[i]
            Escribir "Direccion: ", direcciones[i]
            Escribir "Numero: ", numeros[i]
            Escribir "=================================================="
        FinPara
    FinSi
FinSubProceso

SubProceso AgregarContacto(ids Por Referencia, nombres Por Referencia, direcciones Por Referencia, numeros Por Referencia, n Por Referencia, nombre, direccion, numero)
    n <- n + 1
    // Para imitar Java: id = tamaño anterior (n-1)
    ids[n] <- n - 1
    nombres[n] <- nombre
    direcciones[n] <- direccion
    numeros[n] <- numero
FinSubProceso

SubProceso AgregarContactosPorDefecto(ids Por Referencia, nombres Por Referencia, direcciones Por Referencia, numeros Por Referencia, n Por Referencia)
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Malagon", "Calle 1 #001", "3312345678")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Cota",    "Calle 2 #002", "3312345679")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Reyes",   "Calle 3 #003", "3312345680")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Caceres", "Calle 4 #004", "3312345681")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Zendejas","Calle 5 #005", "3312345682")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Maximin", "Calle 6 #006", "3312345683")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Borja",   "Calle 7 #007", "3312345684")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Fidalgo", "Calle 8 #008", "3312345685")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Dos Santos","Calle 9 #009","3312345686")
    AgregarContacto(ids, nombres, direcciones, numeros, n, "Martin",  "Calle 10 #010","3312345687")
FinSubProceso

Funcion eliminado <- EliminarContactoPorId(ids Por Referencia, nombres Por Referencia, direcciones Por Referencia, numeros Por Referencia, idBuscado, n Por Referencia)
    Definir i, pos Como Entero
    eliminado <- Falso
    pos <- -1
    
    Para i <- 1 Hasta n Hacer
        Si ids[i] = idBuscado Entonces
            pos <- i
            i <- n   // fuerza salida del bucle
        FinSi
    FinPara
    
    Si pos <> -1 Entonces
        Para i <- pos Hasta n-1 Hacer
            ids[i] <- ids[i+1]
            nombres[i] <- nombres[i+1]
            direcciones[i] <- direcciones[i+1]
            numeros[i] <- numeros[i+1]
        FinPara
        n <- n - 1
        eliminado <- Verdadero
    FinSi
FinFuncion

SubProceso EliminarUltimoContacto(ids Por Referencia, nombres Por Referencia, direcciones Por Referencia, numeros Por Referencia, n Por Referencia)
    Si n > 0 Entonces
        n <- n - 1
    FinSi
FinSubProceso

SubProceso EliminarPrimerContacto(ids Por Referencia, nombres Por Referencia, direcciones Por Referencia, numeros Por Referencia, n Por Referencia)
    Definir i Como Entero
    Si n > 0 Entonces
        Para i <- 1 Hasta n-1 Hacer
            ids[i] <- ids[i+1]
            nombres[i] <- nombres[i+1]
            direcciones[i] <- direcciones[i+1]
            numeros[i] <- numeros[i+1]
        FinPara
        n <- n - 1
    FinSi
FinSubProceso

SubProceso OrdenarPorNombre(ids Por Referencia, nombres Por Referencia, direcciones Por Referencia, numeros Por Referencia, n)
    Definir i, j Como Entero
    Definir auxId Como Entero
    Definir auxNom, auxDir, auxNum Como Cadena
    Para i <- 1 Hasta n-1 Hacer
        Para j <- 1 Hasta n-i Hacer
            Si Mayusculas(nombres[j]) > Mayusculas(nombres[j+1]) Entonces
                auxId <- ids[j]
                auxNom <- nombres[j]
                auxDir <- direcciones[j]
                auxNum <- numeros[j]
				
                ids[j] <- ids[j+1]
                nombres[j] <- nombres[j+1]
                direcciones[j] <- direcciones[j+1]
                numeros[j] <- numeros[j+1]
				
                ids[j+1] <- auxId
                nombres[j+1] <- auxNom
                direcciones[j+1] <- auxDir
                numeros[j+1] <- auxNum
            FinSi
        FinPara
    FinPara
FinSubProceso

SubProceso OrdenarPorId(ids Por Referencia, nombres Por Referencia, direcciones Por Referencia, numeros Por Referencia, n)
    Definir i, j Como Entero
    Definir auxId Como Entero
    Definir auxNom, auxDir, auxNum Como Cadena
    Para i <- 1 Hasta n-1 Hacer
        Para j <- 1 Hasta n-i Hacer
            Si ids[j] > ids[j+1] Entonces
                auxId <- ids[j]
                auxNom <- nombres[j]
                auxDir <- direcciones[j]
                auxNum <- numeros[j]
				
                ids[j] <- ids[j+1]
                nombres[j] <- nombres[j+1]
                direcciones[j] <- direcciones[j+1]
                numeros[j] <- numeros[j+1]
				
                ids[j+1] <- auxId
                nombres[j+1] <- auxNom
                direcciones[j+1] <- auxDir
                numeros[j+1] <- auxNum
            FinSi
        FinPara
    FinPara
FinSubProceso

SubProceso EjecutarApp
    Definir MAX, n, opcion Como Entero
    MAX <- 200
    n <- 0
	
    Dimension ids[MAX]
    Dimension nombres[MAX]
    Dimension direcciones[MAX]
    Dimension numeros[MAX]
	
    // Descomentar si se quiere cargar datos de prueba:
    // AgregarContactosPorDefecto(ids, nombres, direcciones, numeros, n)
	
    Repetir
        MostrarMenu
        Leer opcion
		
        Segun opcion Hacer
            1:
                MostrarContactos(ids, nombres, direcciones, numeros, n)
				
            2:
                Definir nombre, direccion, numero Como Cadena
                Escribir "Introduzca el nombre del contacto: "
                Leer nombre
                Escribir "Introduzca la direccion del contacto: "
                Leer direccion
                numero <- ValidadorNumero("Introduzca el numero del contacto:", "Numero no valido. Intente de nuevo.")
                AgregarContacto(ids, nombres, direcciones, numeros, n, nombre, direccion, numero)
				
            3:
                MostrarContactos(ids, nombres, direcciones, numeros, n)
                Si n > 0 Entonces
                    Definir id Como Entero
                    id <- ValidadorId("Introduzca la id a eliminar:", "Id no valida. Intente de nuevo.")
                    Definir ok Como Logico
                    ok <- EliminarContactoPorId(ids, nombres, direcciones, numeros, n, id)
                    Si No ok Entonces
                        Escribir "No existe un contacto con id ", id
                    FinSi
                FinSi
				
            4:
                Si n > 0 Entonces
                    EliminarPrimerContacto(ids, nombres, direcciones, numeros, n)
                FinSi
                MostrarContactos(ids, nombres, direcciones, numeros, n)
				
            5:
                Si n > 0 Entonces
                    EliminarUltimoContacto(ids, nombres, direcciones, numeros, n)
                FinSi
                MostrarContactos(ids, nombres, direcciones, numeros, n)
				
            6:
                OrdenarPorNombre(ids, nombres, direcciones, numeros, n)
                MostrarContactos(ids, nombres, direcciones, numeros, n)
				
            7:
                OrdenarPorId(ids, nombres, direcciones, numeros, n)
                MostrarContactos(ids, nombres, direcciones, numeros, n)
				
            97:
                AgregarContactosPorDefecto(ids, nombres, direcciones, numeros, n)
        FinSegun
    Hasta Que opcion = 8
FinSubProceso

Algoritmo GestionContactos
    EjecutarApp
FinAlgoritmo