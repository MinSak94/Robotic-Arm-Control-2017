
_main:

;MotorMovement.c,3 :: 		void main()
;MotorMovement.c,7 :: 		TRISB = 0; //set port B as OUTPUT
	CLRF       TRISB+0
;MotorMovement.c,8 :: 		TRISD = 0; //set port D as OUTPUT
	CLRF       TRISD+0
;MotorMovement.c,12 :: 		UART1_Init(9600);    // Initialize UART module at 9600 bps
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MotorMovement.c,13 :: 		Delay_ms(100);       // Wait a short delay for UART module to stabilize
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
;MotorMovement.c,20 :: 		PORTB = 0;
	CLRF       PORTB+0
;MotorMovement.c,21 :: 		PORTD = 0;
	CLRF       PORTD+0
;MotorMovement.c,29 :: 		UART1_Write_Text("System ready");   //Send message to PC
	MOVLW      ?lstr1_MotorMovement+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MotorMovement.c,30 :: 		UART1_Write(13);                          //Carriage return
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MotorMovement.c,31 :: 		UART1_Write(10);                          //Line feed
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MotorMovement.c,35 :: 		while (1)                                       // Endless loop
L_main1:
;MotorMovement.c,37 :: 		if (UART1_Data_Ready())            // If data is received
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;MotorMovement.c,39 :: 		msg_data=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _msg_data+0
;MotorMovement.c,40 :: 		UART1_Write(msg_data);      // and send data via UART back to PC
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MotorMovement.c,42 :: 		if (msg_data == '1' ) {
	MOVF       _msg_data+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;MotorMovement.c,46 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;MotorMovement.c,47 :: 		PORTB.F0=0;
	BCF        PORTB+0, 0
;MotorMovement.c,48 :: 		Delay_ms(1000);
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
;MotorMovement.c,50 :: 		PORTB = 0;
	CLRF       PORTB+0
;MotorMovement.c,51 :: 		}
L_main4:
;MotorMovement.c,53 :: 		if (msg_data == '0' ) {
	MOVF       _msg_data+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;MotorMovement.c,57 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;MotorMovement.c,58 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;MotorMovement.c,59 :: 		Delay_ms(1000);
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
;MotorMovement.c,61 :: 		PORTB = 0;
	CLRF       PORTB+0
;MotorMovement.c,62 :: 		}
L_main6:
;MotorMovement.c,64 :: 		if (msg_data == '3' ) {
	MOVF       _msg_data+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;MotorMovement.c,67 :: 		PORTD.F6=0;
	BCF        PORTD+0, 6
;MotorMovement.c,68 :: 		PORTD.F7=1;
	BSF        PORTD+0, 7
;MotorMovement.c,69 :: 		Delay_ms(1000);
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
;MotorMovement.c,71 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,72 :: 		}
L_main8:
;MotorMovement.c,74 :: 		if (msg_data == '2' ) {
	MOVF       _msg_data+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;MotorMovement.c,77 :: 		PORTD.F6=1;
	BSF        PORTD+0, 6
;MotorMovement.c,78 :: 		PORTD.F7=0;
	BCF        PORTD+0, 7
;MotorMovement.c,79 :: 		Delay_ms(1000);
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
;MotorMovement.c,81 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,82 :: 		}
L_main10:
;MotorMovement.c,84 :: 		if (msg_data == '5' ) {
	MOVF       _msg_data+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;MotorMovement.c,87 :: 		PORTD.F4=0;
	BCF        PORTD+0, 4
;MotorMovement.c,88 :: 		PORTD.F5=1;
	BSF        PORTD+0, 5
;MotorMovement.c,89 :: 		Delay_ms(1000);
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
;MotorMovement.c,91 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,92 :: 		}
L_main12:
;MotorMovement.c,94 :: 		if (msg_data == '4' ) {
	MOVF       _msg_data+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;MotorMovement.c,97 :: 		PORTD.F4=1;
	BSF        PORTD+0, 4
;MotorMovement.c,98 :: 		PORTD.F5=0;
	BCF        PORTD+0, 5
;MotorMovement.c,99 :: 		Delay_ms(1000);
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
;MotorMovement.c,101 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,102 :: 		}
L_main14:
;MotorMovement.c,104 :: 		if (msg_data == '7' ) {
	MOVF       _msg_data+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;MotorMovement.c,107 :: 		PORTD.F2=0;
	BCF        PORTD+0, 2
;MotorMovement.c,108 :: 		PORTD.F3=1;
	BSF        PORTD+0, 3
;MotorMovement.c,109 :: 		Delay_ms(1000);
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
;MotorMovement.c,111 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,112 :: 		}
L_main16:
;MotorMovement.c,114 :: 		if (msg_data == '6' ) {
	MOVF       _msg_data+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;MotorMovement.c,117 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;MotorMovement.c,118 :: 		PORTD.F3=0;
	BCF        PORTD+0, 3
;MotorMovement.c,119 :: 		Delay_ms(1000);
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
;MotorMovement.c,121 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,122 :: 		}
L_main18:
;MotorMovement.c,124 :: 		if (msg_data == '9' ) {
	MOVF       _msg_data+0, 0
	XORLW      57
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;MotorMovement.c,127 :: 		PORTD.F0=0;
	BCF        PORTD+0, 0
;MotorMovement.c,128 :: 		PORTD.F1=1;
	BSF        PORTD+0, 1
;MotorMovement.c,129 :: 		Delay_ms(1000);
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
;MotorMovement.c,131 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,132 :: 		}
L_main20:
;MotorMovement.c,134 :: 		if (msg_data == '8' ) {
	MOVF       _msg_data+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;MotorMovement.c,137 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;MotorMovement.c,138 :: 		PORTD.F1=0;
	BCF        PORTD+0, 1
;MotorMovement.c,139 :: 		Delay_ms(1000);
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
;MotorMovement.c,141 :: 		PORTD=0;
	CLRF       PORTD+0
;MotorMovement.c,142 :: 		}
L_main22:
;MotorMovement.c,144 :: 		if (msg_data == 'B' ) {
	MOVF       _msg_data+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_main24
;MotorMovement.c,147 :: 		PORTB.F0=0;
	BCF        PORTB+0, 0
;MotorMovement.c,148 :: 		PORTB.F2=0;
	BCF        PORTB+0, 2
;MotorMovement.c,149 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;MotorMovement.c,151 :: 		PORTB=0;
	CLRF       PORTB+0
;MotorMovement.c,152 :: 		}
L_main24:
;MotorMovement.c,154 :: 		if (msg_data == 'A' ) {
	MOVF       _msg_data+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;MotorMovement.c,157 :: 		PORTB.F0=0;
	BCF        PORTB+0, 0
;MotorMovement.c,158 :: 		PORTB.F2=1;
	BSF        PORTB+0, 2
;MotorMovement.c,159 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;MotorMovement.c,161 :: 		PORTB=0;
	CLRF       PORTB+0
;MotorMovement.c,162 :: 		}
L_main26:
;MotorMovement.c,177 :: 		msg_data=0;
	CLRF       _msg_data+0
;MotorMovement.c,178 :: 		}
L_main3:
;MotorMovement.c,179 :: 		}
	GOTO       L_main1
;MotorMovement.c,180 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
