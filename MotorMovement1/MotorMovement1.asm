
_main:

;MotorMovement1.c,3 :: 		void main()
;MotorMovement1.c,7 :: 		TRISB = 0; //set port B as OUTPUT
	CLRF       TRISB+0
;MotorMovement1.c,8 :: 		TRISD = 0; //set port D as OUTPUT
	CLRF       TRISD+0
;MotorMovement1.c,12 :: 		UART1_Init(9600);    // Initialize UART module at 9600 bps
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MotorMovement1.c,13 :: 		Delay_ms(100);       // Wait a short delay for UART module to stabilize
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;MotorMovement1.c,20 :: 		PORTB = 0;
	CLRF       PORTB+0
;MotorMovement1.c,21 :: 		PORTD = 0;
	CLRF       PORTD+0
;MotorMovement1.c,29 :: 		UART1_Write_Text("System ready");   //Send message to PC
	MOVLW      ?lstr1_MotorMovement1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MotorMovement1.c,30 :: 		UART1_Write(13);                          //Carriage return
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MotorMovement1.c,31 :: 		UART1_Write(10);                          //Line feed
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MotorMovement1.c,35 :: 		while (1)                                       // Endless loop
L_main1:
;MotorMovement1.c,37 :: 		if (UART1_Data_Ready())            // If data is received
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;MotorMovement1.c,39 :: 		msg_data=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _msg_data+0
;MotorMovement1.c,40 :: 		UART1_Write(msg_data);      // and send data via UART back to PC
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MotorMovement1.c,42 :: 		if (msg_data == '1' ) {
	MOVF       _msg_data+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;MotorMovement1.c,46 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;MotorMovement1.c,47 :: 		PORTB.F0=0;
	BCF        PORTB+0, 0
;MotorMovement1.c,48 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;MotorMovement1.c,50 :: 		PORTB = 0;
	CLRF       PORTB+0
;MotorMovement1.c,51 :: 		}
L_main4:
;MotorMovement1.c,53 :: 		if (msg_data == '0' ) {
	MOVF       _msg_data+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;MotorMovement1.c,57 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;MotorMovement1.c,58 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;MotorMovement1.c,59 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;MotorMovement1.c,61 :: 		PORTB = 0;
	CLRF       PORTB+0
;MotorMovement1.c,62 :: 		}
L_main6:
;MotorMovement1.c,64 :: 		if (msg_data == '3' ) {
	MOVF       _msg_data+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;MotorMovement1.c,67 :: 		PORTB.F6=0;
	BCF        PORTB+0, 6
;MotorMovement1.c,68 :: 		PORTB.F7=1;
	BSF        PORTB+0, 7
;MotorMovement1.c,69 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;MotorMovement1.c,71 :: 		PORTB=0;
	CLRF       PORTB+0
;MotorMovement1.c,72 :: 		}
L_main8:
;MotorMovement1.c,74 :: 		if (msg_data == '2' ) {
	MOVF       _msg_data+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;MotorMovement1.c,77 :: 		PORTB.F6=1;
	BSF        PORTB+0, 6
;MotorMovement1.c,78 :: 		PORTB.F7=0;
	BCF        PORTB+0, 7
;MotorMovement1.c,79 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;MotorMovement1.c,81 :: 		PORTB=0;
	CLRF       PORTB+0
;MotorMovement1.c,82 :: 		}
L_main10:
;MotorMovement1.c,84 :: 		if (msg_data == '5' ) {
	MOVF       _msg_data+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;MotorMovement1.c,87 :: 		PORTD.F4=0;
	BCF        PORTD+0, 4
;MotorMovement1.c,88 :: 		PORTD.F5=1;
	BSF        PORTD+0, 5
;MotorMovement1.c,89 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;MotorMovement1.c,91 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement1.c,92 :: 		}
L_main12:
;MotorMovement1.c,94 :: 		if (msg_data == '4' ) {
	MOVF       _msg_data+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;MotorMovement1.c,97 :: 		PORTD.F4=1;
	BSF        PORTD+0, 4
;MotorMovement1.c,98 :: 		PORTD.F5=0;
	BCF        PORTD+0, 5
;MotorMovement1.c,99 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;MotorMovement1.c,101 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement1.c,102 :: 		}
L_main14:
;MotorMovement1.c,104 :: 		if (msg_data == '7' ) {
	MOVF       _msg_data+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;MotorMovement1.c,107 :: 		PORTD.F2=0;
	BCF        PORTD+0, 2
;MotorMovement1.c,108 :: 		PORTD.F3=1;
	BSF        PORTD+0, 3
;MotorMovement1.c,109 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;MotorMovement1.c,111 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement1.c,112 :: 		}
L_main16:
;MotorMovement1.c,114 :: 		if (msg_data == '6' ) {
	MOVF       _msg_data+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;MotorMovement1.c,117 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;MotorMovement1.c,118 :: 		PORTD.F3=0;
	BCF        PORTD+0, 3
;MotorMovement1.c,119 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;MotorMovement1.c,121 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement1.c,122 :: 		}
L_main18:
;MotorMovement1.c,124 :: 		if (msg_data == '9' ) {
	MOVF       _msg_data+0, 0
	XORLW      57
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;MotorMovement1.c,127 :: 		PORTD.F0=0;
	BCF        PORTD+0, 0
;MotorMovement1.c,128 :: 		PORTD.F1=1;
	BSF        PORTD+0, 1
;MotorMovement1.c,129 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;MotorMovement1.c,131 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement1.c,132 :: 		}
L_main20:
;MotorMovement1.c,134 :: 		if (msg_data == '8' ) {
	MOVF       _msg_data+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;MotorMovement1.c,137 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;MotorMovement1.c,138 :: 		PORTD.F1=0;
	BCF        PORTD+0, 1
;MotorMovement1.c,139 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;MotorMovement1.c,141 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement1.c,142 :: 		}
L_main22:
;MotorMovement1.c,157 :: 		msg_data=0;
	CLRF       _msg_data+0
;MotorMovement1.c,158 :: 		}
L_main3:
;MotorMovement1.c,159 :: 		}
	GOTO       L_main1
;MotorMovement1.c,160 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
