.ORG 0X00 ; INICIA A TRABAJA DESDE LA DIRECCION DE MEMORIA 0

rjmp INICIO ; SALTA A ES DIRECCION Y COMO EL K SE LE SUMA AL CONTADOR Y SE ALMACENA EN EL AHORA TIENE ESA DIRECCION

INICIO:

ldi r16,low(RAMEND);lowasignavalor
out SPL,r16
ldi r16,high(RAMEND)
out SPH,r16

ldi r16,0xFF ; Configura todos los pines de PORTB como salidas digitales
out DDRB,r16

cbi PORTB,0 ; Establece el primer LED en apagado

ciclo:
IN R16,PINB ; Lee el estado del botón conectado a PINB0
SBIS PINB,PINB0 ; Comprueba si el botón está presionado
RJMP pinBajo ; Si está presionado, apaga todos los LEDs
SBIC PINB,PINB0 ; Comprueba si el botón está suelto
RJMP pINALTO ; Si está suelto, enciende todos los LEDs

pinBajo:
sbi PORTB,1 
sbi PORTB,2 
sbi PORTB,3 
sbi PORTB,4 
sbi PORTB,5
rjmp ciclo ; Vuelve al inicio del ciclo

pINALTO:
;rcall Retraso05
;rcall Retraso05
cbi PORTB,1 
rcall Retraso05
rcall Retraso05
cbi PORTB,2 
rcall Retraso05
rcall Retraso05
cbi PORTB,3
rcall Retraso05
rcall Retraso05
cbi PORTB,4
rcall Retraso05
rcall Retraso05
cbi PORTB,5
rcall Retraso05
rcall Retraso05
rjmp ciclo ; Vuelve al inicio del ciclo



Retraso05:
ldi R16,31
exter_Reta:
ldi R24,low(1021)
ldi R25,high(1021)
retar_ciclo:

adiw R24,1

brne retar_ciclo

dec R16

brne exter_Reta


ret ; No se utiliza en este programa