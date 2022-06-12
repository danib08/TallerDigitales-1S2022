				MOV		r1, #0x0	; inicio de cadena
				MOV		r2, #36		; guarda el simbolo de entrada
				MOV		r5, #0		; guarda la posicion inicial de la palabra actual
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
