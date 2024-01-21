package TaiSan;

import DATA.DBConnection;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DATaiSan {

    public static ArrayList<objTaiSan> getListTS(String cn) {
        ArrayList<objTaiSan> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select a.*,COALESCE(b.mahs , '')  [mahs], COALESCE(b.ngaylaphs , '') [ngaylaphs] from tbl_taisantd a left join tbl_hoso b on a.idhs=b.idhs where a.tinhtrang=0 order by idts desc;";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objTaiSan obj = new objTaiSan();
                obj.setIdts(rs.getInt("idts"));
                obj.setIdhs(rs.getInt("idhs"));
                obj.setMahs(rs.getString("mahs"));
                obj.setNgaylaphs(rs.getTimestamp("ngaylaphs"));
                obj.setIdnvtao(rs.getInt("idnvtao"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setLoaits(rs.getNString("loaits"));
                obj.setTents(rs.getNString("tents"));
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setDiachi(rs.getNString("diachi"));
                obj.setNvks(rs.getNString("nvks"));
                obj.setTennvtao(rs.getNString("tennvtao"));
                obj.setNgayks(rs.getTimestamp("ngayks"));
                obj.setNotegia(rs.getNString("notegia"));
                obj.setGia(rs.getDouble("gia"));
                obj.setGiatd(rs.getDouble("giatd"));

                obj.setPtvt_loaixe(rs.getNString("ptvt_loaixe"));
                obj.setPtvt_model(rs.getNString("ptvt_model"));
                obj.setPtvt_mauson(rs.getNString("ptvt_mauson"));
                obj.setPtvt_namsx(rs.getNString("ptvt_namsx"));
                obj.setPtvt_bienso(rs.getString("ptvt_bienso"));

                obj.setDoitacnh(rs.getNString("doitacnh"));
                obj.setCanbonh(rs.getNString("canbonh"));
                obj.setNgaylapts(rs.getTimestamp("ngaylapts"));

                obj.setMm_loaimm(rs.getNString("mm_loaimm"));

                obj.setThongtints(objTaiSan.getthongtintaisan(obj));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getListTS  " + e.getMessage());
        }

        return arr;
    }

    public static ArrayList<objTaiSan> getListTS_by_idhs(int idhs, String cn) {
        ArrayList<objTaiSan> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select a.*,dakhaosat from tbl_taisantd a right join tbl_hoso_ct b on b.idts=a.idts where b.idhs=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objTaiSan obj = new objTaiSan();
                obj.setIdts(rs.getInt("idts"));
                obj.setIdhs(rs.getInt("idhs"));
                obj.setIdnvtao(rs.getInt("idnvtao"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setLoaits(rs.getNString("loaits"));
                obj.setTents(rs.getNString("tents"));
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setDiachi(rs.getNString("diachi"));
                obj.setNvks(rs.getNString("nvks"));
                obj.setTennvtao(rs.getNString("tennvtao"));
                obj.setNgayks(rs.getTimestamp("ngayks"));
                obj.setDakhaosat(rs.getInt("dakhaosat"));
                obj.setNotegia(rs.getNString("notegia"));
                obj.setGia(rs.getDouble("gia"));
                obj.setGiatd(rs.getDouble("giatd"));
                obj.setPtvt_loaixe(rs.getNString("ptvt_loaixe"));
                obj.setPtvt_model(rs.getNString("ptvt_model"));
                obj.setPtvt_mauson(rs.getNString("ptvt_mauson"));
                obj.setPtvt_namsx(rs.getNString("ptvt_namsx"));
                obj.setPtvt_bienso(rs.getString("ptvt_bienso"));
                obj.setGhichu(rs.getNString("ghichu"));
                obj.setDoitacnh(rs.getNString("doitacnh"));
                obj.setCanbonh(rs.getNString("canbonh"));
                obj.setNgaylapts(rs.getTimestamp("ngaylapts"));
                obj.setMm_loaimm(rs.getNString("mm_loaimm"));

                obj.setThongtints(objTaiSan.getthongtintaisan(obj));

                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getListTS_by_idhs  " + e.getMessage());
        }

        return arr;
    }

    public static objTaiSan getObjectTS(ResultSet rs) {
        objTaiSan obj = new objTaiSan();
        try {
            while (rs.next()) {
                obj.setIdts(rs.getInt("idts"));
                obj.setIdhs(rs.getInt("idhs"));
                obj.setIdnvtao(rs.getInt("idnvtao"));
                obj.setGia(rs.getDouble("gia"));
                obj.setNotegia(rs.getNString("notegia"));
                obj.setTents(rs.getNString("tents"));
                obj.setGiatd(rs.getDouble("giatd"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setLoaits(rs.getNString("loaits"));
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setDiachi(rs.getNString("diachi"));
                obj.setNvks(rs.getNString("nvks"));
                obj.setTennvtao(rs.getNString("tennvtao"));
                obj.setNgayks(rs.getTimestamp("ngayks"));
                obj.setPtvt_loaixe(rs.getNString("ptvt_loaixe"));
                obj.setPtvt_model(rs.getNString("ptvt_model"));
                obj.setPtvt_mauson(rs.getNString("ptvt_mauson"));
                obj.setPtvt_namsx(rs.getNString("ptvt_namsx"));
                obj.setPtvt_bienso(rs.getString("ptvt_bienso"));
                obj.setGhichu(rs.getNString("ghichu"));
                obj.setDoitacnh(rs.getNString("doitacnh"));
                obj.setCanbonh(rs.getNString("canbonh"));
                obj.setNgaylapts(rs.getTimestamp("ngaylapts"));
                obj.setMm_loaimm(rs.getNString("mm_loaimm"));
            }
        } catch (Exception e) {
            function.Print_log("getTSby_id " + e.getMessage());
        }

        return obj;
    }

    public static objTaiSan getTSby_id(int idts, String cn) {
        objTaiSan obj = new objTaiSan();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_taisantd where  idts=?; ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idts);
            ResultSet rs = psm.executeQuery();
            obj = getObjectTS(rs);
            conn.close();
        } catch (Exception e) {
            function.Print_log("getTSby_id " + e.getMessage());
        }

        return obj;
    }

    public static objTaiSan checkts_by_diachi(String tinhtp, String quanhuyen, String phuongxa, String diachi, String cn) {
        objTaiSan obj = new objTaiSan();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_taisantd where tinhtp=? and quanhuyen=? and phuongxa=? and diachi=?; ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, tinhtp);
            psm.setNString(2, quanhuyen);
            psm.setNString(3, phuongxa);
            psm.setNString(4, diachi);
            ResultSet rs = psm.executeQuery();
            obj = getObjectTS(rs);
            conn.close();
        } catch (Exception e) {
            function.Print_log("checkts_by_diachi " + e.getMessage());
        }

        return obj;
    }

    public static int themMoiTS(objTaiSan obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "insert into tbl_taisantd(loaits,gia,tinhtp,quanhuyen,phuongxa"
                    + ",diachi,idnvtao,tennvtao,nvks,notegia,tents"
                    + ",ptvt_loaixe,ptvt_model,ptvt_mauson,ptvt_namsx,ptvt_bienso"
                    + ",doitacnh,canbonh,mm_loaimm) "
                    + " values("
                    + "?,?,?,?,? "
                    + ",?,?,?,?,?,? "
                    + ",?,?,?,?,? "
                    + ",?,?,?) ";
            PreparedStatement psm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            psm.setNString(1, obj.getLoaits());
            psm.setDouble(2, 0);
            psm.setNString(3, obj.getTinhtp());
            psm.setNString(4, obj.getQuanhuyen());
            psm.setNString(5, obj.getPhuongxa());
            psm.setNString(6, obj.getDiachi());
            psm.setInt(7, obj.getIdnvtao());
            psm.setNString(8, obj.getTennvtao());
            psm.setNString(9, obj.getNvks());
            psm.setNString(10, obj.getNotegia());
            psm.setNString(11, obj.getTents());
            psm.setNString(12, obj.getPtvt_loaixe());
            psm.setNString(13, obj.getPtvt_model());
            psm.setNString(14, obj.getPtvt_mauson());
            psm.setNString(15, obj.getPtvt_namsx());
            psm.setNString(16, obj.getPtvt_bienso());
            psm.setNString(17, obj.getDoitacnh());
            psm.setNString(18, obj.getCanbonh());
            psm.setNString(19, obj.getMm_loaimm());
            kq = psm.executeUpdate();
            int idts = 0;
            if (kq > 0) {
                try (ResultSet rs = psm.getGeneratedKeys()) {
                    if (rs.next()) {
                        idts = rs.getInt(1);
                    }
                    rs.close();
                }
            }
            kq=idts;
            conn.close();
        } catch (Exception ex) {
            function.Print_log("themMoiTS " + ex.getMessage());
        }
        return kq;
    }

    public static int updateTS(objTaiSan obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_taisantd set loaits=?,gia=?,tinhtp=?,quanhuyen=?,phuongxa=?,diachi=?,ngayks=?,nvks=?,"
                    + " notegia=?,tents=?,ptvt_loaixe=?,ptvt_model=?,ptvt_mauson=?,ptvt_namsx=?,ghichu=?,doitacnh=?,canbonh=?,ptvt_bienso=?,mm_loaimm=? where idts=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, obj.getLoaits());
            psm.setDouble(2, obj.getGia());
            psm.setNString(3, obj.getTinhtp());
            psm.setNString(4, obj.getQuanhuyen());
            psm.setNString(5, obj.getPhuongxa());
            psm.setNString(6, obj.getDiachi());
            psm.setTimestamp(7, obj.getNgayks());
            psm.setNString(8, obj.getNvks());
            psm.setNString(9, obj.getNotegia());
            psm.setNString(10, obj.getTents());
            psm.setNString(11, obj.getPtvt_loaixe());
            psm.setNString(12, obj.getPtvt_model());
            psm.setNString(13, obj.getPtvt_mauson());
            psm.setNString(14, obj.getPtvt_namsx());
            psm.setNString(15, obj.getGhichu());
            psm.setNString(16, obj.getDoitacnh());
            psm.setNString(17, obj.getCanbonh());
            psm.setNString(18, obj.getPtvt_bienso());
            psm.setNString(19, obj.getMm_loaimm());
            psm.setInt(20, obj.getIdts());
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("updateTS " + ex.getMessage());
        }
        return kq;
    }

    public static int update_hosoid(int hsid, int tsid, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_taisantd set idhs=? where idts=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, hsid);
            psm.setInt(2, tsid);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_hosoid " + ex.getMessage());
        }
        return kq;
    }

    public static int update_tinhtrang(int tinhtrang, int tsid, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_taisantd set tinhtrang=? where idts=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, tinhtrang);
            psm.setInt(2, tsid);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_tinhtrang " + ex.getMessage());
        }
        return kq;
    }

    public static int update_giatd(double giatd, int idhs, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_taisantd set giatd=? where idhs=? and tinhtrang=0";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setDouble(1, giatd);
            psm.setInt(2, idhs);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_giatd " + ex.getMessage());
        }
        return kq;
    }
    
    public static int update_ghichu(objTaiSan obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_taisantd set ghichu=? where idts=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, obj.getGhichu());
            psm.setInt(2, obj.getIdts());
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_ghichu " + ex.getMessage());
        }
        return kq;
    }
      public static int update_notegia(objTaiSan obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_taisantd set notegia=? where idts=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, obj.getNotegia());
            psm.setInt(2, obj.getIdts());
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_notegia " + ex.getMessage());
        }
        return kq;
    }
}
