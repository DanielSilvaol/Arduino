import jssc.SerialPort;
import jssc.SerialPortException;

public class test {
    public static void main(String[] args) {
        SerialPort serialPort = new SerialPort("/dev/ttyACM0");
        try {
            System.out.println ("Porta aberta:" + serialPort.openPort ());
            System.out.println ("Params setted:" + serialPort.setParams (9600, 8, 1, 0));
            System.out.println("\"Hello World!!!\" successfully writen to port: " + serialPort.writeBytes("Hello World!!!".getBytes()));
            System.out.println ("Porta fechada:" + serialPort.closePort ());
        } catch (SerialPortException e) {
            e.printStackTrace();
        }
    }
}
