Proceso GestionContactos_Completo
    // Variables principales
    Definir ids, nombres, direcciones, numeros Como Cadena
    Definir n, opcion, idBuscado, nombre, direccion, numero Como Entero
    Definir i, j Como Entero
    Definir tempId, tempNombre, tempDireccion, tempNumero Como Cadena
    Definir valido Como Logico
    Definir texto, c Como Cadena
    Definir pos Como Entero
    Definir ok Como Logico
    Dimension ids[100], nombres[100], direcciones[100], numeros[100]
	
    // Inicializar
    n <- 0
	
    // Agregar contactos por defecto
    ids[1] <- "1"
    nombres[1] <- "Juan"
    direcciones[1] <- "Calle A"
    numeros[1] <- "111111"
    ids[2] <- "2"
    nombres[2] <- "Ana"
    direcciones[2] <- "Calle B"
    numeros[2] <- "222222"
    n <- 2
	
    Repetir
        // Mostrar menu
        Escribir "1. Mostrar contactos"
        Escribir "2. Agregar contacto"
        Escribir "3. Eliminar contacto por ID"
        Escribir "4. Eliminar primer contacto"
        Escribir "5. Eliminar ultimo contacto"
        Escribir "6. Ordenar por nombre"
        Escribir "7. Ordenar por ID"
        Escribir "0. Salir"
        Leer opcion
		
        Segun opcion Hacer
            1:
                // Mostrar contactos
                Si n = 0 Entonces
                    Escribir "No hay contactos."
                Sino
                    Para i <- 1 Hasta n Con Paso 1 Hacer
                        Escribir "ID: ", ids[i]
                        Escribir "Nombre: ", nombres[i]
                        Escribir "Direccion: ", direcciones[i]
                        Escribir "Numero: ", numeros[i]
                        Escribir "-------------------"
                    FinPara
                FinSi
				
            2:
                // Agregar contacto
                Repetir
                    Escribir "Ingrese ID (solo digitos):"
                    Leer texto
                    // EsSoloDigitos
                    ok <- Verdadero
                    Si Longitud(texto) = 0 Entonces
                        ok <- Falso
                    FinSi
                    Para i <- 1 Hasta Longitud(texto) Hacer
                        c <- Subcadena(texto, i, i)
                        Si No (c >= "0" Y c <= "9") Entonces
                            ok <- Falso
                        FinSi
                    FinPara
                Hasta Que ok
				
                ids[n+1] <- texto
				
                Escribir "Ingrese nombre:"
                Leer nombres[n+1]
                Escribir "Ingrese direccion:"
                Leer direcciones[n+1]
				
                Repetir
                    Escribir "Ingrese numero (solo digitos):"
                    Leer texto
                    ok <- Verdadero
                    Si Longitud(texto) = 0 Entonces
                        ok <- Falso
                    FinSi
                    Para i <- 1 Hasta Longitud(texto) Hacer
                        c <- Subcadena(texto, i, i)
                        Si No (c >= "0" Y c <= "9") Entonces
                            ok <- Falso
                        FinSi
                    FinPara
                Hasta Que ok
				
                numeros[n+1] <- texto
                n <- n + 1
				
            3:
                // Eliminar contacto por ID
                Escribir "Ingrese ID a eliminar:"
                Leer idBuscado
                pos <- -1
                Para i <- 1 Hasta n Hacer
                    Si ids[i] = ConvertirATexto(idBuscado) Entonces
                        pos <- i
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
                    Escribir "Contacto eliminado."
                Sino
                    Escribir "No encontrado."
                FinSi
				
            4:
                // Eliminar primer contacto
                Si n > 0 Entonces
                    Para i <- 1 Hasta n-1 Hacer
                        ids[i] <- ids[i+1]
                        nombres[i] <- nombres[i+1]
                        direcciones[i] <- direcciones[i+1]
                        numeros[i] <- numeros[i+1]
                    FinPara
                    n <- n - 1
                    Escribir "Primer contacto eliminado."
                Sino
                    Escribir "No hay contactos."
                FinSi
				
            5:
                // Eliminar ultimo contacto
                Si n > 0 Entonces
                    n <- n - 1
                    Escribir "Ultimo contacto eliminado."
                Sino
                    Escribir "No hay contactos."
                FinSi
				
            6:
                // Ordenar por nombre
                Para i <- 1 Hasta n-1 Hacer
                    Para j <- i+1 Hasta n Hacer
                        Si nombres[i] > nombres[j] Entonces
                            tempId <- ids[i]
                            ids[i] <- ids[j]
                            ids[j] <- tempId
							
                            tempNombre <- nombres[i]
                            nombres[i] <- nombres[j]
                            nombres[j] <- tempNombre
							
                            tempDireccion <- direcciones[i]
                            direcciones[i] <- direcciones[j]
                            direcciones[j] <- tempDireccion
							
                            tempNumero <- numeros[i]
                            numeros[i] <- numeros[j]
                            numeros[j] <- tempNumero
                        FinSi
                    FinPara
                FinPara
                Escribir "Contactos ordenados por nombre."
				
            7:
                // Ordenar por ID
                Para i <- 1 Hasta n-1 Hacer
                    Para j <- i+1 Hasta n Hacer
                        Si ids[i] > ids[j] Entonces
                            tempId <- ids[i]
                            ids[i] <- ids[j]
                            ids[j] <- tempId
							
                            tempNombre <- nombres[i]
                            nombres[i] <- nombres[j]
                            nombres[j] <- tempNombre
							
                            tempDireccion <- direcciones[i]
                            direcciones[i] <- direcciones[j]
                            direcciones[j] <- tempDireccion
							
                            tempNumero <- numeros[i]
                            numeros[i] <- numeros[j]
                            numeros[j] <- tempNumero
                        FinSi
                    FinPara
                FinPara
                Escribir "Contactos ordenados por ID."
				
            0:
                Escribir "Saliendo del programa..."
        FinSegun
    Hasta Que opcion = 0
FinProceso
