package KhaoSat;

import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

public class objKhaoSat implements Serializable {

    private int idks;
    private int idts;
    private int idhs;
    private String mahs;
    private Timestamp ngayks;
    String manvks;

    private String tennvks;
    private String chukynvks;
    private String tenhsks;
    private String chukynguoihd;
    private String hinhanhtongquan;
    private String toadomaps;
    private String diachits;
    private double chiphiks;
    private double phitamung;
    private String loaits; // chung cư nhà phố đất trồng biệt thư văn phòngphương tiện vận tải khác

    String chukytdv;
    String tentdv;
    String sothetdv;

    //chung cu
    private String cc_dtthongthuy;
    private String cc_dttimtuong;
    private String cc_loai;
    private String cc_vitritang;
    private String cc_sophongngu;
    private String cc_matsan;
    private String cc_cuachinh;
    private String cc_cuaphong;
    private String cc_cuaso;
    private String cc_cokhuphoido;
    private String cc_huongview;
    private String cc_nhavesinh;
    private String cc_chatluongconlai;
    private String cc_khac;

    private String cc_mota;
    private String cc_vitri;
    private String cc_sothua;
    private String cc_soto;
    private String cc_dtnlonnhat;
    private String cc_dtnnhonhat;
    private String cc_dtntruocts;
    private String cc_dientichthua;
    private String cc_mucdichsd;
    private String cc_hinhthucsd;
    private String cc_thoigiansd;
    private String cc_nguongocsdd;
    private String cc_tentoanha;
    private String cc_tongsotang;
    private String cc_tongsotangcanho;
    private String cc_tongsoham;
    private String cc_macanho;
    private String cc_tangcanho;
    private String cc_dtdauxeoto;
    private String cc_hinhdang;
    private String cc_tiepgiaptruoc;
    private String cc_tiepgiapsau;
    private String cc_tiepgiaptrai;
    private String cc_tiepgiapphai;
    private String cc_noithat;
    private String cc_tinhtrang;

    //nha pho - biet thu - van phong
    private String np_hinhdang;
    private String np_chieurongmt;
    private String np_huongnha;
    private String np_duongtruocnha;
    private String np_vitri;
    private String np_vitriTS;

    private String np_loaict;
    private String np_loaimong;
    private String np_san;
    private String np_cong;
    private String np_tuong;
    private String np_tran;
    private String np_sannha;
    private String np_cuachinh;
    private String np_cuaphong;
    private String np_cuaso;
    private String np_mai;
    private String np_cauthang;
    private String np_santhuong;
    private String np_nhavesinh;
    private String np_chatluongconlai;
    private String np_khac;
    private String np_soto;
    private String np_sothua;
    private String np_dtnlonnhat;
    private String np_dtnnhonhat;
    private String np_dtntruocts;
    private String np_tiepgiaptruoc;
    private String np_tiepgiapsau;
    private String np_tiepgiaptrai;
    private String np_tiepgiapphai;
    private String np_dientichtrongqh;
    private String np_dientichngoaiqh;
    private String np_kichthuoc;
    private String np_mucdich;
    private String np_hinhthucrieng;
    private String np_hinhthucchung;
    private String np_thoigiansd;
    private String np_nguongoc;
    private String np_hientrang;
    private String np_ghichu;
    //đất trồng
    private String dt_hinhdang;
    private String dt_chieurongmt;
    private String dt_huongnha;
    private String dt_duongtruocnha;
    private String dt_vitri;
    private String dt_vitriTS;
    private String dt_khac;
    private String dt_soto;
    private String dt_sothua;
    private String dt_dtnlonnhat;
    private String dt_dtnnhonhat;
    private String dt_dtntruocts;
    private String dt_tiepgiaptruoc;
    private String dt_tiepgiapsau;
    private String dt_tiepgiaptrai;
    private String dt_tiepgiapphai;
    private String dt_dientichtrongqh;
    private String dt_dientichngoaiqh;
    private String dt_kichthuoc;
    private String dt_mucdich;
    private String dt_hinhthucrieng;
    private String dt_hinhthucchung;
    private String dt_thoigiansd;
    private String dt_nguongoc;
    private String dt_hientrang;
    private String dt_ghichu;

    // phương tiện vận chuyển
    private String pt_loaixe;
    private String pt_namsanxuat;
    private String pt_noisanxuat;
    private String pt_bienso;
    private String pt_mausac;
    private String pt_sokmdachay;
    private String pt_thanxe;
    private String pt_dentruoc;
    private String pt_densau;
    private String pt_denphanh;
    private String pt_dentinhieu;
    private String pt_loainhieulieu;
    private String pt_taitrong;
    private String pt_socho;
    private String pt_thungxe;
    private String pt_khac;

    //may moc
    String mm_thongso;

    //nha xuong    
    String nx_loaict;
    String nx_cong;
    String nx_ghichu;
    String nx_nhaxuong;
    String nx_vanphong;
    String nx_baove;
    String nx_tramcan;
    String nx_tuongbao;

    //khác
    String khac_thongso;

   

