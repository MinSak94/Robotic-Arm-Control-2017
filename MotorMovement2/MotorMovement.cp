#line 1 "F:/robotics/rob/MotorMovement2/MotorMovement.c"
unsigned char msg_data;

void main()

 {

 TRISB = 0;
 TRISD = 0;



 UART1_Init(9600);
 Delay_ms(100);






 PORTB = 0;
 PORTD = 0;







 UART1_Write_Text("System ready");
 UART1_Write(13);
 UART1_Write(10);



 while (1)
 {
 if (UART1_Data_Ready())
 {
 msg_data=UART1_Read();
 UART1_Write(msg_data);

 if (msg_data == '1' ) {



 PORTB.F1=1;
 PORTB.F0=0;
 Delay_ms(1000);

 PORTB = 0;
 }

 if (msg_data == '0' ) {



 PORTB.F0 = 1;
 PORTB.F1 = 0;
 Delay_ms(1000);

 PORTB = 0;
 }

 if (msg_data == '3' ) {


 PORTD.F6=0;
 PORTD.F7=1;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == '2' ) {


 PORTD.F6=1;
 PORTD.F7=0;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == '5' ) {


 PORTD.F4=0;
 PORTD.F5=1;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == '4' ) {


 PORTD.F4=1;
 PORTD.F5=0;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == '7' ) {


 PORTD.F2=0;
 PORTD.F3=1;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == '6' ) {


 PORTD.F2=1;
 PORTD.F3=0;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == '9' ) {


 PORTD.F0=0;
 PORTD.F1=1;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == '8' ) {


 PORTD.F0=1;
 PORTD.F1=0;
 Delay_ms(1000);

 PORTD=0;
 }

 if (msg_data == 'B' ) {


 PORTB.F0=0;
 PORTB.F2=0;
 Delay_ms(1000);

 PORTB=0;
 }

 if (msg_data == 'A' ) {


 PORTB.F0=0;
 PORTB.F2=1;
 Delay_ms(1000);

 PORTB=0;
 }
#line 177 "F:/robotics/rob/MotorMovement2/MotorMovement.c"
 msg_data=0;
 }
 }
 }
