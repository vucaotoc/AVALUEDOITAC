package ChungThu;

import java.io.Serializable;
import java.sql.Timestamp;

public class objChungThu implements Serializable {

    int idct;
    String mahs;
    String soct;
    String makh;
    Timestamp ngaylap;
    Timestamp ngayphathanh;
    String tenkh;
    String cnpgd;
    String fulldiachi;
    String tinhtp;
    String quanhuyen;
    String phuongxa;
    String duongpho;
    String motaBDS;
    String loaidat;
    double dato_dientich;
    double dato_dongia;
    double dato_giatri;
    double datkhac_dientich;
    double datkhac_dongia;
    double datkhac_giatri;
    double giatriQSDdat;
    String loaiCTXD;
    double CTXDdientich;
    double CTXDdongia;
    String CTXDCLCL;
    double CTXDkhac;
    double CTXDgiatri;
    double tonggiatri;
    int tinhtrang;
    String manvlap;
    String tennvlap;
    String vitri;

    String loaidat1;
    double loaidat1_s;
    double loaidat1_dg;
    double loaidat1_gt;
    double loaidat1_gtqsd;

    String loaidat2;
    double loaidat2_s;
    double loaidat2_dg;
    double loaidat2_gt;
    double loaidat2_gtqsd;

    String loaidat3;
    double loaidat3_s;
    double loaidat3_dg;
    double loaidat3_gt;
    double loaidat3_gtqsd;

    String loaidat4;
    double loaidat4_s;
    double loaidat4_dg;
    double loaidat4_gt;
    double loaidat4_gtqsd;

    public objChungThu() {
        this.idct = 0;
        this.mahs = "";
        this.soct = "";
        this.makh = "";
        this.ngaylap = null;
        this.ngayphathanh = null;
        this.tenkh = "";
        this.cnpgd = "";
        this.vitri = "";
        this.fulldiachi = "";
        this.tinhtp = "";
        this.quanhuyen = "";
        this.phuongxa = "";
        this.duongpho = "";
        this.motaBDS = "";
        this.loaidat = "";
        this.dato_dientich = 0;
        this.dato_dongia = 0;
        this.dato_giatri = 0;
        this.datkhac_dientich = 0;
        this.datkhac_dongia = 0;
        this.datkhac_giatri = 0;
        this.giatriQSDdat = 0;
        this.loaiCTXD = "";
        this.CTXDdientich = 0;
        this.CTXDdongia = 0;
        this.CTXDCLCL = "";
        this.CTXDkhac = 0;
        this.CTXDgiatri = 0;
        this.tonggiatri = 0;
        this.tinhtrang = 0;
        this.manvlap = "";
        this.tennvlap = "";
    }

    public objChungThu(int idct, String vitri, String mahs, String soct, String makh, Timestamp ngaylap, Timestamp ngayphathanh, String tenkh, String cnpgd, String fulldiachi, String tinhtp, String quanhuyen, String phuongxa, String duongpho, String motaBDS, String loaidat, double dato_dientich, double dato_dongia, double dato_giatri, double datkhac_dientich, double datkhac_dongia, double datkhac_giatri, double giatriQSDdat, String loaiCTXD, double CTXDdientich, double CTXDdongia, String CTXDCLCL, double CTXDkhac, double CTXDgiatri, double tonggiatri, int tinhtrang, String manvlap, String tennvlap) {
        this.vitri = vitri;
        this.idct = idct;
        this.mahs = mahs;
        this.soct = soct;
        this.makh = makh;
        this.ngaylap = ngaylap;
        this.ngayphathanh = ngayphathanh;
        this.tenkh = tenkh;
        this.cnpgd = cnpgd;
        this.fulldiachi = fulldiachi;
        this.tinhtp = tinhtp;
        this.quanhuyen = quanhuyen;
        this.phuongxa = phuongxa;
        this.duongpho = duongpho;
        this.motaBDS = motaBDS;
        this.loaidat = loaidat;
        this.dato_dientich = dato_dientich;
        this.dato_dongia = dato_dongia;
        this.dato_giatri = dato_giatri;
        this.datkhac_dientich = datkhac_dientich;
        this.datkhac_dongia = datkhac_dongia;
        this.datkhac_giatri = datkhac_giatri;
        this.giatriQSDdat = giatriQSDdat;
        this.loaiCTXD = loaiCTXD;
        this.CTXDdientich = CTXDdientich;
        this.CTXDdongia = CTXDdongia;
        this.CTXDCLCL = CTXDCLCL;
        this.CTXDkhac = CTXDkhac;
        this.CTXDgiatri = CTXDgiatri;
        this.tonggiatri = tonggiatri;
        this.tinhtrang = tinhtrang;
        this.manvlap = manvlap;
        this.tennvlap = tennvlap;

    }

