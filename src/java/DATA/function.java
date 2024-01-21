package DATA;


import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONObject;

public class function {

    public static String _data_filePath = "D:\\AVLAPPDATA\\";

    private static final Pattern VALID_EMAIL_ADDRESS_REGEX
            = Pattern.compile("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$", Pattern.CASE_INSENSITIVE);
    private static final Pattern VALID_PHONE_ADDRESS_REGEX
            = Pattern.compile("(0)+(9|8|7|5|3|2)+\\d{8}\\b");
    private static final Pattern VALID_DATE_ADDRESS_REGEX
            = Pattern.compile("(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/((19|20)\\d\\d)\\b", Pattern.CASE_INSENSITIVE);
    private static final Pattern VALID_CMND_ADDRESS_REGEX
            = Pattern.compile("\\d{9,12}\\b");

    public final static String[] _fileBlock = {"exe", "bat", "ps1"};

    public static boolean Emailvalidate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

    public static boolean Phonevalidate(String emailStr) {
        Matcher matcher = VALID_PHONE_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

    public static boolean Datevalidate(String emailStr) {
        Matcher matcher = VALID_DATE_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

    public static boolean CMNDvalidate(String emailStr) {
        Matcher matcher = VALID_CMND_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

    public static java.sql.Timestamp convertStringToTimestamp(String str_date) {
        try {
            DateFormat formatter;
            formatter = new SimpleDateFormat("dd/MM/yyyy");
            // you can change format of date
            Date date = formatter.parse(str_date);
            java.sql.Timestamp timeStampDate = new java.sql.Timestamp(date.getTime());

            return timeStampDate;
        } catch (ParseException e) {
            function.Print_log("convertStringToTimestamp Exception :" + e);
            Date date = new Date();
            java.sql.Timestamp timeStampDate = new java.sql.Timestamp(date.getTime());

            return timeStampDate;
        }
    }

    public static java.sql.Timestamp cvDDMMYY_to_Timestamp(String str_date) {
        try {
            DateFormat formatter;
            formatter = new SimpleDateFormat("dd/MM/yy");
            // you can change format of date
            Date date = formatter.parse(str_date);
            java.sql.Timestamp timeStampDate = new java.sql.Timestamp(date.getTime());

            return timeStampDate;
        } catch (ParseException e) {
            function.Print_log("convertStringToTimestamp Exception :" + e);
            Date date = new Date();
            java.sql.Timestamp timeStampDate = new java.sql.Timestamp(date.getTime());

            return timeStampDate;
        }
    }

    public static int convertStringToint(String str) {
        try {
            return Integer.parseInt(str);
        } catch (Exception ex) {
            return 0;
        }
    }

    public static String xuly_hienthi_truongKS(String str) {
        if (str == null || str.isEmpty() || str.trim().isEmpty()) {
            return "";
        } else {
            String abc = str.replace('[', ' ').replace(']', ' ').trim();
            if (abc.length() > 0) {
                if (abc.substring(abc.length() - 1, abc.length()).equals(",")) {
                    return abc.substring(0, abc.length() - 1);
                } else {
                    return abc;
                }
            } else {
                return "";
            }
        }
    }

    public static boolean check_string_null(String str) {
        str = xuly_hienthi_truongKS(str);
        if (str == null || str.isEmpty() || str.trim().isEmpty()) {
            return false;
        } else {
            return true;
        }
    }

    public static double convertStringToDouble(String str) {
        try {
            return Double.parseDouble(str.replace(",", ""));
        } catch (Exception ex) {
            return 0;
        }
    }

    public static String getJsonbyKey(String key, JSONObject Json) {
        String kq = "";
        try {
            kq = Json.getString(key);
        } catch (Exception ex) {
            kq = "";
        }
        //System.out.println(key+"="+kq);
        return kq;
    }
    private static String CIPHER_NAME = "AES/CBC/PKCS5PADDING";
    private static int CIPHER_KEY_LEN = 16; //128 bits
    private static String key = "@VuNGuyEnHa2021";
    private static String iv = "vuhalo9876543210";

    public static String encrypt(String data) {
        try {
            if (key.length() < CIPHER_KEY_LEN) {
                int numPad = CIPHER_KEY_LEN - key.length();

                for (int i = 0; i < numPad; i++) {
                    key += "0"; //0 pad to len 16 bytes
                }

            } else if (key.length() > CIPHER_KEY_LEN) {
                key = key.substring(0, CIPHER_KEY_LEN); //truncate to 16 bytes
            }

            IvParameterSpec initVector = new IvParameterSpec(iv.getBytes("UTF-8"));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

            Cipher cipher = Cipher.getInstance(CIPHER_NAME);
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, initVector);

            byte[] encryptedData = cipher.doFinal((data.getBytes()));

            String base64_EncryptedData = Base64.getEncoder().encodeToString(encryptedData);
            String base64_IV = Base64.getEncoder().encodeToString(iv.getBytes("UTF-8"));

            return base64_EncryptedData + ":" + base64_IV;

        } catch (Exception ex) {
            Print_log("encrypt " + ex.getMessage());
        }

        return null;
    }

    public static String decrypt(String data) {
        try {
            String[] parts = data.split(":");
            IvParameterSpec iv = new IvParameterSpec(Base64.getDecoder().decode(parts[1]));
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
            Cipher cipher = Cipher.getInstance(CIPHER_NAME);
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
            byte[] decodedEncryptedData = Base64.getDecoder().decode(parts[0]);
            byte[] original = cipher.doFinal(decodedEncryptedData);
            return new String(original);
        } catch (Exception ex) {
            Print_log("decrypt " + ex.getMessage());
        }

        return null;
    }
    private static String _path = System.getProperty("user.dir"); //

    public static void Print_log(String msg) {
        try {
            System.out.println(msg);
            Date day = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd");
            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
            String input =sdf2.format(day) + " DT: " + msg;
            FileWriter filewriter = new FileWriter(_path + "sv_" + sdf.format(day) + ".txt", true);
            filewriter.write(System.lineSeparator());
            filewriter.write(input, 0, input.length());
            filewriter.flush();
            filewriter.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static String showUSD(float fl) {
        String kq = "";
        DecimalFormat fmVND = new DecimalFormat("'$'0.00");
        kq = fmVND.format(fl);
        return kq;
    }

    public static String showVND(float fl) {
        String kq = "";
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        kq = fmVND.format(fl);
        return kq;
    }

    public static void save_log(String userid, String note) {

    }
    
    public static String getRemapAPI(String lat, String lng) throws IOException {
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        Request request = new Request.Builder()
                .url("https://remaps.vn/api/clients/search?apiKey=PRF7pz2wj8i3rltJSqaSmz2qrvDMcpcc1gECtCvJZvRJ8HG8glzIrJv1KpN4I0ou&lat=" + lat + "&lng=" + lng)
                .method("GET", null)
                .build();
        Response response = client.newCall(request).execute();
        return response.body().string();
    }
}
