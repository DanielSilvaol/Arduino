package DAO;

import Arduino.SerialInterface;
import Arduino.SerialReadAction;

import javax.servlet.http.HttpServletRequest;

public class ArduinoDAO {


    public static SerialInterface getSerialInterface(HttpServletRequest request) {
        //colocando o controlador de comunicacao serial no contexto da aplicação
        Object sc = request.getServletContext().getAttribute("serialComm");
        if (sc == null) {
            SerialInterface si = new SerialInterface ("/dev/ttyACM1",9600);
            si.read(new SerialReadAction() {

                public void read(byte b) {
                    System.out.print((char)b);

                }
            });
            request.getServletContext().setAttribute("serialComm", si);
            return si;
        }
        return (SerialInterface) sc;
    }
}
