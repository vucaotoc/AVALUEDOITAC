package NhanVien;

import java.io.File;
import java.io.Serializable;

public class objNhanVien implements Serializable {

    int idnv;
    String manv;
    String tennv;
    String tendn;
    String matkhau;
    String email;
    String sodt;
    String avata;
    int tinhtrang;
    int quyen;
    String tenquyen;

    String dbname;
    String chinhanh;
    
    String profile_embed;
    
    public String getTenquyen() {
        switch (this.quyen) {
            case 1:
                this.tenquyen = "admin";
                break;
            case 2:
                this.tenquyen = "manager";
                break;
            case 3:
                this.tenquyen = "user";
            case 4:
                this.tenquyen = "support";
                break;
            case 5:
                this.tenquyen = "deliver";
                break;
        }
        return this.tenquyen;
    }

    public void setTenquyen(String tenquyen) {
        this.tenquyen = tenquyen;
    }

    public String getAvata() {
        return avata;
    }

    public String getFullPathAvata() {
        return "data/NhanVien/" + this.avata;
    }

    public void setAvata(String avata) {
        this.avata = avata;
    }

    public String getSodt() {
        return sodt;
    }

    public void setSodt(String sodt) {
        this.sodt = sodt;
    }

    public int getQuyen() {
        return quyen;
    }

    public void setQuyen(int quyen) {
        this.quyen = quyen;
    }

    public int getIdnv() {
        return idnv;
    }

    public void setIdnv(int idnv) {
        this.idnv = idnv;
    }

    public String getManv() {
        return manv;
    }

    public void setManv(String manv) {
        this.manv = manv;
    }

    public String getTennv() {
        return tennv;
    }

    public void setTennv(String tennv) {
        this.tennv = tennv;
    }

    public String getTendn() {
        return tendn;
    }

    public void setTendn(String tendn) {
        this.tendn = tendn;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }

    public String getChinhanh() {
        return chinhanh;
    }

    public void setChinhanh(String chinhanh) {
        this.chinhanh = chinhanh;
    }

    public String getProfile_embed() {
        return profile_embed;
    }

    public void setProfile_embed(String profile_embed) {
        this.profile_embed = profile_embed;
    }

}
