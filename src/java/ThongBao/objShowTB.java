
package ThongBao;

import java.io.Serializable;


public class objShowTB implements Serializable{
    int tongtb;
    int daks;
    int dabg;
    int dact;
    int dain;
    int khac;
    int tinnhan;

    public int getTinnhan() {
        return tinnhan;
    }

    public void setTinnhan(int tinnhan) {
        this.tinnhan = tinnhan;
    }
    public int getKhac() {
        return khac;
    }

    public void setKhac(int khac) {
        this.khac = khac;
    }
    
    public int getTongtb() {
        return tongtb;
    }

    public void setTongtb(int tongtb) {
        this.tongtb = tongtb;
    }

    public int getDaks() {
        return daks;
    }

    public void setDaks(int daks) {
        this.daks = daks;
    }

    public int getDabg() {
        return dabg;
    }

    public void setDabg(int dabg) {
        this.dabg = dabg;
    }

    public int getDact() {
        return dact;
    }

    public void setDact(int dact) {
        this.dact = dact;
    }

    public int getDain() {
        return dain;
    }

    public void setDain(int dain) {
        this.dain = dain;
    }
}
