package HoSo;

import DATA.danhsachBIEN;
import java.io.Serializable;
import java.sql.Timestamp;

public class objHoSo implements Serializable {

    int idhs;
    String soct;
    String mahs;
    String loaihd;
    double giatrihd;
    String giatrihdbangchu;
    String thue;
    int idkh;
    String doitac;
    String cbthuchien;
    String cbcrc;
    String doitaccrc;

    Timestamp ngaylaphs;
    Timestamp ngaysobo;
    Timestamp ngaykhaosat;
    Timestamp ngaybaogia;
    int idnvtao;
    String tennvtao;

    int idnvsb;
    String tennvsb;

    int idnvks;
    String tennvks;

    int idnvgia;
    String tennvgia;

    int idctv;
    String tenctv;

    int tinhtrang;
    String giasobo;
    double giatd;
    String nvthuchien;

    int in_dain;
    int in_idnv;
    String in_tennv;
    Timestamp in_thoigian;
    String in_note;

    int giao_dagiao;
    int giao_idnv;
    String giao_tennv;
    Timestamp giao_thoigiankh;
    Timestamp giao_thoigiannh;
    String giao_chukykh;
    String giao_chukynh;
    String giao_tenkh;
    String giao_tennh;
    String giao_noteKH;
    String giao_noteNH;

    String nguoilienheks;
    String nguoilienhesdt;
    String trangthaihs;

    String hscode;

    int sohats;
    int isclose;

    String diachi;
    String phuongxa;
    String quanhuyen;
    String tinhtp;
    String fulldiachi;

    String fullcanbo;
    int tamung;
    int giao_loai;   //1-cã NH KH  2- NH 3- KH

    double tongdientich;
    String hinhanh;
    String ngayphathanh;
    String chinhanh;

    String hinhdanglodat;
    String duongtruocnha;

    String hd_ngaynhan;
    String hd_ngaygiao;
    String hd_ngaythu;
    String hd_ghichu;
    String hd_vat;

    String hinhbaogia;

    int duyetgia;
    double giaduyet;
    String duyetgia_ghichu;

    String toadomaps;
    int ctnhap;
    int thuphi;
    String tsghichu;

    public objHoSo() {
    }

