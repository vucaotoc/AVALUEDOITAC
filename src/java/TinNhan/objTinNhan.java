package TinNhan;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class objTinNhan implements Serializable {

    int idmess;
    int idnvsend;
    String tennvSend;
    String avataNV;
    int idcbsend;
    String tencbSend;
    String avataCB;
    int idhs;
    String mahs;
    String mess;
    int tinhtrang;
    String time;

    public int getIdmess() {
        return idmess;
    }

    public void setIdmess(int idmess) {
        this.idmess = idmess;
    }

    public int getIdnvsend() {
        return idnvsend;
    }

    public void setIdnvsend(int idnvsend) {
        this.idnvsend = idnvsend;
    }

    public String getTennvSend() {
        return tennvSend;
    }

    public void setTennvSend(String tennvSend) {
        this.tennvSend = tennvSend;
    }

    public int getIdcbsend() {
        return idcbsend;
    }

    public void setIdcbsend(int idcbsend) {
        this.idcbsend = idcbsend;
    }

    public String getTencbSend() {
        return tencbSend;
    }

    public void setTencbSend(String tencbSend) {
        this.tencbSend = tencbSend;
    }

    public int getIdhs() {
        return idhs;
    }

    public void setIdhs(int idhs) {
        this.idhs = idhs;
    }

    public String getMahs() {
        return mahs;
    }

    public void setMahs(String mahs) {
        this.mahs = mahs;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public String getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.time = dtf.format(time);
    }

    public String getAvataNV() {
        return avataNV;
    }

    public void setAvataNV(String avataNV) {
        this.avataNV = avataNV;
    }

    public String getAvataCB() {
        return avataCB;
    }

    public String getFullPathAvataNV() {
        return "data/NhanVien/" + this.avataNV;
    }

    public void setAvataCB(String avataCB) {
        this.avataCB = avataCB;
    }

}
