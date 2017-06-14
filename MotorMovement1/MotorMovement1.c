unsigned char msg_data;
  // short duty1 = 16; //initial value for duty
void main()

 {
   //TRISC2_bit = 0; //set protc-pin 2 as OUTPUT for PWM1
   TRISB = 0; //set port B as OUTPUT
   TRISD = 0; //set port D as OUTPUT
   //ADCON0=1;
   //ANSELC = 0;           // Configure PORTC pins as digital

   UART1_Init(9600);    // Initialize UART module at 9600 bps
   Delay_ms(100);       // Wait a short delay for UART module to stabilize
      //PWM1_Init(3000); //initialise PWM1 at 3KHz
      //PWM1_Start();
      //PWM1_Set_Duty(127); //set PWM duty circle

   //PORTB = 0x00; //reset ports B and D
   //PORTD = 0x00;
   PORTB = 0;
   PORTD = 0;


    //PWM1_Init(1000); //Initialize PWM1
//PWM1_Start(); //start PWM1
//PWM1_Set_Duty(duty1); //Set current duty for PWM1


   UART1_Write_Text("System ready");   //Send message to PC
   UART1_Write(13);                          //Carriage return
   UART1_Write(10);                          //Line feed



  while (1)                                       // Endless loop
    {
       if (UART1_Data_Ready())            // If data is received
          {
            msg_data=UART1_Read();
            UART1_Write(msg_data);      // and send data via UART back to PC

            if (msg_data == '1' ) {


                    //start LEFT movement to M4
                     PORTB.F1=1;
                     PORTB.F0=0;
                     Delay_ms(1000);

                     PORTB = 0;
            }

            if (msg_data == '0' ) {


                     //start RIGHT movement to M4
                     PORTB.F0 = 1;
                     PORTB.F1 = 0;
                     Delay_ms(1000);

                     PORTB = 0;
            }

            if (msg_data == '3' ) {

                   //start DOWN movement to M3
                    PORTB.F6=0;
                    PORTB.F7=1;
                    Delay_ms(1000);

                    PORTB=0;
            }

            if (msg_data == '2' ) {

                 //start UP movement to M3
                   PORTB.F6=1;
                   PORTB.F7=0;
                   Delay_ms(1000);

                  PORTB=0;
            }

            if (msg_data == '5' ) {

                  // start DOWN movement to M2
                   PORTD.F4=0;
                   PORTD.F5=1;
                   Delay_ms(1000);

                   PORTD=0;
            }

            if (msg_data == '4' ) {

                  //start UP movement to M2
                   PORTD.F4=1;
                   PORTD.F5=0;
                   Delay_ms(1000);

                   PORTD=0;
            }

            if (msg_data == '7' ) {

                //start DOWN movement to M1
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

                   //start CLOSING M0
                   PORTD.F0=0;
                   PORTD.F1=1;
                   Delay_ms(1000);

                   PORTD=0;
            }

            if (msg_data == '8' ) {

                   //start OPENING M0
                   PORTD.F0=1;
                   PORTD.F1=0;
                   Delay_ms(1000);

                   PORTD=0;
            }
            /*if (msg_data == 'A' ) {

                   Delay_ms(1);
                   duty1++; // increment duty cycle
                   PWM1_Set_Duty(duty1); //Change the duty cycle

            }
             if (msg_data == 'B' ) {
                            Delay_ms(1);
                            duty1--; // decrement duty cycle
                            PWM1_Set_Duty(duty1);


            }   */
             msg_data=0;
          }
     }
  }