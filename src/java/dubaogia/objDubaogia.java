/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dubaogia;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author nguyenvu
 */
public class objDubaogia implements Serializable{
    int id;
      String fulldiachi;
      String duong;
      String quanhuyen;
      String tinhtp;
      double dongia;
      String fulldate;
      String thangnam;
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

    public String getFulldiachi() {
        return fulldiachi;
    }

    public void setFulldiachi(String fulldiachi) {
        this.fulldiachi = fulldiachi;
    }

    public String getDuong() {
        return duong;
    }

    public void setDuong(String duong) {
        this.duong = duong;
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

    public double getDongia() {
        return dongia;
    }

    public void setDongia(double dongia) {
        this.dongia = dongia;
    }

    public String getFulldate() {
        return fulldate;
    }

    public void setFulldate(String fulldate) {
        this.fulldate = fulldate;
    }

    public String getThangnam() {
        return thangnam;
    }

    public void setThangnam(String thangnam) {
        this.thangnam = thangnam;
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
