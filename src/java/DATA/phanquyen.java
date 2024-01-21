package DATA;

public class phanquyen {
//a) 1 Thêm mới nhân viên 1
//b) 2 Thêm mới khách hàng 2
//c) 3 Thêm mới tài sản 3
//d) 4 Thêm mới hồ sơ 4
//e) 5 Phân quyền nhân viên khảo sát/ nhân viên báo giá 5
//f) 6 Tạo phiếu khảo sát 6
//g) 7 Upload Pháp lý, hình ảnh, Thông tin chứng thư 7 
//h) 8 Tra cứu dữ liệu tổng hợp (chế độ chỉ xem) 8
//i) 9 Tra cứu dữ liệu tổng hợp (chế độ edit, export file excel) 9
//    Manager: b đến i
//    user: b, c, f, g, h

    public static final int _Per_ThemMoiNV = 1;

    public static final int _Per_ThemMoiKH = 2;
    public static final int _Per_EditKH = 22;

    public static final int _Per_ThemMoiTS = 3;
    public static final int _Per_XoaTS = 33;

    public static final int _Per_ThemMoiHS = 4;
    public static final int _Per_XoaHS = 44;
    public static final int _Per_ADDNV_KS_BG = 5;
    public static final int _Per_KhoiPhuc_HS = 10;
    public static final int _Per_UpMaHS_HS = 11;
    public static final int _Per_CapNhatHS = 43;

    public static final int _Per_ThemMoiKS = 6;
    public static final int _Per_EditKS = 66;
    public static final int _Per_UPLOAD_PL_HA_CT = 7;

    public static final int _Per_TraCuu_view = 8;
    public static final int _Per_TraCuu_edit = 9;

    public static final int _Per_In_An = 65;
    public static final int _Per_Giao_Nhan = 66;

    public static final int _nhom_per_admin = 1;
    public static final int _nhom_per_manager = 2;
    public static final int _nhom_per_user = 3;
    public static final int _nhom_per_support = 4;
    public static final int _nhom_per_deliver = 5;

    static int[] per_manager = {2, 22, 3, 33, 4, 44, 5, 6, 66, 7, 8, 9, 10, 11, 43};
    static int[] per_user = {2, 22, 3, 6, 66, 7, 8, 43};
    static int[] per_support = {8,65};
    static int[] per_deliver = {8,66};

    public static boolean check_permission(int nhom_nv, int _quyen_chuc_nang) {
        boolean kq = false;
        //System.out.println("quyen "+nhom_nv+"  cn: "+_quyen_chuc_nang);
        switch (nhom_nv) {
            case _nhom_per_admin:
                kq = true;
                break;
            case _nhom_per_manager:
                for (int i = 0; i < per_manager.length; i++) {
                    if (per_manager[i] == _quyen_chuc_nang) {
                        kq = true;
                        break;
                    }
                }
                break;
            case _nhom_per_user:
                for (int i = 0; i < per_user.length; i++) {
                    if (per_user[i] == _quyen_chuc_nang) {
                        kq = true;
                        break;
                    }
                }
                break;
            case _nhom_per_support:
                for (int i = 0; i < per_support.length; i++) {
                    if (per_support[i] == _quyen_chuc_nang) {
                        kq = true;
                        break;
                    }
                }
                break;
            case _nhom_per_deliver:
                for (int i = 0; i < per_deliver.length; i++) {
                    if (per_deliver[i] == _quyen_chuc_nang) {
                        kq = true;
                        break;
                    }
                }
                break;
            default:
                break;
        }

        return kq;
    }
}
