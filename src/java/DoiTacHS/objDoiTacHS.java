package DoiTacHS;

import java.io.Serializable;
import java.sql.Timestamp;

public class objDoiTacHS implements Serializable{

    int iddths;
    int kieu;
    Timestamp ngaygui;
    Timestamp ngaynhan;
    int iddt;
    String tendt;
    int idnvxn;
    String tennvxn;
    int tinhtrang;
    String dsfile;
    String ghichu;

    String nguoilienhe;
    String sodienthoai;

    
    
    public String getNguoilienhe() {
        return nguoilienhe;
    }

    public void setNguoilienhe(String nguoilienhe) {
        this.nguoilienhe = nguoilienhe;
    }

    public String getSodienthoai() {
        return sodienthoai;
    }

    public void setSodienthoai(String sodienthoai) {
        this.sodienthoai = sodienthoai;
    }

    
    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public int getIddths() {
        return iddths;
    }

    public void setIddths(int iddths) {
        this.iddths = iddths;
    }

    public int getKieu() {
        return kieu;
    }

    public void setKieu(int kieu) {
        this.kieu = kieu;
    }

    public Timestamp getNgaygui() {
        return ngaygui;
    }

    public void setNgaygui(Timestamp ngaygui) {
        this.ngaygui = ngaygui;
    }

    public Timestamp getNgaynhan() {
        return ngaynhan;
    }

    public void setNgaynhan(Timestamp ngaynhan) {
        this.ngaynhan = ngaynhan;
    }

    public int getIddt() {
        return iddt;
    }

    public void setIddt(int iddt) {
        this.iddt = iddt;
    }

    public String getTendt() {
        return tendt;
    }

    public void setTendt(String tendt) {
        this.tendt = tendt;
    }

    public int getIdnvxn() {
        return idnvxn;
    }

    public void setIdnvxn(int idnvxn) {
        this.idnvxn = idnvxn;
    }

    public String getTennvxn() {
        return tennvxn;
    }

    public void setTennvxn(String tennvxn) {
        this.tennvxn = tennvxn;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public String getDsfile() {
        return dsfile;
    }

    public void setDsfile(String dsfile) {
        this.dsfile = dsfile;
    }

}
