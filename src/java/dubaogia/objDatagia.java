package dubaogia;

import java.io.Serializable;

public class objDatagia implements Serializable {

    int id;
    String loai;
    String fulldiachi;
    String tinhtp;
    String quanhuyen;
    String phuongxa;
    String duan;
    double giathap;
    double giacao;
    double gia;
    String fulldate;
    int thang;
    int nam;
    float lng;
    float lon;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoai() {
        
        return loai == "DA"? "<span class=\"badge bg-green\">DA</span>":"<span class=\"badge bg-yellow\">CC</span>";
    }

    public void setLoai(String loai) {
        this.loai = (loai.equals("DA")? "<span class=\"badge bg-green\">DA</span>":"<span class=\"badge bg-yellow\">CC</span>");
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

    public String getDuan() {
        return duan;
    }

    public void setDuan(String duan) {
        this.duan = duan;
    }

    public double getGiathap() {
        return giathap;
    }

    public void setGiathap(double giathap) {
        this.giathap = giathap;
    }

    public double getGiacao() {
        return giacao;
    }

    public void setGiacao(double giacao) {
        this.giacao = giacao;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

   

    public String getFulldate() {
        return fulldate;
    }

    public void setFulldate(String fulldate) {
        this.fulldate = fulldate;
    }

    public int getThang() {
        return thang;
    }

    public void setThang(int thang) {
        this.thang = thang;
    }

    public int getNam() {
        return nam;
    }

    public void setNam(int nam) {
        this.nam = nam;
    }

    public float getLng() {
        return lng;
    }

    public void setLng(float lng) {
        this.lng = lng;
    }

    public float getLon() {
        return lon;
    }

    public void setLon(float lon) {
        this.lon = lon;
    }

   
    
    
}
