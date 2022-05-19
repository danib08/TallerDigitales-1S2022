				
MAIN				B		inicio
				
				
inicio
				
				mov		r1, #0x200 ; inicio de cadena
				mov r2, #36 ; guarda el simbolo de entrada
				BEQ		Guardar_Palabra
				
Guardar_Palabra
				;========================Se	setea la palabra============
				;--------------- Palabra: vamos caminando --> vamos c$m$n$nd$
				mov		r3, #118 ; Valor de la en v ASCII
				str		r3, [r1] ; Almacena la v en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra
				

				mov		r3, #98 ; Valor de la en a ASCII
				str		r3, [r1] ; Almacena la a en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #109 ; Valor de la en m ASCII
				str		r3, [r1] ; Almacena la m en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #111 ; Valor de la en o ASCII
				str		r3, [r1] ; Almacena la o en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #115 ; Valor de la en s ASCII
				str		r3, [r1] ; Almacena la s en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #32 ; Valor del espacio en ASCII
				str		r3, [r1] ; Almacena la espacio en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #99 ; Valor de la c en ASCII
				str		r3, [r1] ; Almacena la c en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #97 ; Valor de la a en ASCII
				str		r3, [r1] ; Almacena la V en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #109 ; Valor de la m en ASCII
				str		r3, [r1] ; Almacena la m en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #105 ; Valor de la i en ASCII
				str		r3, [r1] ; Almacena la i en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #110 ; Valor de la n en ASCII
				str		r3, [r1] ; Almacena la n en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #97 ; Valor de la a en ASCII
				str		r3, [r1] ; Almacena la a en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #110 ; Valor de la n en ASCII
				str		r3, [r1] ; Almacena la n en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #100 ; Valor de la d en ASCII
				str		r3, [r1] ; Almacena la d en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov		r3, #111 ; Valor de la o en ASCII
				str		r3, [r1] ; Almacena la o en la direccion de memoria
				add		r1,r1,#4 ; suma 4 bytes para la siguiente letra

				mov r1, #0x200 ; vuelve a setear el registro en la ppsicion inicial nuevamente
				mov r3, #0
				
				
				B		revisar_Palabra

revisar_Palabra
				
	






				