    @Override
    public String toString() {
        return "objKhaoSat{" + "idks=" + idks + ", idts=" + idts + ", idhs=" + idhs + ", mahs=" + mahs + ", ngayks=" + ngayks + ", manvks=" + manvks + ", tennvks=" + tennvks + ", chukynvks=" + chukynvks + ", tenhsks=" + tenhsks + ", chukynguoihd=" + chukynguoihd + ", hinhanhtongquan=" + hinhanhtongquan + ", toadomaps=" + toadomaps + ", diachits=" + diachits + ", chiphiks=" + chiphiks + ", phitamung=" + phitamung + ", loaits=" + loaits + ", chukytdv=" + chukytdv + ", tentdv=" + tentdv + ", sothetdv=" + sothetdv + ", cc_dtthongthuy=" + cc_dtthongthuy + ", cc_dttimtuong=" + cc_dttimtuong + ", cc_loai=" + cc_loai + ", cc_vitritang=" + cc_vitritang + ", cc_sophongngu=" + cc_sophongngu + ", cc_matsan=" + cc_matsan + ", cc_cuachinh=" + cc_cuachinh + ", cc_cuaphong=" + cc_cuaphong + ", cc_cuaso=" + cc_cuaso + ", cc_cokhuphoido=" + cc_cokhuphoido + ", cc_huongview=" + cc_huongview + ", cc_nhavesinh=" + cc_nhavesinh + ", cc_chatluongconlai=" + cc_chatluongconlai + ", cc_khac=" + cc_khac + ", cc_mota=" + cc_mota + ", cc_vitri=" + cc_vitri + ", cc_sothua=" + cc_sothua + ", cc_soto=" + cc_soto + ", cc_dtnlonnhat=" + cc_dtnlonnhat + ", cc_dtnnhonhat=" + cc_dtnnhonhat + ", cc_dtntruocts=" + cc_dtntruocts + ", cc_dientichthua=" + cc_dientichthua + ", cc_mucdichsd=" + cc_mucdichsd + ", cc_hinhthucsd=" + cc_hinhthucsd + ", cc_thoigiansd=" + cc_thoigiansd + ", cc_nguongocsdd=" + cc_nguongocsdd + ", cc_tentoanha=" + cc_tentoanha + ", cc_tongsotang=" + cc_tongsotang + ", cc_tongsotangcanho=" + cc_tongsotangcanho + ", cc_tongsoham=" + cc_tongsoham + ", cc_macanho=" + cc_macanho + ", cc_tangcanho=" + cc_tangcanho + ", cc_dtdauxeoto=" + cc_dtdauxeoto + ", cc_hinhdang=" + cc_hinhdang + ", cc_tiepgiaptruoc=" + cc_tiepgiaptruoc + ", cc_tiepgiapsau=" + cc_tiepgiapsau + ", cc_tiepgiaptrai=" + cc_tiepgiaptrai + ", cc_tiepgiapphai=" + cc_tiepgiapphai + ", cc_noithat=" + cc_noithat + ", cc_tinhtrang=" + cc_tinhtrang + ", np_hinhdang=" + np_hinhdang + ", np_chieurongmt=" + np_chieurongmt + ", np_huongnha=" + np_huongnha + ", np_duongtruocnha=" + np_duongtruocnha + ", np_vitri=" + np_vitri + ", np_vitriTS=" + np_vitriTS + ", np_loaict=" + np_loaict + ", np_loaimong=" + np_loaimong + ", np_san=" + np_san + ", np_cong=" + np_cong + ", np_tuong=" + np_tuong + ", np_tran=" + np_tran + ", np_sannha=" + np_sannha + ", np_cuachinh=" + np_cuachinh + ", np_cuaphong=" + np_cuaphong + ", np_cuaso=" + np_cuaso + ", np_mai=" + np_mai + ", np_cauthang=" + np_cauthang + ", np_santhuong=" + np_santhuong + ", np_nhavesinh=" + np_nhavesinh + ", np_chatluongconlai=" + np_chatluongconlai + ", np_khac=" + np_khac + ", np_soto=" + np_soto + ", np_sothua=" + np_sothua + ", np_dtnlonnhat=" + np_dtnlonnhat + ", np_dtnnhonhat=" + np_dtnnhonhat + ", np_dtntruocts=" + np_dtntruocts + ", np_tiepgiaptruoc=" + np_tiepgiaptruoc + ", np_tiepgiapsau=" + np_tiepgiapsau + ", np_tiepgiaptrai=" + np_tiepgiaptrai + ", np_tiepgiapphai=" + np_tiepgiapphai + ", np_dientichtrongqh=" + np_dientichtrongqh + ", np_dientichngoaiqh=" + np_dientichngoaiqh + ", np_kichthuoc=" + np_kichthuoc + ", np_mucdich=" + np_mucdich + ", np_hinhthucrieng=" + np_hinhthucrieng + ", np_hinhthucchung=" + np_hinhthucchung + ", np_thoigiansd=" + np_thoigiansd + ", np_nguongoc=" + np_nguongoc + ", np_hientrang=" + np_hientrang + ", np_ghichu=" + np_ghichu + ", dt_hinhdang=" + dt_hinhdang + ", dt_chieurongmt=" + dt_chieurongmt + ", dt_huongnha=" + dt_huongnha + ", dt_duongtruocnha=" + dt_duongtruocnha + ", dt_vitri=" + dt_vitri + ", dt_vitriTS=" + dt_vitriTS + ", dt_khac=" + dt_khac + ", dt_soto=" + dt_soto + ", dt_sothua=" + dt_sothua + ", dt_dtnlonnhat=" + dt_dtnlonnhat + ", dt_dtnnhonhat=" + dt_dtnnhonhat + ", dt_dtntruocts=" + dt_dtntruocts + ", dt_tiepgiaptruoc=" + dt_tiepgiaptruoc + ", dt_tiepgiapsau=" + dt_tiepgiapsau + ", dt_tiepgiaptrai=" + dt_tiepgiaptrai + ", dt_tiepgiapphai=" + dt_tiepgiapphai + ", dt_dientichtrongqh=" + dt_dientichtrongqh + ", dt_dientichngoaiqh=" + dt_dientichngoaiqh + ", dt_kichthuoc=" + dt_kichthuoc + ", dt_mucdich=" + dt_mucdich + ", dt_hinhthucrieng=" + dt_hinhthucrieng + ", dt_hinhthucchung=" + dt_hinhthucchung + ", dt_thoigiansd=" + dt_thoigiansd + ", dt_nguongoc=" + dt_nguongoc + ", dt_hientrang=" + dt_hientrang + ", dt_ghichu=" + dt_ghichu + ", pt_loaixe=" + pt_loaixe + ", pt_namsanxuat=" + pt_namsanxuat + ", pt_noisanxuat=" + pt_noisanxuat + ", pt_bienso=" + pt_bienso + ", pt_mausac=" + pt_mausac + ", pt_sokmdachay=" + pt_sokmdachay + ", pt_thanxe=" + pt_thanxe + ", pt_dentruoc=" + pt_dentruoc + ", pt_densau=" + pt_densau + ", pt_denphanh=" + pt_denphanh + ", pt_dentinhieu=" + pt_dentinhieu + ", pt_loainhieulieu=" + pt_loainhieulieu + ", pt_taitrong=" + pt_taitrong + ", pt_socho=" + pt_socho + ", pt_thungxe=" + pt_thungxe + ", pt_khac=" + pt_khac + ", mm_thongso=" + mm_thongso + ", nx_loaict=" + nx_loaict + ", nx_cong=" + nx_cong + ", nx_ghichu=" + nx_ghichu + ", nx_nhaxuong=" + nx_nhaxuong + ", nx_vanphong=" + nx_vanphong + ", nx_baove=" + nx_baove + ", nx_tramcan=" + nx_tramcan + ", nx_tuongbao=" + nx_tuongbao + ", khac_thongso=" + khac_thongso + '}';
    }

