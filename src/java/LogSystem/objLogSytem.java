package LogSystem;

import java.io.Serializable;
import java.sql.Timestamp;

public class objLogSytem implements Serializable{

    public objLogSytem(){}

    public objLogSytem(int userid, String username, String note) {
        this.userid = userid;
        this.username = username;
        this.note = note;
    }

    int idlog;

    public int getIdlog() {
        return idlog;
    }

    public void setIdlog(int idlog) {
        this.idlog = idlog;
    }

    public Timestamp getNgay() {
        return ngay;
    }

    public void setNgay(Timestamp ngay) {
        this.ngay = ngay;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    Timestamp ngay;
    int userid;
    String username;
    String note;
}
