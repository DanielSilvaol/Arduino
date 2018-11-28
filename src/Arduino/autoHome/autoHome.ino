//Controle da Casa
const int QuartoLED=13;
        const int CozinhaLED=7;
        const int SalaLED=8;
        double valor;
        int dado=0;

// Controle Luz
        int LedLdr = 2;
        int ldrPin=0; //LDR no pino analígico 8
        int ldrValor=0; //Valor lido do LDR


//Controle de movimento
        int ledvermelho=4;
        int pinoSensor=A4;
//Inicia o sensor em estado 0, ou seja desligado.
        int iniciaSensor=0;
//Variável para calibração do sensor
        int calibracao=45;

        void setup(){

        Serial.begin(9600);
        pinMode(QuartoLED,OUTPUT);
        pinMode(CozinhaLED,OUTPUT);
        pinMode(SalaLED,OUTPUT);

        pinMode(ledvermelho,OUTPUT);
        pinMode(pinoSensor,INPUT);
        Serial.print("Calibrando o sensor...");
        for(int i=0;i<calibracao; i++){
        Serial.print(".");
        delay(1);
        }
        Serial.println("Sensor Ativado");
        delay(500);
        }

        void loop(){
        // Serial.println(valor);
        //delay(1000);
        ldrValor=analogRead(ldrPin); //O valor lido será entre 0 e 1023
        
        if(ldrValor>=930){
        digitalWrite(LedLdr,HIGH);
        }

        else{ 
          digitalWrite(LedLdr,LOW);
        }

        Serial.println(ldrValor);
        delay(100);

        if(Serial.available()>0){
        dado=Serial.read();

        switch(dado){
        case'1':
        digitalWrite(CozinhaLED,HIGH); //liga o pino ledPin
        valor=(1);
        break;
        case'0':
        digitalWrite(CozinhaLED,LOW); //desliga o pino ledPin
        valor=(0);
        break;
        case'2':
        digitalWrite(QuartoLED,LOW);
        valor=(2);
        break;
        case'3':
        digitalWrite(QuartoLED,HIGH);
        valor=(3);
        break;
        case'4':
        digitalWrite(SalaLED,LOW);
        valor=(4);
        break;
        case'5':
        digitalWrite(SalaLED,HIGH);
        valor=(5);
        break;
        }
        }
        iniciaSensor=digitalRead(pinoSensor);
        //Serial.print("Valor do Sensor PIR: ");
        //Serial.println(iniciaSensor);
        if(iniciaSensor==1){
        alarme_on();
        }else{
        alarme_off();
        }
        }

        void alarme_on(){
        digitalWrite(ledvermelho,HIGH);

        }
        void alarme_off(){
        digitalWrite(ledvermelho,LOW);
        }