    public int getIdks() {
        return idks;
    }

    public void setIdks(int idks) {
        this.idks = idks;
    }

    public int getIdts() {
        return idts;
    }

    public void setIdts(int idts) {
        this.idts = idts;
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

    public Timestamp getNgayks() {
        return ngayks;
    }

    public void setNgayks(Timestamp ngayks) {
        this.ngayks = ngayks;
    }

    public String getManvks() {
        return manvks;
    }

    public void setManvks(String manvks) {
        this.manvks = manvks;
    }

    public String getTennvks() {
        return tennvks;
    }

    public void setTennvks(String tennvks) {
        this.tennvks = tennvks;
    }

    public String getChukynvks() {
        return chukynvks;
    }

    public void setChukynvks(String chukynvks) {
        this.chukynvks = chukynvks;
    }

    public String getTenhsks() {
        return tenhsks;
    }

    public void setTenhsks(String tenhsks) {
        this.tenhsks = tenhsks;
    }

    public String getChukynguoihd() {
        return chukynguoihd;
    }

    public void setChukynguoihd(String chukynguoihd) {
        this.chukynguoihd = chukynguoihd;
    }

    public String getHinhanhtongquan() {
        return hinhanhtongquan;
    }

    public void setHinhanhtongquan(String hinhanhtongquan) {
        this.hinhanhtongquan = hinhanhtongquan;
    }

    public String getToadomaps() {
        return toadomaps;
    }

    public void setToadomaps(String toadomaps) {
        this.toadomaps = toadomaps;
    }

    public String getDiachits() {
        return diachits;
    }

    public void setDiachits(String diachits) {
        this.diachits = diachits;
    }

    public double getChiphiks() {
        return chiphiks;
    }

    public void setChiphiks(double chiphiks) {
        this.chiphiks = chiphiks;
    }

    public double getPhitamung() {
        return phitamung;
    }

    public void setPhitamung(double phitamung) {
        this.phitamung = phitamung;
    }

    public String getLoaits() {
        return loaits;
    }

    public void setLoaits(String loaits) {
        this.loaits = loaits;
    }

    public String getChukytdv() {
        return chukytdv;
    }

    public void setChukytdv(String chukytdv) {
        this.chukytdv = chukytdv;
    }

    public String getTentdv() {
        return tentdv;
    }

    public void setTentdv(String tentdv) {
        this.tentdv = tentdv;
    }

    public String getSothetdv() {
        return sothetdv;
    }

    public void setSothetdv(String sothetdv) {
        this.sothetdv = sothetdv;
    }

    public String getCc_dtthongthuy() {
        return cc_dtthongthuy;
    }

    public void setCc_dtthongthuy(String cc_dtthongthuy) {
        this.cc_dtthongthuy = cc_dtthongthuy;
    }

    public String getCc_dttimtuong() {
        return cc_dttimtuong;
    }

    public void setCc_dttimtuong(String cc_dttimtuong) {
        this.cc_dttimtuong = cc_dttimtuong;
    }

    public String getCc_loai() {
        return cc_loai;
    }

    public void setCc_loai(String cc_loai) {
        this.cc_loai = cc_loai;
    }

    public String getCc_vitritang() {
        return cc_vitritang;
    }

    public void setCc_vitritang(String cc_vitritang) {
        this.cc_vitritang = cc_vitritang;
    }

    public String getCc_sophongngu() {
        return cc_sophongngu;
    }

    public void setCc_sophongngu(String cc_sophongngu) {
        this.cc_sophongngu = cc_sophongngu;
    }

    public String getCc_matsan() {
        return cc_matsan;
    }

    public void setCc_matsan(String cc_matsan) {
        this.cc_matsan = cc_matsan;
    }

    public String getCc_cuachinh() {
        return cc_cuachinh;
    }

    public void setCc_cuachinh(String cc_cuachinh) {
        this.cc_cuachinh = cc_cuachinh;
    }

    public String getCc_cuaphong() {
        return cc_cuaphong;
    }

    public void setCc_cuaphong(String cc_cuaphong) {
        this.cc_cuaphong = cc_cuaphong;
    }

    public String getCc_cuaso() {
        return cc_cuaso;
    }

    public void setCc_cuaso(String cc_cuaso) {
        this.cc_cuaso = cc_cuaso;
    }

    public String getCc_cokhuphoido() {
        return cc_cokhuphoido;
    }

    public void setCc_cokhuphoido(String cc_cokhuphoido) {
        this.cc_cokhuphoido = cc_cokhuphoido;
    }

    public String getCc_huongview() {
        return cc_huongview;
    }

    public void setCc_huongview(String cc_huongview) {
        this.cc_huongview = cc_huongview;
    }

    public String getCc_nhavesinh() {
        return cc_nhavesinh;
    }

    public void setCc_nhavesinh(String cc_nhavesinh) {
        this.cc_nhavesinh = cc_nhavesinh;
    }

    public String getCc_chatluongconlai() {
        return cc_chatluongconlai;
    }

    public void setCc_chatluongconlai(String cc_chatluongconlai) {
        this.cc_chatluongconlai = cc_chatluongconlai;
    }

    public String getCc_khac() {
        return cc_khac;
    }

    public void setCc_khac(String cc_khac) {
        this.cc_khac = cc_khac;
    }

    public String getCc_mota() {
        return cc_mota;
    }

    public void setCc_mota(String cc_mota) {
        this.cc_mota = cc_mota;
    }

    public String getCc_vitri() {
        return cc_vitri;
    }

    public void setCc_vitri(String cc_vitri) {
        this.cc_vitri = cc_vitri;
    }

    public String getCc_sothua() {
        return cc_sothua;
    }

    public void setCc_sothua(String cc_sothua) {
        this.cc_sothua = cc_sothua;
    }

    public String getCc_soto() {
        return cc_soto;
    }

    public void setCc_soto(String cc_soto) {
        this.cc_soto = cc_soto;
    }

    public String getCc_dtnlonnhat() {
        return cc_dtnlonnhat;
    }

    public void setCc_dtnlonnhat(String cc_dtnlonnhat) {
        this.cc_dtnlonnhat = cc_dtnlonnhat;
    }

    public String getCc_dtnnhonhat() {
        return cc_dtnnhonhat;
    }

    public void setCc_dtnnhonhat(String cc_dtnnhonhat) {
        this.cc_dtnnhonhat = cc_dtnnhonhat;
    }

    public String getCc_dtntruocts() {
        return cc_dtntruocts;
    }

    public void setCc_dtntruocts(String cc_dtntruocts) {
        this.cc_dtntruocts = cc_dtntruocts;
    }

    public String getCc_dientichthua() {
        return cc_dientichthua;
    }

    public void setCc_dientichthua(String cc_dientichthua) {
        this.cc_dientichthua = cc_dientichthua;
    }

    public String getCc_mucdichsd() {
        return cc_mucdichsd;
    }

    public void setCc_mucdichsd(String cc_mucdichsd) {
        this.cc_mucdichsd = cc_mucdichsd;
    }

    public String getCc_hinhthucsd() {
        return cc_hinhthucsd;
    }

    public void setCc_hinhthucsd(String cc_hinhthucsd) {
        this.cc_hinhthucsd = cc_hinhthucsd;
    }

    public String getCc_thoigiansd() {
        return cc_thoigiansd;
    }

    public void setCc_thoigiansd(String cc_thoigiansd) {
        this.cc_thoigiansd = cc_thoigiansd;
    }

    public String getCc_nguongocsdd() {
        return cc_nguongocsdd;
    }

    public void setCc_nguongocsdd(String cc_nguongocsdd) {
        this.cc_nguongocsdd = cc_nguongocsdd;
    }

    public String getCc_tentoanha() {
        return cc_tentoanha;
    }

    public void setCc_tentoanha(String cc_tentoanha) {
        this.cc_tentoanha = cc_tentoanha;
    }

    public String getCc_tongsotang() {
        return cc_tongsotang;
    }

    public void setCc_tongsotang(String cc_tongsotang) {
        this.cc_tongsotang = cc_tongsotang;
    }

    public String getCc_tongsotangcanho() {
        return cc_tongsotangcanho;
    }

    public void setCc_tongsotangcanho(String cc_tongsotangcanho) {
        this.cc_tongsotangcanho = cc_tongsotangcanho;
    }

    public String getCc_tongsoham() {
        return cc_tongsoham;
    }

    public void setCc_tongsoham(String cc_tongsoham) {
        this.cc_tongsoham = cc_tongsoham;
    }

    public String getCc_macanho() {
        return cc_macanho;
    }

    public void setCc_macanho(String cc_macanho) {
        this.cc_macanho = cc_macanho;
    }

    public String getCc_tangcanho() {
        return cc_tangcanho;
    }

    public void setCc_tangcanho(String cc_tangcanho) {
        this.cc_tangcanho = cc_tangcanho;
    }

    public String getCc_dtdauxeoto() {
        return cc_dtdauxeoto;
    }

    public void setCc_dtdauxeoto(String cc_dtdauxeoto) {
        this.cc_dtdauxeoto = cc_dtdauxeoto;
    }

    public String getCc_hinhdang() {
        return cc_hinhdang;
    }

    public void setCc_hinhdang(String cc_hinhdang) {
        this.cc_hinhdang = cc_hinhdang;
    }

    public String getCc_tiepgiaptruoc() {
        return cc_tiepgiaptruoc;
    }

    public void setCc_tiepgiaptruoc(String cc_tiepgiaptruoc) {
        this.cc_tiepgiaptruoc = cc_tiepgiaptruoc;
    }

    public String getCc_tiepgiapsau() {
        return cc_tiepgiapsau;
    }

    public void setCc_tiepgiapsau(String cc_tiepgiapsau) {
        this.cc_tiepgiapsau = cc_tiepgiapsau;
    }

    public String getCc_tiepgiaptrai() {
        return cc_tiepgiaptrai;
    }

    public void setCc_tiepgiaptrai(String cc_tiepgiaptrai) {
        this.cc_tiepgiaptrai = cc_tiepgiaptrai;
    }

    public String getCc_tiepgiapphai() {
        return cc_tiepgiapphai;
    }

    public void setCc_tiepgiapphai(String cc_tiepgiapphai) {
        this.cc_tiepgiapphai = cc_tiepgiapphai;
    }

    public String getCc_noithat() {
        return cc_noithat;
    }

    public void setCc_noithat(String cc_noithat) {
        this.cc_noithat = cc_noithat;
    }

    public String getCc_tinhtrang() {
        return cc_tinhtrang;
    }

    public void setCc_tinhtrang(String cc_tinhtrang) {
        this.cc_tinhtrang = cc_tinhtrang;
    }

    public String getNp_hinhdang() {
        return np_hinhdang;
    }

    public void setNp_hinhdang(String np_hinhdang) {
        this.np_hinhdang = np_hinhdang;
    }

    public String getNp_chieurongmt() {
        return np_chieurongmt;
    }

    public void setNp_chieurongmt(String np_chieurongmt) {
        this.np_chieurongmt = np_chieurongmt;
    }

    public String getNp_huongnha() {
        return np_huongnha;
    }

    public void setNp_huongnha(String np_huongnha) {
        this.np_huongnha = np_huongnha;
    }

    public String getNp_duongtruocnha() {
        return np_duongtruocnha;
    }

    public void setNp_duongtruocnha(String np_duongtruocnha) {
        this.np_duongtruocnha = np_duongtruocnha;
    }

    public String getNp_vitri() {
        return np_vitri;
    }

    public void setNp_vitri(String np_vitri) {
        this.np_vitri = np_vitri;
    }

    public String getNp_vitriTS() {
        return np_vitriTS;
    }

    public void setNp_vitriTS(String np_vitriTS) {
        this.np_vitriTS = np_vitriTS;
    }

    public String getNp_loaict() {
        return np_loaict;
    }

    public void setNp_loaict(String np_loaict) {
        this.np_loaict = np_loaict;
    }

    public String getNp_loaimong() {
        return np_loaimong;
    }

    public void setNp_loaimong(String np_loaimong) {
        this.np_loaimong = np_loaimong;
    }

    public String getNp_san() {
        return np_san;
    }

    public void setNp_san(String np_san) {
        this.np_san = np_san;
    }

    public String getNp_cong() {
        return np_cong;
    }

    public void setNp_cong(String np_cong) {
        this.np_cong = np_cong;
    }

    public String getNp_tuong() {
        return np_tuong;
    }

    public void setNp_tuong(String np_tuong) {
        this.np_tuong = np_tuong;
    }

    public String getNp_tran() {
        return np_tran;
    }

    public void setNp_tran(String np_tran) {
        this.np_tran = np_tran;
    }

    public String getNp_sannha() {
        return np_sannha;
    }

    public void setNp_sannha(String np_sannha) {
        this.np_sannha = np_sannha;
    }

    public String getNp_cuachinh() {
        return np_cuachinh;
    }

    public void setNp_cuachinh(String np_cuachinh) {
        this.np_cuachinh = np_cuachinh;
    }

    public String getNp_cuaphong() {
        return np_cuaphong;
    }

    public void setNp_cuaphong(String np_cuaphong) {
        this.np_cuaphong = np_cuaphong;
    }

    public String getNp_cuaso() {
        return np_cuaso;
    }

    public void setNp_cuaso(String np_cuaso) {
        this.np_cuaso = np_cuaso;
    }

    public String getNp_mai() {
        return np_mai;
    }

    public void setNp_mai(String np_mai) {
        this.np_mai = np_mai;
    }

    public String getNp_cauthang() {
        return np_cauthang;
    }

    public void setNp_cauthang(String np_cauthang) {
        this.np_cauthang = np_cauthang;
    }

    public String getNp_santhuong() {
        return np_santhuong;
    }

    public void setNp_santhuong(String np_santhuong) {
        this.np_santhuong = np_santhuong;
    }

    public String getNp_nhavesinh() {
        return np_nhavesinh;
    }

    public void setNp_nhavesinh(String np_nhavesinh) {
        this.np_nhavesinh = np_nhavesinh;
    }

    public String getNp_chatluongconlai() {
        return np_chatluongconlai;
    }

    public void setNp_chatluongconlai(String np_chatluongconlai) {
        this.np_chatluongconlai = np_chatluongconlai;
    }

    public String getNp_khac() {
        return np_khac;
    }

    public void setNp_khac(String np_khac) {
        this.np_khac = np_khac;
    }

    public String getNp_soto() {
        return np_soto;
    }

    public void setNp_soto(String np_soto) {
        this.np_soto = np_soto;
    }

    public String getNp_sothua() {
        return np_sothua;
    }

    public void setNp_sothua(String np_sothua) {
        this.np_sothua = np_sothua;
    }

    public String getNp_dtnlonnhat() {
        return np_dtnlonnhat;
    }

    public void setNp_dtnlonnhat(String np_dtnlonnhat) {
        this.np_dtnlonnhat = np_dtnlonnhat;
    }

    public String getNp_dtnnhonhat() {
        return np_dtnnhonhat;
    }

    public void setNp_dtnnhonhat(String np_dtnnhonhat) {
        this.np_dtnnhonhat = np_dtnnhonhat;
    }

    public String getNp_dtntruocts() {
        return np_dtntruocts;
    }

    public void setNp_dtntruocts(String np_dtntruocts) {
        this.np_dtntruocts = np_dtntruocts;
    }

    public String getNp_tiepgiaptruoc() {
        return np_tiepgiaptruoc;
    }

    public void setNp_tiepgiaptruoc(String np_tiepgiaptruoc) {
        this.np_tiepgiaptruoc = np_tiepgiaptruoc;
    }

    public String getNp_tiepgiapsau() {
        return np_tiepgiapsau;
    }

    public void setNp_tiepgiapsau(String np_tiepgiapsau) {
        this.np_tiepgiapsau = np_tiepgiapsau;
    }

    public String getNp_tiepgiaptrai() {
        return np_tiepgiaptrai;
    }

    public void setNp_tiepgiaptrai(String np_tiepgiaptrai) {
        this.np_tiepgiaptrai = np_tiepgiaptrai;
    }

    public String getNp_tiepgiapphai() {
        return np_tiepgiapphai;
    }

    public void setNp_tiepgiapphai(String np_tiepgiapphai) {
        this.np_tiepgiapphai = np_tiepgiapphai;
    }

    public String getNp_dientichtrongqh() {
        return np_dientichtrongqh;
    }

    public void setNp_dientichtrongqh(String np_dientichtrongqh) {
        this.np_dientichtrongqh = np_dientichtrongqh;
    }

    public String getNp_dientichngoaiqh() {
        return np_dientichngoaiqh;
    }

    public void setNp_dientichngoaiqh(String np_dientichngoaiqh) {
        this.np_dientichngoaiqh = np_dientichngoaiqh;
    }

    public String getNp_kichthuoc() {
        return np_kichthuoc;
    }

    public void setNp_kichthuoc(String np_kichthuoc) {
        this.np_kichthuoc = np_kichthuoc;
    }

    public String getNp_mucdich() {
        return np_mucdich;
    }

    public void setNp_mucdich(String np_mucdich) {
        this.np_mucdich = np_mucdich;
    }

    public String getNp_hinhthucrieng() {
        return np_hinhthucrieng;
    }

    public void setNp_hinhthucrieng(String np_hinhthucrieng) {
        this.np_hinhthucrieng = np_hinhthucrieng;
    }

    public String getNp_hinhthucchung() {
        return np_hinhthucchung;
    }

    public void setNp_hinhthucchung(String np_hinhthucchung) {
        this.np_hinhthucchung = np_hinhthucchung;
    }

    public String getNp_thoigiansd() {
        return np_thoigiansd;
    }

    public void setNp_thoigiansd(String np_thoigiansd) {
        this.np_thoigiansd = np_thoigiansd;
    }

    public String getNp_nguongoc() {
        return np_nguongoc;
    }

    public void setNp_nguongoc(String np_nguongoc) {
        this.np_nguongoc = np_nguongoc;
    }

    public String getNp_hientrang() {
        return np_hientrang;
    }

    public void setNp_hientrang(String np_hientrang) {
        this.np_hientrang = np_hientrang;
    }

    public String getNp_ghichu() {
        return np_ghichu;
    }

    public void setNp_ghichu(String np_ghichu) {
        this.np_ghichu = np_ghichu;
    }

    public String getDt_hinhdang() {
        return dt_hinhdang;
    }

    public void setDt_hinhdang(String dt_hinhdang) {
        this.dt_hinhdang = dt_hinhdang;
    }

    public String getDt_chieurongmt() {
        return dt_chieurongmt;
    }

    public void setDt_chieurongmt(String dt_chieurongmt) {
        this.dt_chieurongmt = dt_chieurongmt;
    }

    public String getDt_huongnha() {
        return dt_huongnha;
    }

    public void setDt_huongnha(String dt_huongnha) {
        this.dt_huongnha = dt_huongnha;
    }

    public String getDt_duongtruocnha() {
        return dt_duongtruocnha;
    }

    public void setDt_duongtruocnha(String dt_duongtruocnha) {
        this.dt_duongtruocnha = dt_duongtruocnha;
    }

    public String getDt_vitri() {
        return dt_vitri;
    }

    public void setDt_vitri(String dt_vitri) {
        this.dt_vitri = dt_vitri;
    }

    public String getDt_vitriTS() {
        return dt_vitriTS;
    }

    public void setDt_vitriTS(String dt_vitriTS) {
        this.dt_vitriTS = dt_vitriTS;
    }

    public String getDt_khac() {
        return dt_khac;
    }

    public void setDt_khac(String dt_khac) {
        this.dt_khac = dt_khac;
    }

    public String getDt_soto() {
        return dt_soto;
    }

    public void setDt_soto(String dt_soto) {
        this.dt_soto = dt_soto;
    }

    public String getDt_sothua() {
        return dt_sothua;
    }

    public void setDt_sothua(String dt_sothua) {
        this.dt_sothua = dt_sothua;
    }

    public String getDt_dtnlonnhat() {
        return dt_dtnlonnhat;
    }

    public void setDt_dtnlonnhat(String dt_dtnlonnhat) {
        this.dt_dtnlonnhat = dt_dtnlonnhat;
    }

    public String getDt_dtnnhonhat() {
        return dt_dtnnhonhat;
    }

    public void setDt_dtnnhonhat(String dt_dtnnhonhat) {
        this.dt_dtnnhonhat = dt_dtnnhonhat;
    }

    public String getDt_dtntruocts() {
        return dt_dtntruocts;
    }

    public void setDt_dtntruocts(String dt_dtntruocts) {
        this.dt_dtntruocts = dt_dtntruocts;
    }

    public String getDt_tiepgiaptruoc() {
        return dt_tiepgiaptruoc;
    }

    public void setDt_tiepgiaptruoc(String dt_tiepgiaptruoc) {
        this.dt_tiepgiaptruoc = dt_tiepgiaptruoc;
    }

    public String getDt_tiepgiapsau() {
        return dt_tiepgiapsau;
    }

    public void setDt_tiepgiapsau(String dt_tiepgiapsau) {
        this.dt_tiepgiapsau = dt_tiepgiapsau;
    }

    public String getDt_tiepgiaptrai() {
        return dt_tiepgiaptrai;
    }

    public void setDt_tiepgiaptrai(String dt_tiepgiaptrai) {
        this.dt_tiepgiaptrai = dt_tiepgiaptrai;
    }

    public String getDt_tiepgiapphai() {
        return dt_tiepgiapphai;
    }

    public void setDt_tiepgiapphai(String dt_tiepgiapphai) {
        this.dt_tiepgiapphai = dt_tiepgiapphai;
    }

    public String getDt_dientichtrongqh() {
        return dt_dientichtrongqh;
    }

    public void setDt_dientichtrongqh(String dt_dientichtrongqh) {
        this.dt_dientichtrongqh = dt_dientichtrongqh;
    }

    public String getDt_dientichngoaiqh() {
        return dt_dientichngoaiqh;
    }

    public void setDt_dientichngoaiqh(String dt_dientichngoaiqh) {
        this.dt_dientichngoaiqh = dt_dientichngoaiqh;
    }

    public String getDt_kichthuoc() {
        return dt_kichthuoc;
    }

    public void setDt_kichthuoc(String dt_kichthuoc) {
        this.dt_kichthuoc = dt_kichthuoc;
    }

    public String getDt_mucdich() {
        return dt_mucdich;
    }

    public void setDt_mucdich(String dt_mucdich) {
        this.dt_mucdich = dt_mucdich;
    }

    public String getDt_hinhthucrieng() {
        return dt_hinhthucrieng;
    }

    public void setDt_hinhthucrieng(String dt_hinhthucrieng) {
        this.dt_hinhthucrieng = dt_hinhthucrieng;
    }

    public String getDt_hinhthucchung() {
        return dt_hinhthucchung;
    }

    public void setDt_hinhthucchung(String dt_hinhthucchung) {
        this.dt_hinhthucchung = dt_hinhthucchung;
    }

    public String getDt_thoigiansd() {
        return dt_thoigiansd;
    }

    public void setDt_thoigiansd(String dt_thoigiansd) {
        this.dt_thoigiansd = dt_thoigiansd;
    }

    public String getDt_nguongoc() {
        return dt_nguongoc;
    }

    public void setDt_nguongoc(String dt_nguongoc) {
        this.dt_nguongoc = dt_nguongoc;
    }

    public String getDt_hientrang() {
        return dt_hientrang;
    }

    public void setDt_hientrang(String dt_hientrang) {
        this.dt_hientrang = dt_hientrang;
    }

    public String getDt_ghichu() {
        return dt_ghichu;
    }

    public void setDt_ghichu(String dt_ghichu) {
        this.dt_ghichu = dt_ghichu;
    }

    public String getPt_loaixe() {
        return pt_loaixe;
    }

    public void setPt_loaixe(String pt_loaixe) {
        this.pt_loaixe = pt_loaixe;
    }

    public String getPt_namsanxuat() {
        return pt_namsanxuat;
    }

    public void setPt_namsanxuat(String pt_namsanxuat) {
        this.pt_namsanxuat = pt_namsanxuat;
    }

    public String getPt_noisanxuat() {
        return pt_noisanxuat;
    }

    public void setPt_noisanxuat(String pt_noisanxuat) {
        this.pt_noisanxuat = pt_noisanxuat;
    }

    public String getPt_bienso() {
        return pt_bienso;
    }

    public void setPt_bienso(String pt_bienso) {
        this.pt_bienso = pt_bienso;
    }

    public String getPt_mausac() {
        return pt_mausac;
    }

    public void setPt_mausac(String pt_mausac) {
        this.pt_mausac = pt_mausac;
    }

    public String getPt_sokmdachay() {
        return pt_sokmdachay;
    }

    public void setPt_sokmdachay(String pt_sokmdachay) {
        this.pt_sokmdachay = pt_sokmdachay;
    }

    public String getPt_thanxe() {
        return pt_thanxe;
    }

    public void setPt_thanxe(String pt_thanxe) {
        this.pt_thanxe = pt_thanxe;
    }

    public String getPt_dentruoc() {
        return pt_dentruoc;
    }

    public void setPt_dentruoc(String pt_dentruoc) {
        this.pt_dentruoc = pt_dentruoc;
    }

    public String getPt_densau() {
        return pt_densau;
    }

    public void setPt_densau(String pt_densau) {
        this.pt_densau = pt_densau;
    }

    public String getPt_denphanh() {
        return pt_denphanh;
    }

    public void setPt_denphanh(String pt_denphanh) {
        this.pt_denphanh = pt_denphanh;
    }

    public String getPt_dentinhieu() {
        return pt_dentinhieu;
    }

    public void setPt_dentinhieu(String pt_dentinhieu) {
        this.pt_dentinhieu = pt_dentinhieu;
    }

    public String getPt_loainhieulieu() {
        return pt_loainhieulieu;
    }

    public void setPt_loainhieulieu(String pt_loainhieulieu) {
        this.pt_loainhieulieu = pt_loainhieulieu;
    }

    public String getPt_taitrong() {
        return pt_taitrong;
    }

    public void setPt_taitrong(String pt_taitrong) {
        this.pt_taitrong = pt_taitrong;
    }

    public String getPt_socho() {
        return pt_socho;
    }

    public void setPt_socho(String pt_socho) {
        this.pt_socho = pt_socho;
    }

    public String getPt_thungxe() {
        return pt_thungxe;
    }

    public void setPt_thungxe(String pt_thungxe) {
        this.pt_thungxe = pt_thungxe;
    }

    public String getPt_khac() {
        return pt_khac;
    }

    public void setPt_khac(String pt_khac) {
        this.pt_khac = pt_khac;
    }

    public String getMm_thongso() {
        return mm_thongso;
    }

    public void setMm_thongso(String mm_thongso) {
        this.mm_thongso = mm_thongso;
    }

    public String getNx_loaict() {
        return nx_loaict;
    }

    public void setNx_loaict(String nx_loaict) {
        this.nx_loaict = nx_loaict;
    }

    public String getNx_cong() {
        return nx_cong;
    }

    public void setNx_cong(String nx_cong) {
        this.nx_cong = nx_cong;
    }

    public String getNx_ghichu() {
        return nx_ghichu;
    }

    public void setNx_ghichu(String nx_ghichu) {
        this.nx_ghichu = nx_ghichu;
    }

    public String getNx_nhaxuong() {
        return nx_nhaxuong;
    }

    public void setNx_nhaxuong(String nx_nhaxuong) {
        this.nx_nhaxuong = nx_nhaxuong;
    }

    public String getNx_vanphong() {
        return nx_vanphong;
    }

    public void setNx_vanphong(String nx_vanphong) {
        this.nx_vanphong = nx_vanphong;
    }

    public String getNx_baove() {
        return nx_baove;
    }

    public void setNx_baove(String nx_baove) {
        this.nx_baove = nx_baove;
    }

    public String getNx_tramcan() {
        return nx_tramcan;
    }

    public void setNx_tramcan(String nx_tramcan) {
        this.nx_tramcan = nx_tramcan;
    }

    public String getNx_tuongbao() {
        return nx_tuongbao;
    }

    public void setNx_tuongbao(String nx_tuongbao) {
        this.nx_tuongbao = nx_tuongbao;
    }

    public String getKhac_thongso() {
        return khac_thongso;
    }

    public void setKhac_thongso(String khac_thongso) {
        this.khac_thongso = khac_thongso;
    }

    
    
    
}
