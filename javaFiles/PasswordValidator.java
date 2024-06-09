package javaFiles;
import java.util.regex.*;

public class PasswordValidator {
    public static String checkPass(String p) throws Exception {
        if (p.length() < 8) {
            return "رمز باید بیشتر از 8 حرف داشته باشد.";
        }
        if (!Pattern.compile("[@!#$]").matcher(p).find()) {
            return "رمز باید یکی از علامت های @ ، ! ، # و $ را داشته باشد.";
        }
        if (!Pattern.compile("[A-Z]").matcher(p).find()) {
            return "رمز باید یکی از حروف A-Z را داشته باشد.";
        }
        if (!Pattern.compile("[a-z]").matcher(p).find()) {
            return "رمز باید یکی از حروف a-z را داشته باشد.";
        }
        if (!Pattern.compile("[0-9]").matcher(p).find()) {
            return "رمز باید یکی از اعداد 0-9 را داشته باشد.";
        }
        return "رمز مورد تایید است!";
    }
}