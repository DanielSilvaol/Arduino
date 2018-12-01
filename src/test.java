import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;

public class test {
    public static void main(String[] args) {
        SerialPort serialPort = new SerialPort("/dev/ttyACM1");
        try {
            System.out.println(""+serialPort.openPort());
            System.out.println(serialPort.setSerialPortParams(9600,0,0,0);
            serialPort.closePort();
        } catch (UnsupportedCommOperationException e) {
            e.printStackTrace();
        }
    }
}
