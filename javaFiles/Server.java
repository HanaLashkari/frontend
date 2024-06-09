package javaFiles;
import java.nio.file.Files;
import java.util.*;
import java.net.*;
import java.io.*;

class Server {
    public static void main(String[] args) throws IOException {
        System.out.println("Welcome to the server!");
        ServerSocket serverSocket = new ServerSocket(8000);
        while (true) {
            System.out.println("Waiting for client...");
            Thread t = new ClientHandlerForLogin(serverSocket.accept());
            t.start();
            System.out.println("This client finished :" + t.getName());
        }
    }
}
class ClientHandlerForLogin extends Thread {
    private Socket socket;
    private DataOutputStream dos;
    private DataInputStream dis;
    private List<String> loggedInUsers;
    private File studentsFile = new File("C:\\Users\\Asus\\Desktop\\project\\Students.txt");

    public ClientHandlerForLogin(Socket socket) throws IOException {
        this.socket = socket;
        dos = new DataOutputStream(socket.getOutputStream());
        dis = new DataInputStream(socket.getInputStream());
        System.out.println("connected to server");
    }
    private String studentChecker(String s){
        String respond = "";
        try {
            List<String> strs = Files.readAllLines(studentsFile.toPath());
            String[] NIP = s.split("-");
            for(String string : strs){
                String[] parts = string.split("-");
                for(int i=0 ; i<3 ; i++)
                    respond += parts[i].equals(NIP[i]) ? "1" : "0";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return respond;
    }
    @Override
    public void run(){
        String command = "";
        try {
            command = dis.readUTF();
            String passwordChecker = PasswordValidator.checkPass(command);
            if(passwordChecker.equals("رمز مورد تایید است!")) {
                if (studentChecker(command).equals("111") || studentChecker(command).equals("011"))
                    dos.writeUTF("ورود موفقیت آمیز بود.");
                else if (studentChecker(command).equals("010") || studentChecker(command).equals("110"))
                    dos.writeUTF("رمز اشتباه است دوباره امتحان کنید.");
                else if (studentChecker(command).equals("000") || studentChecker(command).equals("100") ||
                        studentChecker(command).equals("001") || studentChecker(command).equals("101"))
                    dos.writeUTF("اطلاعات یافت نشد، ثبت نام کنید.");
            }else dos.writeUTF(passwordChecker);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

}