    public objHoSo(int idhs, String soct, String mahs, String loaihd, double giatrihd, String giatrihdbangchu, String thue, int idkh, String doitac, String cbthuchien, String cbcrc, String doitaccrc, Timestamp ngaylaphs, Timestamp ngaysobo, Timestamp ngaykhaosat, Timestamp ngaybaogia, int idnvtao, String tennvtao, int idnvks, String tennvks, int idnvgia, String tennvgia, int tinhtrang, String giasobo, double giatd, String nvthuchien, int in_dain, int in_idnv, String in_tennv, Timestamp in_thoigian, String in_note, int giao_dagiao, int giao_idnv, String giao_tennv, Timestamp giao_thoigiankh, Timestamp giao_thoigiannh, String giao_chukykh, String giao_chukynh, String giao_tenkh, String giao_tennh, String giao_noteKH, String giao_noteNH, String nguoilienheks, String nguoilienhesdt, String trangthaihs, String hscode, int sohats, int isclose, String diachi, String phuongxa, String quanhuyen, String tinhtp, String fulldiachi, String fullcanbo, int tamung, int giao_loai, double tongdientich, String hinhanh, String ngayphathanh, String chinhanh, String hinhdanglodat, String duongtruocnha, String hd_ngaynhan, String hd_ngaygiao, String hd_ngaythu, String hd_ghichu, String hd_vat) {
        this.idhs = idhs;
        this.soct = soct;
        this.mahs = mahs;
        this.loaihd = loaihd;
        this.giatrihd = giatrihd;
        this.giatrihdbangchu = giatrihdbangchu;
        this.thue = thue;
        this.idkh = idkh;
        this.doitac = doitac;
        this.cbthuchien = cbthuchien;
        this.cbcrc = cbcrc;
        this.doitaccrc = doitaccrc;
        this.ngaylaphs = ngaylaphs;
        this.ngaysobo = ngaysobo;
        this.ngaykhaosat = ngaykhaosat;
        this.ngaybaogia = ngaybaogia;
        this.idnvtao = idnvtao;
        this.tennvtao = tennvtao;
        this.idnvks = idnvks;
        this.tennvks = tennvks;
        this.idnvgia = idnvgia;
        this.tennvgia = tennvgia;
        this.tinhtrang = tinhtrang;
        this.giasobo = giasobo;
        this.giatd = giatd;
        this.nvthuchien = nvthuchien;
        this.in_dain = in_dain;
        this.in_idnv = in_idnv;
        this.in_tennv = in_tennv;
        this.in_thoigian = in_thoigian;
        this.in_note = in_note;
        this.giao_dagiao = giao_dagiao;
        this.giao_idnv = giao_idnv;
        this.giao_tennv = giao_tennv;
        this.giao_thoigiankh = giao_thoigiankh;
        this.giao_thoigiannh = giao_thoigiannh;
        this.giao_chukykh = giao_chukykh;
        this.giao_chukynh = giao_chukynh;
        this.giao_tenkh = giao_tenkh;
        this.giao_tennh = giao_tennh;
        this.giao_noteKH = giao_noteKH;
        this.giao_noteNH = giao_noteNH;
        this.nguoilienheks = nguoilienheks;
        this.nguoilienhesdt = nguoilienhesdt;
        this.trangthaihs = trangthaihs;
        this.hscode = hscode;
        this.sohats = sohats;
        this.isclose = isclose;
        this.diachi = diachi;
        this.phuongxa = phuongxa;
        this.quanhuyen = quanhuyen;
        this.tinhtp = tinhtp;
        this.fulldiachi = fulldiachi;
        this.fullcanbo = fullcanbo;
        this.tamung = tamung;
        this.giao_loai = giao_loai;
        this.tongdientich = tongdientich;
        this.hinhanh = hinhanh;
        this.ngayphathanh = ngayphathanh;
        this.chinhanh = chinhanh;
        this.hinhdanglodat = hinhdanglodat;
        this.duongtruocnha = duongtruocnha;
        this.hd_ngaynhan = hd_ngaynhan;
        this.hd_ngaygiao = hd_ngaygiao;
        this.hd_ngaythu = hd_ngaythu;
        this.hd_ghichu = hd_ghichu;
        this.hd_vat = hd_vat;
    }

    public int getIdctv() {
        return idctv;
    }

    public void setIdctv(int idcttv) {
        this.idctv = idcttv;
    }

    public String getTenctv() {
        return tenctv;
    }

    public void setTenctv(String tenctv) {
        this.tenctv = tenctv;
    }

    public String getToadomaps() {
        return toadomaps;
    }

    public void setToadomaps(String toadomaps) {
        this.toadomaps = toadomaps;
    }

    public double getGiaduyet() {
        return giaduyet;
    }

    public void setGiaduyet(double giaduyet) {
        this.giaduyet = giaduyet;
    }

    public int getDuyetgia() {
        return duyetgia;
    }

    public void setDuyetgia(int duyetgia) {
        this.duyetgia = duyetgia;
    }

    public String getDuyetgia_ghichu() {
        return duyetgia_ghichu;
    }

    public void setDuyetgia_ghichu(String duyetgia_ghichu) {
        this.duyetgia_ghichu = duyetgia_ghichu;
    }

    public String getHinhbaogia() {
        return hinhbaogia;
    }

    public void setHinhbaogia(String hinhbaogia) {
        this.hinhbaogia = hinhbaogia;
    }

    public String getDoitaccrc() {
        return doitaccrc;
    }

