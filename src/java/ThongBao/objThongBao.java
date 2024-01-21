package ThongBao;

import java.io.Serializable;
import java.sql.Timestamp;

public class objThongBao implements Serializable {

    int idtb;
    int nhomnv;
    int idnvnhan;
    String tennvnhan;
    Timestamp ngaylap;
    String thongbao;
    int daxem;
    String loai;
    int idloai;
    int nhomtb;  //1-đã ks 2-da bg 3-da them ct 4-da in 5-khác  6-tin nhắn
    String tennhomtb;

    public int getNhomtb() {
        return nhomtb;
    }

    public void setNhomtb(int nhomtb) {
        this.nhomtb = nhomtb;
    }

    public String getTennhomtb() {
        return tennhomtb;
    }

    public void setTennhomtb(String tennhomtb) {
        this.tennhomtb = tennhomtb;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public int getIdloai() {
        return idloai;
    }

    public void setIdloai(int idloai) {
        this.idloai = idloai;
    }

    public int getIdtb() {
        return idtb;
    }

    public void setIdtb(int idtb) {
        this.idtb = idtb;
    }

    public int getNhomnv() {
        return nhomnv;
    }

    public void setNhomnv(int nhomnv) {
        this.nhomnv = nhomnv;
    }

    public int getIdnvnhan() {
        return idnvnhan;
    }

    public void setIdnvnhan(int idnvnhan) {
        this.idnvnhan = idnvnhan;
    }

    public String getTennvnhan() {
        return tennvnhan;
    }

    public void setTennvnhan(String tennvnhan) {
        this.tennvnhan = tennvnhan;
    }

    public Timestamp getNgaylap() {
        return ngaylap;
    }

    public void setNgaylap(Timestamp ngaylap) {
        this.ngaylap = ngaylap;
    }

    public String getThongbao() {
        return thongbao;
    }

    public void setThongbao(String thongbao) {
        this.thongbao = thongbao;
    }

    public int getDaxem() {
        return daxem;
    }

    public void setDaxem(int daxem) {
        this.daxem = daxem;
    }
}
