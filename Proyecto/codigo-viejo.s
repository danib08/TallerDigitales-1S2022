MAIN				B		inicio
				
				
inicio
				MOV		r1, #0x10000 ; inicio de cadena
				MOV		r2, #36    ; guarda el simbolo de entrada
				MOV		r5, #0	 ; guarda la posicion inicial de la palabra actual
				B		Guardar_Palabra
				
Guardar_Palabra
				;===================	Se setea la palabra =====================
				;---------------	Palabra: vamos caminando siempre --> vamos c$m$n$nd$ s$$mpr$
				
				MOV		r3, #118     ; Valor de la en v ASCII
				STR		r3, [r1]     ; Almacena la v en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #97      ; Valor de la en a ASCII
				STR		r3, [r1]     ; Almacena la a en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #109     ; Valor de la en m ASCII
				STR		r3, [r1]     ; Almacena la m en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #111     ; Valor de la en o ASCII
				STR		r3, [r1]     ; Almacena la o en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #115     ; Valor de la en s ASCII
				STR		r3, [r1]     ; Almacena la s en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #32      ; Valor del espacio en ASCII
				STR		r3, [r1]     ; Almacena la espacio en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #99      ; Valor de la c en ASCII
				STR		r3, [r1]     ; Almacena la c en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #97      ; Valor de la a en ASCII
				STR		r3, [r1]     ; Almacena la V en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #109     ; Valor de la m en ASCII
				STR		r3, [r1]     ; Almacena la m en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #105     ; Valor de la i en ASCII
				STR		r3, [r1]     ; Almacena la i en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #110     ; Valor de la n en ASCII
				STR		r3, [r1]     ; Almacena la n en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #97      ; Valor de la a en ASCII
				STR		r3, [r1]     ; Almacena la a en la direccion de memoria
				ADD		r1,r1,#4     ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #110     ; Valor de la n en ASCII
				STR		r3, [r1]     ; Almacena la n en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #100     ; Valor de la d en ASCII
				STR		r3, [r1]     ; Almacena la d en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #111     ; Valor de la o en ASCII
				STR		r3, [r1]     ; Almacena la o en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #32      ; Valor del espacio en ASCII
				STR		r3, [r1]     ; Almacena la espacio en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #115     ; Valor de la en s ASCII
				STR		r3, [r1]     ; Almacena la s en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #105     ; Valor de la i en ASCII
				STR		r3, [r1]     ; Almacena la i en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #101     ; Valor de la e en ASCII
				STR		r3, [r1]     ; Almacena la e en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #109     ; Valor de la m en ASCII
				STR		r3, [r1]     ; Almacena la m en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #112     ; Valor de la p en ASCII
				STR		r3, [r1]     ; Almacena la p en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #114     ; Valor de la r en ASCII
				STR		r3, [r1]     ; Almacena la r en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r3, #101     ; Valor de la e en ASCII
				STR		r3, [r1]     ; Almacena la e en la direccion de memoria
				ADD		r1, r1, #4   ; suma 4 bytes para la siguiente letra
				
				MOV		r1, #0x10000   ; vuelve a setear el registro en la posicion inicial
				MOV		r3, #0	     ; contador para el numero de vocales
				MOV		r5, r1
				
				B		revisar_Palabra
				
revisar_Palabra
				LDR		r4, [r1]
				CMP		r4, #97		; compara con 'a'
				BEQ		sumaAContador
				
				CMP		r4, #101 		; compara con 'e'
				BEQ		sumaAContador
				
				CMP		r4, #105 		; compara con 'i'
				BEQ		sumaAContador
				
				CMP		r4, #111		; compara con 'o'
				BEQ		sumaAContador
				
				CMP		r4, #117		; compara con 'u'
				BEQ		sumaAContador
				
				CMP		r4, #32		; compara con espacio en blanco
				BEQ		fin_Palabra
				
				CMP		r4, #0		; compara con caracter nulo (fin de la frase)
				MOVEQ	r7, #1		; flag para indicar que termino la frase
				BEQ		fin_Palabra
				
				ADD		r1, r1, #4
				B		revisar_Palabra
				
sumaAContador
				ADD		r3, r3, #1	; se suma 1 al contador de vocales
				ADD		r1, r1, #4	; se pasa a la siguiente direccion en memoria
				B		revisar_Palabra
				
fin_Palabra
				CMP		r3, #3		; revisar si el contador R3 es mayor o igual a 4
				BGE		cambios_Palabra
				ADD		r1, r1, #4	; se pasa a la siguiente direccion en memoria
				MOV		r3, #0		; se resetea al contador
				MOV		r5, r1		; se actualiza la posicion inicial de la palabra
				
				CMP		r7, #1		; si flag no es 1 (no es el fin de la frase)
				BNE		revisar_Palabra ; se continua revisando el resto de la cadena
				BEQ		fin_Programa
				
cambios_Palabra
				;		cambios de vocales a $
				LDR		r6, [r5]
				
				CMP		r6, #97		; compara con 'a'
				BEQ		cambio_Caracter
				
				CMP		r6, #101 		; compara con 'e'
				BEQ		cambio_Caracter
				
				CMP		r6, #105 		; compara con 'i'
				BEQ		cambio_Caracter
				
				CMP		r6, #111		; compara con 'o'
				BEQ		cambio_Caracter
				
				CMP		r6, #117		; compara con 'u'
				BEQ		cambio_Caracter
				
				CMP		r6, #32		; compara con espacio en blanco
				BEQ		fin_Cambios
				
				CMP		r6, #0		; compara con caracter nulo (fin de la frase)
				BEQ		fin_Programa
				
				ADD		r5, r5, #4     ; suma 4 bytes para la siguiente letra
				B		cambios_Palabra
				
cambio_Caracter
				MOV		r0, r2       ; Valor del simbolo $ en ASCII
				STR		r0, [r5]     ; Almacena el $ en la direccion de memoria
				ADD		r5, r5, #4   ; suma 4 bytes para la siguiente letra
				B		cambios_Palabra
				
fin_Cambios
				ADD		r1, r1, #4	; se pasa a la siguiente direccion en memoria
				MOV		r3, #0		; se resetea al contador
				MOV		r5, r1		; se actualiza la posicion inicial de la palabra
				B		revisar_Palabra
				
fin_Programa
				END