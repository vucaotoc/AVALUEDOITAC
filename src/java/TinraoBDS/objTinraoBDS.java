package TinraoBDS;

import java.io.Serializable;
import java.sql.Timestamp;

public class objTinraoBDS implements Serializable {

    int idtin;
    Timestamp ngaydang;
    Timestamp ngaydong;
    String loaihinhbds;
    String diachibds;
    String tinhtp;
    String quanhuyen;
    String phuongxa;
    String toadomap;
    double dientich;
    int giaban;
    String hinhanh;
    String mota;
    int tinhtrang;

    String sodienthoai;
    String nguoilienhe;
    int idnvdang;

    String tinhtrangshow;
    String chinhanh;

    public String getTinhtrangshow() {
        String kq = "";
        switch (this.tinhtrang) {
            case 0:
                kq = "<span class=\"badge bg-green\" >Đang mở tin</span>";
                break;
            case 1:
                kq = "<span class=\"badge bg-red\" >Đã đóng tin</span>";
                break;
            default:
                kq = "<span class=\"badge bg-back\" >Đã hủy tin</span>";
                break;
        }
        return kq;
    }

    public String getShowgiaban() {
        int so_trieu = this.giaban % 1000;
        int so_ty = (this.giaban - (this.giaban % 1000)) / 1000;
        String kq = "";
        if (so_ty > 0) {
            kq += so_ty + "tỷ";
        }
        if (so_trieu > 0) {
            kq += so_trieu + "triệu";
        }
        return kq;
    }

    public String getChinhanh() {
        return chinhanh;
    }

    public void setChinhanh(String chinhanh) {
        this.chinhanh = chinhanh;
    }

    public String getFulldiachi() {
        return this.diachibds + ", " + this.phuongxa + ", " + this.quanhuyen + ", " + this.tinhtp;
    }

    public String getSodienthoai() {
        return sodienthoai;
    }

    public void setSodienthoai(String sodienthoai) {
        this.sodienthoai = sodienthoai;
    }

    public String getNguoilienhe() {
        return nguoilienhe;
    }

    public void setNguoilienhe(String nguoilienhe) {
        this.nguoilienhe = nguoilienhe;
    }

    public int getIdnvdang() {
        return idnvdang;
    }

    public void setIdnvdang(int idnvdang) {
        this.idnvdang = idnvdang;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public int getIdtin() {
        return idtin;
    }

    public void setIdtin(int idtin) {
        this.idtin = idtin;
    }

    public Timestamp getNgaydang() {
        return ngaydang;
    }

    public void setNgaydang(Timestamp ngaydang) {
        this.ngaydang = ngaydang;
    }

    public Timestamp getNgaydong() {
        return ngaydong;
    }

    public void setNgaydong(Timestamp ngaydong) {
        this.ngaydong = ngaydong;
    }

    public String getLoaihinhbds() {
        return loaihinhbds;
    }

    public void setLoaihinhbds(String loaihinhbds) {
        this.loaihinhbds = loaihinhbds;
    }

    public String getDiachibds() {
        return diachibds;
    }

    public void setDiachibds(String diachibds) {
        this.diachibds = diachibds;
    }

    public String getTinhtp() {
        return tinhtp;
    }

    public void setTinhtp(String tinhtp) {
        this.tinhtp = tinhtp;
    }

    public String getQuanhuyen() {
        return quanhuyen;
    }

    public void setQuanhuyen(String quanhuyen) {
        this.quanhuyen = quanhuyen;
    }

    public String getPhuongxa() {
        return phuongxa;
    }

    public void setPhuongxa(String phuongxa) {
        this.phuongxa = phuongxa;
    }

    public String getToadomap() {
        return toadomap;
    }

    public void setToadomap(String toadomap) {
        this.toadomap = toadomap;
    }

    public double getDientich() {
        return dientich;
    }

    public void setDientich(double dientich) {
        this.dientich = dientich;
    }

    public int getGiaban() {
        return giaban;
    }

    public void setGiaban(int giaban) {
        this.giaban = giaban;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

}
