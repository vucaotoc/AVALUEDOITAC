package ChiNhanh;

import java.io.Serializable;

public class objChiNhanh implements Serializable {

    int idcn;
    String tencn;
    String macn;
    String dbname;
    int hoatdong;

    public int getIdcn() {
        return idcn;
    }

    public void setIdcn(int idcn) {
        this.idcn = idcn;
    }

    public String getTencn() {
        return tencn;
    }

    public void setTencn(String tencn) {
        this.tencn = tencn;
    }

    public String getMacn() {
        return macn;
    }

    public void setMacn(String macn) {
        this.macn = macn;
    }

    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }

    public int getHoatdong() {
        return hoatdong;
    }

    public void setHoatdong(int hoatdong) {
        this.hoatdong = hoatdong;
    }
}
