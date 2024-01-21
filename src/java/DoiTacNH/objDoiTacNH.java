/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DoiTacNH;

import java.io.Serializable;

public class objDoiTacNH implements Serializable {

    int iddtnh;
    String tendoitac;
    String tencanbo;
    String diachi;
    String dienthoai;
    String email;
    int tinhtrang;
    int daxoa;
    String dbname;
    int quanly;
    int idquanly;
    String quanlyshow;
    String avatar;
    String cumchucnang;

    public String getCumchucnang() {
        return cumchucnang;
    }

    public void setCumchucnang(String cumchucnang) {
        this.cumchucnang = cumchucnang;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getQuanly() {
        return quanly;
    }

    public void setQuanly(int quanly) {
        this.quanly = quanly;
    }

    public int getIdquanly() {
        return idquanly;
    }

    public void setIdquanly(int idquanly) {
        this.idquanly = idquanly;
    }

    public String getQuanlyshow() {
        return quanlyshow;
    }

    public void setQuanlyshow(String quanlyshow) {
        this.quanlyshow = quanlyshow;
    }

    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }

    public int getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(int tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public int getDaxoa() {
        return daxoa;
    }

    public void setDaxoa(int daxoa) {
        this.daxoa = daxoa;
    }

    public int getIddtnh() {
        return iddtnh;
    }

    public void setIddtnh(int iddtnh) {
        this.iddtnh = iddtnh;
    }

    public String getTendoitac() {
        return tendoitac;
    }

    public void setTendoitac(String tendoitac) {
        this.tendoitac = tendoitac;
    }

    public String getTencanbo() {
        return tencanbo;
    }

    public void setTencanbo(String tencanbo) {
        this.tencanbo = tencanbo;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
