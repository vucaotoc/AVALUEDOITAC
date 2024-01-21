<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="box box-primary">
    <% if (session.getAttribute("hsedit_kh") != null) {
            KhachHang.objKhachhang objkh = (KhachHang.objKhachhang) session.getAttribute("hsedit_kh");
          
    %>
    <div class="box-header with-border">           
        <h4>Thông Tin Khách Hàng     
            <button type="button" class="badge bg-red" data-toggle="modal" data-target="#thaydoikhhs" id="btnthaydoikhhs">
                Xóa thông tin
            </button> 
        </h4>     
        <div class="modal modal-default fade" id="thaydoikhhs">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Cập nhật</h4>
                    </div>
                    <div class="modal-body">                                    
                        <p>Xác nhận thay đổi thông tin khách hàng hồ sơ ?</p>
                    </div>
                    <div class="modal-footer">                                   
                        <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                        <a href="addkh?addkh=0" class="btn bg-green pull-right">Xác Nhận </a>

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div> 
        <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
    </div>
    <div class="box-body">       
        <%  if (objkh.getNhomkh().equals("CN")) {%>
        <div class="form-group">            
            <label>Nhóm KH: CÁ NHÂN </label>                       
        </div>
        <div class="col-lg-8">
            <label>Tên khách hàng: </label>
            <input type="text" name="tenkh" class="form-control" value="<%=objkh.getTenkh()%>" required="" />                                
        </div>  
        <div class="col-lg-4">
            <label>Giới tính: </label>                        
            <input type="text" name="gioitinh" class="form-control" value="<%=objkh.getGioitinh()%>" />                    

        </div> 
        <div class="col-lg-6">
            <label>Số điện thoại: </label>
            <input type="text" name="sodt" class="form-control" required=""value="<%=objkh.getSodt()%>" />                                
        </div> 
        <div class="col-lg-6">
            <label>Email: </label>
            <input type="text" name="email" class="form-control" required=""value="<%=objkh.getEmail()%>"/>
        </div> 
        <div class="col-lg-12">
            <label>CMND Số:</label>
            <input type="text" name="cmndso" class="form-control"  required=""value="<%=objkh.getCmnd_so()%>"/>
        </div>                   
        <div class="col-lg-6">
            <label>CMND Nơi Cấp:</label>                       
            <select name= "cmndnoicap" class="form-control">
                <option value="<%=objkh.getCmnd_noicap()%>"><%=objkh.getCmnd_noicap()%></option>

            </select>                                                              
        </div>
        <div class="col-lg-6">
            <label>CMND ngày cấp: </label>
            <input type="text" name="cmndngaycap" class="form-control" required="" value="<%=objkh.getCmnd_ngaycap()%>"/>                                
        </div>  

        <%} else {%>
        <div class="form-group">
            <label>Nhóm KH: DOANH NGHIỆP </label>                       
        </div>

        <div class="form-group">
            <label>Tên công ty:</label>                       
            <input type="text" name="tencongty" class="form-control"  required=""value="<%=objkh.getTencongty()%>"/>                                     

        </div>
        <div class="form-group">
            <label>Mã số thuế:</label>                       
            <input type="text" name="masothue" class="form-control"  required=""value="<%=objkh.getMasothue()%>"/>                                       

        </div>
        <div class="form-group">
            <label>Đại diện:</label>                       
            <input type="text" name="daidien" class="form-control"  required=""value="<%=objkh.getDaidien()%>"/>                                     

        </div>
        <div class="form-group">
            <label>Chức vụ:</label>                       
            <input type="text" name="chucvu" class="form-control"  required=""value="<%=objkh.getChucvu()%>"/>                                      

        </div>

        <%}%>
        <div class="col-lg-8">
            <label>Tỉnh / Thành Phố: </label>
            <select class="form-control" name="tinhtp" required="">
                <option value="<%=objkh.getDc_tinhtp()%>"><%=objkh.getDc_tinhtp()%></option>    
            </select>                             
        </div> 
        <div class="col-lg-8">
            <label>Quận / Huyện: </label>
            <select class="form-control" name="quanhuyen" required="">
                <option value="<%=objkh.getDc_quanhuyen()%>"><%=objkh.getDc_quanhuyen()%></option>                            
            </select>                                
        </div> 
        <div class="col-lg-8">
            <label>Phường / Xã: </label>
            <input type="text" name="phuongxa" class="form-control" required=""value="<%=objkh.getDc_phuongxa()%>"/>
        </div> 
        <div class="col-lg-12">
            <label>Địa chỉ:</label>
            <input type="text" name="diachi" class="form-control"  required=""value="<%=objkh.getDc_diachi()%>"/>
        </div>                  
    </div>
    <%} else if (objhs.getTinhtrang() < DATA.danhsachBIEN._hs_hsDaHuy) { %>
    <div class="box-header with-border">           
        <h4>Thông Tin Khách Hàng 
        </h4>     
    </div>
    <div class="box-body">  
        <div class="form-group">                    
            <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager || avl_login.getIdnv() == objhs.getIdnvgia()) {%>
            <a href="addkh"  class="btn btn-success" >Chọn Khách Hàng</a>
            <%}%>
        </div>
    </div>
    <%}%>           
</div>