    public void setDoitaccrc(String doitaccrc) {
        this.doitaccrc = doitaccrc;
    }

    public String getCbcrc() {
        return cbcrc;
    }

    public void setCbcrc(String cbcrc) {
        this.cbcrc = cbcrc;
    }

    public String getHd_ngaynhan() {
        return hd_ngaynhan;
    }

    public void setHd_ngaynhan(String hd_ngaynhan) {
        this.hd_ngaynhan = hd_ngaynhan;
    }

    public String getHd_ngaygiao() {
        return hd_ngaygiao;
    }

    public void setHd_ngaygiao(String hd_ngaygiao) {
        this.hd_ngaygiao = hd_ngaygiao;
    }

    public String getHd_ngaythu() {
        return hd_ngaythu;
    }

    public void setHd_ngaythu(String hd_ngaythu) {
        this.hd_ngaythu = hd_ngaythu;
    }

    public String getHd_ghichu() {
        return hd_ghichu;
    }

    public void setHd_ghichu(String hd_ghichu) {
        this.hd_ghichu = hd_ghichu;
    }

    public String getHd_vat() {
        return hd_vat;
    }

    public void setHd_vat(String hd_vat) {
        this.hd_vat = hd_vat;
    }

    public String getHinhdanglodat() {
        return hinhdanglodat;
    }

    public void setHinhdanglodat(String hinhdanglodat) {
        this.hinhdanglodat = hinhdanglodat;
    }

    public String getDuongtruocnha() {
        return duongtruocnha;
    }

    public void setDuongtruocnha(String duongtruocnha) {
        this.duongtruocnha = duongtruocnha;
    }

    public String getFulldiachi() {
        return fulldiachi;
    }

    public void setFulldiachi(String fulldiachi) {
        this.fulldiachi = fulldiachi;
    }

    public String getChinhanh() {
        return chinhanh;
    }

    public void setChinhanh(String chinhanh) {
        this.chinhanh = chinhanh;
    }

    public String getNgayphathanh() {
        return ngayphathanh;
    }

