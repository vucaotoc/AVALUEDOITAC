package TaiSan;

import java.io.Serializable;
import java.sql.Timestamp;

public class objTaiSan implements Serializable {

    private int idts;
    private int idhs;
    String mahs;
    Timestamp ngaylaphs;
    private String loaits;
    String tents;
    private double gia;
    String notegia;
    private double giatd;
    String ptvt_loaixe;
    String ptvt_model;
    String ptvt_mauson;
    String ptvt_namsx;
    String ptvt_sokhung;
    String ptvt_somay;
    String ptvt_bienso;

    String ghichu;
    private String tinhtp;
    private String quanhuyen;
    private String phuongxa;
    private String diachi;
    private Timestamp ngayks;
    private String nvks;
    int idnvtao;
    String tennvtao;
    int tinhtrang;
    int dakhaosat;

    String doitacnh;
    String canbonh;
    Timestamp ngaylapts;

    String mm_loaimm;

    String thongtints;

    public objTaiSan() {
        this.ptvt_loaixe = "";
        this.ptvt_model = "";
        this.ptvt_mauson = "";
        this.ptvt_namsx = "";
        this.idts = 0;
        this.idhs = 0;
        this.loaits = "";
        this.gia = 0;
        this.notegia = "";
        this.tents = "";
        this.giatd = 0;
        this.tinhtp = "";
        this.quanhuyen = "";
        this.phuongxa = "";
        this.diachi = "";
        this.ngayks = new Timestamp(2021, 1, 1, 0, 0, 99, 999);
        this.nvks = "";
        this.idnvtao = 0;
        this.tennvtao = "";
        this.tinhtrang = 0;
        this.ghichu = "";

    }

    public objTaiSan(String ghichu, String ptvt_loaixe, String ptvt_model, String ptvt_mauson, String ptvt_namsx, String tents, String notegia, int idts, int idhs, String loaits, double gia, double giatd, String tinhtp, String quanhuyen, String phuongxa, String diachi, Timestamp ngayks, String nvks, int idnvtao, String tennvtao, int tinhtrang) {
        this.notegia = notegia;
        this.idts = idts;
        this.idhs = idhs;
        this.loaits = loaits;
        this.tents = tents;
        this.gia = gia;
        this.giatd = giatd;
        this.tinhtp = tinhtp;
        this.quanhuyen = quanhuyen;
        this.phuongxa = phuongxa;
        this.diachi = diachi;
        this.ngayks = ngayks;
        this.nvks = nvks;
        this.idnvtao = idnvtao;
        this.tennvtao = tennvtao;
        this.tinhtrang = tinhtrang;
        this.ptvt_loaixe = ptvt_loaixe;
        this.ptvt_model = ptvt_model;
        this.ptvt_mauson = ptvt_mauson;
        this.ptvt_namsx = ptvt_namsx;
        this.ghichu = ghichu;
    }

    public String getThongtints() {
        return thongtints;
    }

    public void setThongtints(String thongtints) {
        this.thongtints = thongtints;
    }

    public String getPtvt_bienso() {
        return ptvt_bienso;
    }

    public void setPtvt_bienso(String ptvt_bienso) {
        this.ptvt_bienso = ptvt_bienso;
    }

    public String getMm_loaimm() {
        return mm_loaimm;
    }

    public void setMm_loaimm(String mm_loaimm) {
        this.mm_loaimm = mm_loaimm;
    }

    public String getPtvt_sokhung() {
        return ptvt_sokhung;
    }

    public void setPtvt_sokhung(String ptvt_sokhung) {
        this.ptvt_sokhung = ptvt_sokhung;
    }

    public String getPtvt_somay() {
        return ptvt_somay;
    }

    public void setPtvt_somay(String ptvt_somay) {
        this.ptvt_somay = ptvt_somay;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public String getDoitacnh() {
        return doitacnh;
    }

    public void setDoitacnh(String doitacnh) {
        this.doitacnh = doitacnh;
    }

    public String getCanbonh() {
        return canbonh;
    }

    public void setCanbonh(String canbonh) {
        this.canbonh = canbonh;
    }

    public Timestamp getNgaylapts() {
        return ngaylapts;
    }

    public void setNgaylapts(Timestamp ngaylapts) {
        this.ngaylapts = ngaylapts;
    }

    public String getTents() {
        return tents;
    }

    public void setTents(String tents) {
        this.tents = tents;
    }

    public String getNotegia() {
        return notegia;
    }

    public void setNotegia(String notegia) {
        this.notegia = notegia;
    }

    public int getDakhaosat() {
        return dakhaosat;
    }

    public void setDakhaosat(int dakhaosat) {
        this.dakhaosat = dakhaosat;
    }

    public double getGiatd() {
        return giatd;
    }

    public void setGiatd(double giatd) {
        this.giatd = giatd;
    }

    public String getPtvt_loaixe() {
        return ptvt_loaixe;
    }

    public void setPtvt_loaixe(String ptvt_loaixe) {
        this.ptvt_loaixe = ptvt_loaixe;
    }

    public String getPtvt_model() {
        return ptvt_model;
    }

    public void setPtvt_model(String ptvt_model) {
        this.ptvt_model = ptvt_model;
    }

    public String getPtvt_mauson() {
        return ptvt_mauson;
    }

    public void setPtvt_mauson(String ptvt_mauson) {
        this.ptvt_mauson = ptvt_mauson;
    }

    public String getPtvt_namsx() {
        return ptvt_namsx;
    }

    public void setPtvt_namsx(String ptvt_namsx) {
        this.ptvt_namsx = ptvt_namsx;
    }

    public String getFullDiaChi() {
        return diachi + ", " + phuongxa + ", " + quanhuyen + ", " + tinhtp;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
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

    public void setTennvtao(String tennvtao) {
        this.tennvtao = tennvtao;
    }

    public int getIdts() {
        return idts;
    }

    public void setIdts(int idts) {
        this.idts = idts;
    }

    public String getLoaits() {
        return loaits;
    }

    public void setLoaits(String loaits) {
        this.loaits = loaits;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
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

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public Timestamp getNgayks() {
        return ngayks;
    }

    public void setNgayks(Timestamp ngayks) {
        this.ngayks = ngayks;
    }

    public String getNvks() {
        return nvks;
    }

    public void setNvks(String nvks) {
        this.nvks = nvks;
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

    public Timestamp getNgaylaphs() {
        return ngaylaphs;
    }

    public void setNgaylaphs(Timestamp ngaylaphs) {
        this.ngaylaphs = ngaylaphs;
    }

    public static String getthongtintaisan(objTaiSan obj) {
        String kq = "";
        if (obj.getLoaits().equals("Phương Tiện Vận Tải")) {
            kq = obj.getPtvt_bienso() + ", " + obj.getPtvt_model() + ", " + obj.getPtvt_namsx();
        } else if (obj.getLoaits().equals("Máy Móc")) {
            kq = obj.getMm_loaimm();
        } else {
            kq = obj.getDiachi() + "," + obj.getPhuongxa() + "," + obj.getQuanhuyen() + "," + obj.getTinhtp();
        }
        return kq;
    }
}
