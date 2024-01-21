package HoSo;

import java.io.Serializable;

public class objHAPhapLy implements Serializable {

    int idha;
    int idts;

    String tenha;
    String mota;
    int idhs;
    String nhom;
    String loaifile;
    String path;

    String tennvup;

    public int getIdha() {
        return idha;
    }

    public void setIdha(int idha) {
        this.idha = idha;
    }

    public int getIdts() {
        return idts;
    }

    public void setIdts(int idts) {
        this.idts = idts;
    }
    public String getTenha() {
        return tenha;
    }

    public void setTenha(String tenha) {
        this.tenha = tenha;
    }

    public String getMota() {      
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public int getIdhs() {
        return idhs;
    }

    public void setIdhs(int idhs) {
        this.idhs = idhs;
    }

    public String getNhom() {
        return nhom;
    }

    public void setNhom(String nhom) {
        this.nhom = nhom;
    }

    public String getTennvup() {
        return tennvup;
    }

    public void setTennvup(String tennvup) {
        this.tennvup = tennvup;
    }

    public String getLoaifile() {
        return loaifile;
    }

    public void setLoaifile(String loaifile) {
        this.loaifile = loaifile;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getfullPath() {
        return path + tenha;
    }
}