    public void setNgayphathanh(String ngayphathanh) {
        this.ngayphathanh = ngayphathanh;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public double getTongdientich() {
        return tongdientich;
    }

    public void setTongdientich(double tongdientich) {
        this.tongdientich = tongdientich;
    }

    public int getGiao_loai() {
        return giao_loai;
    }

    public void setGiao_loai(int giao_loai) {
        this.giao_loai = giao_loai;
    }

    public int getTamung() {
        return tamung;
    }

    public void setTamung(int tamung) {
        this.tamung = tamung;
    }

    public String getFullcanbo() {
        return fullcanbo;
    }

    public void setFullcanbo(String fullcanbo) {
        this.fullcanbo = fullcanbo;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getPhuongxa() {
        return phuongxa;
    }

    public void setPhuongxa(String phuongxa) {
        this.phuongxa = phuongxa;
    }

    public String getQuanhuyen() {
        return quanhuyen;
    }

    public void setQuanhuyen(String quanhuyen) {
        this.quanhuyen = quanhuyen;
    }

    public String getTinhtp() {
        return tinhtp;
    }

    public void setTinhtp(String tinhtp) {
        this.tinhtp = tinhtp;
    }

    public String getGiao_noteKH() {
        return giao_noteKH;
    }

    public void setGiao_noteKH(String giao_noteKH) {
        this.giao_noteKH = giao_noteKH;
    }

    public String getGiao_noteNH() {
        return giao_noteNH;
    }

    public void setGiao_noteNH(String giao_noteNH) {
        this.giao_noteNH = giao_noteNH;
    }

    public int getIsclose() {
        return isclose;
    }

    public void setIsclose(int isclose) {
        this.isclose = isclose;
    }

    public int getSohats() {
        return sohats;
    }

    public void setSohats(int sohats) {
        this.sohats = sohats;
    }

    public String getIn_note() {
        return in_note;
    }

    public void setIn_note(String in_note) {
        this.in_note = in_note;
    }

    public String getNvthuchien() {
        return nvthuchien;
    }

    public void setNvthuchien(String nvthuchien) {
        this.nvthuchien = nvthuchien;
    }

    public String getGiasobo() {
        return giasobo;
    }

    public void setGiasobo(String giasobo) {
        this.giasobo = giasobo;
    }

    public double getGiatd() {
        return giatd;
    }

    public void setGiatd(double giatd) {
        this.giatd = giatd;
    }

    public String getNguoilienheks() {
        return nguoilienheks;
    }

    public void setNguoilienheks(String nguoilienheks) {
        this.nguoilienheks = nguoilienheks;
    }

    public String getNguoilienhesdt() {
        return nguoilienhesdt;
    }

    public void setNguoilienhesdt(String nguoilienhesdt) {
        this.nguoilienhesdt = nguoilienhesdt;
    }

    public int getIdhs() {
        return idhs;
    }

    public void setIdhs(int idhs) {
        this.idhs = idhs;
    }

    public String getSoct() {
        return soct;
    }

    public void setSoct(String soct) {
        this.soct = soct;
    }

    public String getMahs() {
        return mahs;
    }

    public void setMahs(String mahs) {
        this.mahs = mahs;
    }

    public String getLoaihd() {
        return loaihd;
    }

    public void setLoaihd(String loaihd) {
        this.loaihd = loaihd;
    }

    public double getGiatrihd() {
        return giatrihd;
    }

    public void setGiatrihd(double giatrihd) {
        this.giatrihd = giatrihd;
    }

    public String getGiatrihdbangchu() {
        return giatrihdbangchu;
    }

    public void setGiatrihdbangchu(String giatrihdbangchu) {
        this.giatrihdbangchu = giatrihdbangchu;
    }

    public String getThue() {
        return thue;
    }

    public void setThue(String thue) {
        this.thue = thue;
    }

    public int getIdkh() {
        return idkh;
    }

    public void setIdkh(int idkh) {
        this.idkh = idkh;
    }

    public String getDoitac() {
        return doitac;
    }

    public void setDoitac(String doitac) {
        this.doitac = doitac;
    }

    public String getCbthuchien() {
        return cbthuchien;
    }

    public void setCbthuchien(String cbthuchien) {
        this.cbthuchien = cbthuchien;
    }

    public Timestamp getNgaylaphs() {
        return ngaylaphs;
    }

    public void setNgaylaphs(Timestamp ngaylaphs) {
        this.ngaylaphs = ngaylaphs;
    }

    public Timestamp getNgaysobo() {
        return ngaysobo;
    }

    public void setNgaysobo(Timestamp ngaysobo) {
        this.ngaysobo = ngaysobo;
    }

    public Timestamp getNgaykhaosat() {
        return ngaykhaosat;
    }

    public void setNgaykhaosat(Timestamp ngaykhaosat) {
        this.ngaykhaosat = ngaykhaosat;
    }

    public int getIdnvtao() {
        return idnvtao;
    }

    public void setIdnvtao(int idnvtao) {
        this.idnvtao = idnvtao;
    }

    public String getTennvtao() {
        return tennvtao;
    }

    public Timestamp getNgaybaogia() {
        return ngaybaogia;
    }

    public void setNgaybaogia(Timestamp ngaybaogia) {
        this.ngaybaogia = ngaybaogia;
    }

    public void setTennvtao(String tennvtao) {
        this.tennvtao = tennvtao;
    }

    public int getIdnvks() {
        return idnvks;
    }

    public void setIdnvks(int idnvks) {
        this.idnvks = idnvks;
    }

    public String getTennvks() {
        return tennvks;
    }

    public void setTennvks(String tennvks) {
        this.tennvks = tennvks;
    }

    public int getIdnvgia() {
        return idnvgia;
    }

    public void setIdnvgia(int idnvgia) {
        this.idnvgia = idnvgia;
    }

    public String getTennvgia() {
        return tennvgia;
    }

    public void setTennvgia(String tennvgia) {
        this.tennvgia = tennvgia;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public String getTrangthaihs() {
        return this.trangthaihs;
    }

    public void setTrangthaihs(String trangthaihs) {
        this.trangthaihs = trangthaihs;
    }

    public int getIn_idnv() {
        return in_idnv;
    }

    public void setIn_idnv(int in_idnv) {
        this.in_idnv = in_idnv;
    }

    public String getIn_tennv() {
        return in_tennv;
    }

    public String getHscode() {
        return hscode;
    }

    public void setHscode(String hscode) {
        this.hscode = hscode;
    }

    public void setIn_tennv(String in_tennv) {
        this.in_tennv = in_tennv;
    }

    public Timestamp getIn_thoigian() {
        return in_thoigian;
    }

    public void setIn_thoigian(Timestamp in_thoigian) {
        this.in_thoigian = in_thoigian;
    }

    public int getGiao_idnv() {
        return giao_idnv;
    }

    public void setGiao_idnv(int giao_idnv) {
        this.giao_idnv = giao_idnv;
    }

    public String getGiao_tennv() {
        return giao_tennv;
    }

    public void setGiao_tennv(String giao_tennv) {
        this.giao_tennv = giao_tennv;
    }

    public Timestamp getGiao_thoigiankh() {
        return giao_thoigiankh;
    }

    public void setGiao_thoigiankh(Timestamp giao_thoigiankh) {
        this.giao_thoigiankh = giao_thoigiankh;
    }

    public Timestamp getGiao_thoigiannh() {
        return giao_thoigiannh;
    }

    public void setGiao_thoigiannh(Timestamp giao_thoigiannh) {
        this.giao_thoigiannh = giao_thoigiannh;
    }

    public String getGiao_chukykh() {
        return giao_chukykh;
    }

    public void setGiao_chukykh(String giao_chukykh) {
        this.giao_chukykh = giao_chukykh;
    }

    public String getGiao_chukynh() {
        return giao_chukynh;
    }

    public void setGiao_chukynh(String giao_chukynh) {
        this.giao_chukynh = giao_chukynh;
    }

    public String getGiao_tenkh() {
        return giao_tenkh;
    }

    public void setGiao_tenkh(String giao_tenkh) {
        this.giao_tenkh = giao_tenkh;
    }

    public String getGiao_tennh() {
        return giao_tennh;
    }

    public void setGiao_tennh(String giao_tennh) {
        this.giao_tennh = giao_tennh;
    }

    public int getIn_dain() {
        return in_dain;
    }

    public void setIn_dain(int in_dain) {
        this.in_dain = in_dain;
    }

    public int getGiao_dagiao() {
        return giao_dagiao;
    }

    public void setGiao_dagiao(int giao_dagiao) {
        this.giao_dagiao = giao_dagiao;
    }

    public int getIdnvsb() {
        return idnvsb;
    }

    public void setIdnvsb(int idnvsb) {
        this.idnvsb = idnvsb;
    }

    public String getTennvsb() {
        return tennvsb;
    }

    public void setTennvsb(String tennvsb) {
        this.tennvsb = tennvsb;
    }

    public int getCtnhap() {
        return ctnhap;
    }

    public void setCtnhap(int ctnhap) {
        this.ctnhap = ctnhap;
    }

    public int getThuphi() {
        return thuphi;
    }

    public void setThuphi(int thuphi) {
        this.thuphi = thuphi;
    }

    public String getTsghichu() {
        return tsghichu;
    }

    public void setTsghichu(String tsghichu) {
        this.tsghichu = tsghichu;
    }

    public static String laynvthuchien1(int tt, objHoSo obj) {
        String str = "";
        switch (tt) {
            case 0:
                str = obj.getTennvtao();
                break;
            case 1:
                str = obj.getTennvsb();
                break;
            case 2:
            case 3:
                str = obj.getTennvks();
                break;
            case 4:
            case 5:
            case 7:
            case 9:
            case 10:
                str = obj.getTennvgia();
                break;
            default:
                str = "";
                break;
        }
        return str;
    }
    public static int laynv_telegram(objHoSo obj) 
    {
        int str = 0;
        switch (obj.getTinhtrang()) {
            case 0:
                str = obj.getIdnvtao();
                break;
            case 1:
                str = obj.getIdnvsb();
                break;
            case 2:
            case 3:
                str = obj.getIdnvks();
                break;
            case 4:
            case 5:
            case 7:
            case 9:
            case 10:
                str = obj.getIdnvgia();
                break;
            default:
                str =0;
                break;
        }
        return str;
    }

    @Override
    public String toString() {
        return "objHoSo{" + "idhs=" + idhs + ", soct=" + soct + ", mahs=" + mahs + ", loaihd=" + loaihd + ", giatrihd=" + giatrihd + ", giatrihdbangchu=" + giatrihdbangchu + ", thue=" + thue + ", idkh=" + idkh + ", doitac=" + doitac + ", cbthuchien=" + cbthuchien + ", cbcrc=" + cbcrc + ", doitaccrc=" + doitaccrc + ", ngaylaphs=" + ngaylaphs + ", ngaysobo=" + ngaysobo + ", ngaykhaosat=" + ngaykhaosat + ", ngaybaogia=" + ngaybaogia + ", idnvtao=" + idnvtao + ", tennvtao=" + tennvtao + ", idnvks=" + idnvks + ", tennvks=" + tennvks + ", idnvgia=" + idnvgia + ", tennvgia=" + tennvgia + ", tinhtrang=" + tinhtrang + ", giasobo=" + giasobo + ", giatd=" + giatd + ", nvthuchien=" + nvthuchien + ", in_dain=" + in_dain + ", in_idnv=" + in_idnv + ", in_tennv=" + in_tennv + ", in_thoigian=" + in_thoigian + ", in_note=" + in_note + ", giao_dagiao=" + giao_dagiao + ", giao_idnv=" + giao_idnv + ", giao_tennv=" + giao_tennv + ", giao_thoigiankh=" + giao_thoigiankh + ", giao_thoigiannh=" + giao_thoigiannh + ", giao_chukykh=" + giao_chukykh + ", giao_chukynh=" + giao_chukynh + ", giao_tenkh=" + giao_tenkh + ", giao_tennh=" + giao_tennh + ", giao_noteKH=" + giao_noteKH + ", giao_noteNH=" + giao_noteNH + ", nguoilienheks=" + nguoilienheks + ", nguoilienhesdt=" + nguoilienhesdt + ", trangthaihs=" + trangthaihs + ", hscode=" + hscode + ", sohats=" + sohats + ", isclose=" + isclose + ", diachi=" + diachi + ", phuongxa=" + phuongxa + ", quanhuyen=" + quanhuyen + ", tinhtp=" + tinhtp + ", fulldiachi=" + fulldiachi + ", fullcanbo=" + fullcanbo + ", tamung=" + tamung + ", giao_loai=" + giao_loai + ", tongdientich=" + tongdientich + ", hinhanh=" + hinhanh + ", ngayphathanh=" + ngayphathanh + ", chinhanh=" + chinhanh + ", hinhdanglodat=" + hinhdanglodat + ", duongtruocnha=" + duongtruocnha + ", hd_ngaynhan=" + hd_ngaynhan + ", hd_ngaygiao=" + hd_ngaygiao + ", hd_ngaythu=" + hd_ngaythu + ", hd_ghichu=" + hd_ghichu + ", hd_vat=" + hd_vat + "}";
    }

}
