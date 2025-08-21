Proceso Principal
	Definir opcion Como Entero
	
	Repetir
		Escribir "============================="
		Escribir "      MENU PRINCIPAL"
		Escribir "============================="
		Escribir "1. Contactos"
		Escribir "2. Pila"
		Escribir "3. Cola"
		Escribir "4. Salir"
		Escribir "============================="
		Leer opcion
		
		Segun opcion Hacer
			1:
				MenuContactos
			2:
				MenuPila
			3:
				MenuCola
		FinSegun
		
	Hasta Que opcion = 4
FinProceso


SubProceso MenuContactos
	Dimension nombres[100], direcciones[100], numeros[100], ids[100]
	Definir tamano, opcion, i, j, elimId, AuxId Como Entero
	Definir encontrado Como Logico
	Definir AuxNombre, AuxDireccion, AuxNumero Como Cadena
	
	tamano <- 0
	
	Repetir
		Escribir "---------------------------"
		Escribir "     MENU CONTACTOS"
		Escribir "---------------------------"
		Escribir "1. Mostrar contactos"
		Escribir "2. Agregar contacto"
		Escribir "3. Eliminar contacto por ID"
		Escribir "4. Ordenar contactos por ID"
		Escribir "5. Ordenar contactos por Nombre"
		Escribir "6. Eliminar primer contacto"
		Escribir "7. Eliminar ultimo contacto"
		Escribir "8. Volver"
		Leer opcion
		
		Segun opcion Hacer
			1:
				Si tamano = 0 Entonces
					Escribir "No hay contactos registrados."
				SiNo
					Para i <- 0 Hasta tamano - 1 Hacer
						Escribir "ID: ", ids[i], " | Nombre: ", nombres[i], " | Direccion: ", direcciones[i], " | Numero: ", numeros[i]
					FinPara
				FinSi
				
			2:
				Escribir "Ingrese ID: "
				Leer ids[tamano]
				Escribir "Ingrese nombre: "
				Leer nombres[tamano]
				Escribir "Ingrese direccion: "
				Leer direcciones[tamano]
				Escribir "Ingrese numero: "
				Leer numeros[tamano]
				tamano <- tamano + 1
				
			3:
				Escribir "Ingrese ID a eliminar: "
				Leer elimId
				encontrado <- Falso
				Para i <- 0 Hasta tamano - 1 Hacer
					Si ids[i] = elimId Entonces
						Para j <- i Hasta tamano - 2 Hacer
							ids[j] <- ids[j + 1]
							nombres[j] <- nombres[j + 1]
							direcciones[j] <- direcciones[j + 1]
							numeros[j] <- numeros[j + 1]
						FinPara
						tamano <- tamano - 1
						encontrado <- Verdadero
					FinSi
				FinPara
				Si No encontrado Entonces
					Escribir "No existe contacto con ese ID"
				FinSi
				
			4:
				Para i <- 0 Hasta tamano - 2 Hacer
					Para j <- 0 Hasta tamano - 2 - i Hacer
						Si ids[j] > ids[j + 1] Entonces
							AuxId <- ids[j]
							ids[j] <- ids[j + 1]
							ids[j + 1] <- AuxId
							
							AuxNombre <- nombres[j]
							nombres[j] <- nombres[j + 1]
							nombres[j + 1] <- AuxNombre
							
							AuxDireccion <- direcciones[j]
							direcciones[j] <- direcciones[j + 1]
							direcciones[j + 1] <- AuxDireccion
							
							AuxNumero <- numeros[j]
							numeros[j] <- numeros[j + 1]
							numeros[j + 1] <- AuxNumero
						FinSi
					FinPara
				FinPara
				Escribir "Contactos ordenados por ID."
				
			5:
				Para i <- 0 Hasta tamano - 2 Hacer
					Para j <- 0 Hasta tamano - 2 - i Hacer
						Si nombres[j] > nombres[j + 1] Entonces
							AuxId <- ids[j]
							ids[j] <- ids[j + 1]
							ids[j + 1] <- AuxId
							
							AuxNombre <- nombres[j]
							nombres[j] <- nombres[j + 1]
							nombres[j + 1] <- AuxNombre
							
							AuxDireccion <- direcciones[j]
							direcciones[j] <- direcciones[j + 1]
							direcciones[j + 1] <- AuxDireccion
							
							AuxNumero <- numeros[j]
							numeros[j] <- numeros[j + 1]
							numeros[j + 1] <- AuxNumero
						FinSi
					FinPara
				FinPara
				Escribir "Contactos ordenados por nombre."
				
			6:
				Si tamano > 0 Entonces
					Para i <- 0 Hasta tamano - 2 Hacer
						ids[i] <- ids[i + 1]
						nombres[i] <- nombres[i + 1]
						direcciones[i] <- direcciones[i + 1]
						numeros[i] <- numeros[i + 1]
					FinPara
					tamano <- tamano - 1
				SiNo
					Escribir "Lista vacia."
				FinSi
				
			7:
				Si tamano > 0 Entonces
					tamano <- tamano - 1
				SiNo
					Escribir "Lista vacia."
				FinSi
		FinSegun
		
	Hasta Que opcion = 8
FinSubProceso


SubProceso MenuPila
	Dimension pila[100]
	Definir tope, opcion, valor, i Como Entero
	tope <- -1
	
	Repetir
		Escribir "---------------------------"
		Escribir "        MENU PILA"
		Escribir "---------------------------"
		Escribir "1. Apilar"
		Escribir "2. Desapilar"
		Escribir "3. Mostrar pila"
		Escribir "4. Volver"
		Leer opcion
		
		Segun opcion Hacer
			1:
				Si tope < 99 Entonces
					Escribir "Ingrese valor a apilar: "
					Leer valor
					tope <- tope + 1
					pila[tope] <- valor
				SiNo
					Escribir "La pila esta llena."
				FinSi
				
			2:
				Si tope >= 0 Entonces
					Escribir "Elemento desapilado: ", pila[tope]
					tope <- tope - 1
				SiNo
					Escribir "La pila esta vacia."
				FinSi
				
			3:
				Si tope >= 0 Entonces
					Para i <- tope Hasta 0 Con Paso -1 Hacer
						Escribir pila[i]
					FinPara
				SiNo
					Escribir "La pila esta vacia."
				FinSi
		FinSegun
		
	Hasta Que opcion = 4
FinSubProceso


SubProceso MenuCola
	Dimension cola[100]
	Definir frente, colaFin, opcion, valor, i Como Entero
	frente <- 0
	colaFin <- -1
	
	Repetir
		Escribir "---------------------------"
		Escribir "        MENU COLA"
		Escribir "---------------------------"
		Escribir "1. Encolar"
		Escribir "2. Desencolar"
		Escribir "3. Mostrar cola"
		Escribir "4. Volver"
		Leer opcion
		
		Segun opcion Hacer
			1:
				Si colaFin < 99 Entonces
					Escribir "Ingrese valor a encolar: "
					Leer valor
					colaFin <- colaFin + 1
					cola[colaFin] <- valor
				SiNo
					Escribir "La cola esta llena."
				FinSi
				
			2:
				Si frente <= colaFin Entonces
					Escribir "Elemento desencolado: ", cola[frente]
					frente <- frente + 1
				SiNo
					Escribir "La cola esta vacia."
				FinSi
				
			3:
				Si frente <= colaFin Entonces
					Para i <- frente Hasta colaFin Hacer
						Escribir cola[i]
					FinPara
				SiNo
					Escribir "La cola esta vacia."
				FinSi
		FinSegun
		
	Hasta Que opcion = 4
FinSubProceso