    @Override
    public String toString() {
        return "objChungThu{" + "idct=" + idct + ", mahs=" + mahs + ", soct=" + soct + ", makh=" + makh + ", ngaylap=" + ngaylap + ", ngayphathanh=" + ngayphathanh + ", tenkh=" + tenkh + ", cnpgd=" + cnpgd + ", fulldiachi=" + fulldiachi + ", tinhtp=" + tinhtp + ", quanhuyen=" + quanhuyen + ", phuongxa=" + phuongxa + ", duongpho=" + duongpho + ", motaBDS=" + motaBDS + ", loaidat=" + loaidat + ", dato_dientich=" + dato_dientich + ", dato_dongia=" + dato_dongia + ", dato_giatri=" + dato_giatri + ", datkhac_dientich=" + datkhac_dientich + ", datkhac_dongia=" + datkhac_dongia + ", datkhac_giatri=" + datkhac_giatri + ", giatriQSDdat=" + giatriQSDdat + ", loaiCTXD=" + loaiCTXD + ", CTXDdientich=" + CTXDdientich + ", CTXDdongia=" + CTXDdongia + ", CTXDCLCL=" + CTXDCLCL + ", CTXDkhac=" + CTXDkhac + ", CTXDgiatri=" + CTXDgiatri + ", tonggiatri=" + tonggiatri + ", tinhtrang=" + tinhtrang + ", manvlap=" + manvlap + ", tennvlap=" + tennvlap + '}';
    }

    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }

    public int getIdct() {
        return idct;
    }

    public void setIdct(int idct) {
        this.idct = idct;
    }

    public String getMahs() {
        return mahs;
    }

    public void setMahs(String mahs) {
        this.mahs = mahs;
    }

    public String getSoct() {
        return soct;
    }

    public void setSoct(String soct) {
        this.soct = soct;
    }

    public String getMakh() {
        return makh;
    }

    public void setMakh(String makh) {
        this.makh = makh;
    }

    public Timestamp getNgaylap() {
        return ngaylap;
    }

    public void setNgaylap(Timestamp ngaylap) {
        this.ngaylap = ngaylap;
    }

    public Timestamp getNgayphathanh() {
        return ngayphathanh;
    }

    public void setNgayphathanh(Timestamp ngayphathanh) {
        this.ngayphathanh = ngayphathanh;
    }

    public String getTenkh() {
        return tenkh;
    }

    public void setTenkh(String tenkh) {
        this.tenkh = tenkh;
    }

    public String getCnpgd() {
        return cnpgd;
    }

    public void setCnpgd(String cnpgd) {
        this.cnpgd = cnpgd;
    }

    public String getFulldiachi() {
        return fulldiachi;
    }

    public void setFulldiachi(String fulldiachi) {
        this.fulldiachi = fulldiachi;
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

    public String getDuongpho() {
        return duongpho;
    }

    public void setDuongpho(String duongpho) {
        this.duongpho = duongpho;
    }

    public String getMotaBDS() {
        return motaBDS;
    }

    public void setMotaBDS(String motaBDS) {
        this.motaBDS = motaBDS;
    }

    public String getLoaidat() {
        return loaidat;
    }

    public void setLoaidat(String loaidat) {
        this.loaidat = loaidat;
    }

    public double getDato_dientich() {
        return dato_dientich;
    }

    public void setDato_dientich(double dato_dientich) {
        this.dato_dientich = dato_dientich;
    }

    public double getDato_dongia() {
        return dato_dongia;
    }

    public void setDato_dongia(double dato_dongia) {
        this.dato_dongia = dato_dongia;
    }

    public double getDato_giatri() {
        return dato_giatri;
    }

    public void setDato_giatri(double dato_giatri) {
        this.dato_giatri = dato_giatri;
    }

    public double getDatkhac_dientich() {
        return datkhac_dientich;
    }

    public void setDatkhac_dientich(double datkhac_dientich) {
        this.datkhac_dientich = datkhac_dientich;
    }

    public double getDatkhac_dongia() {
        return datkhac_dongia;
    }

    public void setDatkhac_dongia(double datkhac_dongia) {
        this.datkhac_dongia = datkhac_dongia;
    }

    public double getDatkhac_giatri() {
        return datkhac_giatri;
    }

    public void setDatkhac_giatri(double datkhac_giatri) {
        this.datkhac_giatri = datkhac_giatri;
    }

    public double getGiatriQSDdat() {
        return giatriQSDdat;
    }

    public void setGiatriQSDdat(double giatriQSDdat) {
        this.giatriQSDdat = giatriQSDdat;
    }

    public String getLoaiCTXD() {
        return loaiCTXD;
    }

    public void setLoaiCTXD(String loaiCTXD) {
        this.loaiCTXD = loaiCTXD;
    }

    public double getCTXDdientich() {
        return CTXDdientich;
    }

    public void setCTXDdientich(double CTXDdientich) {
        this.CTXDdientich = CTXDdientich;
    }

    public double getCTXDdongia() {
        return CTXDdongia;
    }

    public void setCTXDdongia(double CTXDdongia) {
        this.CTXDdongia = CTXDdongia;
    }

    public String getCTXDCLCL() {
        return CTXDCLCL;
    }

    public void setCTXDCLCL(String CTXDCLCL) {
        this.CTXDCLCL = CTXDCLCL;
    }

    public double getCTXDkhac() {
        return CTXDkhac;
    }

    public void setCTXDkhac(double CTXDkhac) {
        this.CTXDkhac = CTXDkhac;
    }

    public double getCTXDgiatri() {
        return CTXDgiatri;
    }

    public void setCTXDgiatri(double CTXDgiatri) {
        this.CTXDgiatri = CTXDgiatri;
    }

    public double getTonggiatri() {
        return tonggiatri;
    }

    public void setTonggiatri(double tonggiatri) {
        this.tonggiatri = tonggiatri;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public String getManvlap() {
        return manvlap;
    }

    public void setManvlap(String manvlap) {
        this.manvlap = manvlap;
    }

    public String getTennvlap() {
        return tennvlap;
    }

    public void setTennvlap(String tennvlap) {
        this.tennvlap = tennvlap;
    }

    public String getLoaidat1() {
        return loaidat1;
    }

    public void setLoaidat1(String loaidat1) {
        this.loaidat1 = loaidat1;
    }

    public double getLoaidat1_s() {
        return loaidat1_s;
    }

    public void setLoaidat1_s(double loaidat1_s) {
        this.loaidat1_s = loaidat1_s;
    }

    public double getLoaidat1_dg() {
        return loaidat1_dg;
    }

    public void setLoaidat1_dg(double loaidat1_dg) {
        this.loaidat1_dg = loaidat1_dg;
    }

    public double getLoaidat1_gt() {
        return loaidat1_gt;
    }

    public void setLoaidat1_gt(double loaidat1_gt) {
        this.loaidat1_gt = loaidat1_gt;
    }

    public double getLoaidat1_gtqsd() {
        return loaidat1_gtqsd;
    }

    public void setLoaidat1_gtqsd(double loaidat1_gtqsd) {
        this.loaidat1_gtqsd = loaidat1_gtqsd;
    }

    public String getLoaidat2() {
        return loaidat2;
    }

    public void setLoaidat2(String loaidat2) {
        this.loaidat2 = loaidat2;
    }

    public double getLoaidat2_s() {
        return loaidat2_s;
    }

    public void setLoaidat2_s(double loaidat2_s) {
        this.loaidat2_s = loaidat2_s;
    }

    public double getLoaidat2_dg() {
        return loaidat2_dg;
    }

    public void setLoaidat2_dg(double loaidat2_dg) {
        this.loaidat2_dg = loaidat2_dg;
    }

    public double getLoaidat2_gt() {
        return loaidat2_gt;
    }

    public void setLoaidat2_gt(double loaidat2_gt) {
        this.loaidat2_gt = loaidat2_gt;
    }

    public double getLoaidat2_gtqsd() {
        return loaidat2_gtqsd;
    }

    public void setLoaidat2_gtqsd(double loaidat2_gtqsd) {
        this.loaidat2_gtqsd = loaidat2_gtqsd;
    }

    public String getLoaidat3() {
        return loaidat3;
    }

    public void setLoaidat3(String loaidat3) {
        this.loaidat3 = loaidat3;
    }

    public double getLoaidat3_s() {
        return loaidat3_s;
    }

    public void setLoaidat3_s(double loaidat3_s) {
        this.loaidat3_s = loaidat3_s;
    }

    public double getLoaidat3_dg() {
        return loaidat3_dg;
    }

    public void setLoaidat3_dg(double loaidat3_dg) {
        this.loaidat3_dg = loaidat3_dg;
    }

    public double getLoaidat3_gt() {
        return loaidat3_gt;
    }

    public void setLoaidat3_gt(double loaidat3_gt) {
        this.loaidat3_gt = loaidat3_gt;
    }

    public double getLoaidat3_gtqsd() {
        return loaidat3_gtqsd;
    }

    public void setLoaidat3_gtqsd(double loaidat3_gtqsd) {
        this.loaidat3_gtqsd = loaidat3_gtqsd;
    }

    public String getLoaidat4() {
        return loaidat4;
    }

    public void setLoaidat4(String loaidat4) {
        this.loaidat4 = loaidat4;
    }

    public double getLoaidat4_s() {
        return loaidat4_s;
    }

    public void setLoaidat4_s(double loaidat4_s) {
        this.loaidat4_s = loaidat4_s;
    }

    public double getLoaidat4_dg() {
        return loaidat4_dg;
    }

    public void setLoaidat4_dg(double loaidat4_dg) {
        this.loaidat4_dg = loaidat4_dg;
    }

    public double getLoaidat4_gt() {
        return loaidat4_gt;
    }

    public void setLoaidat4_gt(double loaidat4_gt) {
        this.loaidat4_gt = loaidat4_gt;
    }

    public double getLoaidat4_gtqsd() {
        return loaidat4_gtqsd;
    }

    public void setLoaidat4_gtqsd(double loaidat4_gtqsd) {
        this.loaidat4_gtqsd = loaidat4_gtqsd;
    }

}
