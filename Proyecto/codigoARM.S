				
MAIN				B		inicio
				
				
inicio
				MOV		r1, #0x10000 ; inicio de cadena
				MOV		r2, #36    ; guarda el simbolo de entrada
				BEQ		Guardar_Palabra
				
Guardar_Palabra
				;===================	Se setea la palabra =====================
				;---------------	Palabra: vamos caminando --> vamos c$m$n$nd$
				
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
				
				MOV		r1, #0x10000   ; vuelve a setear el registro en la posicion inicial
				MOV		r3, #0	   ; contador para el numero de vocales
				
				
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
				
				ADD		r1, r1, #4
				B		revisar_Palabra
				
sumaAContador
				ADD		r3, r3, #1	; se suma 1 al contador de vocales
				ADD		r1, r1, #4	; se pasa a la siguiente direccion en memoria
				B		revisar_Palabra
				
fin_Palabra
				;		Revisar si el contador R3 es mayor o igual a 4
				CMP		r3, #4
				BGE		cambios_Palabra
				ADD		r1, r1, #4	; se pasa a la siguiente direccion en memoria
				MOV		r3, #0		; se resetea al contador
				B		revisar_Palabra
				
cambios_Palabra
				;		debe hacer los cambios a $
				MOV		r6, #10
				; 		eliminar comentarios ya que debe de seguir analizando palabras
				;ADD		r1, r1, #4	; se pasa a la siguiente direccion en memoria
				;MOV		r3, #0		; se resetea al contador
				;B		revisar_Palabra
				
				
				
				
				
