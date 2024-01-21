<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-4">
                            <label>Mã hồ sơ: </label>
                            <input type="text" name="mahs" class="form-control" value="<%=objhs.getMahs()%>" <% if (!DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_UpMaHS_HS)) { %>  disabled<%}%>/>
                        </div> 
                            <div class="col-lg-4">
                                <label>Số chứng thư:</label>
                                <input type="text" name="soct" class="form-control" value="<%=objhs.getSoct()%>" disabled />
                            </div>      
                            <div class="col-lg-4">
                                <label>Ngày Lập <span class="text-red">(*)</span>: </label>
                                <input type="text" name="ngahd" class="form-control"  value="<%=dtf.format(objhs.getNgaylaphs())%>" id="datepicker"/>
                            </div>                      
                        <div class="col-lg-12">
                            <label>Đối tác ngân hàng/Phòng giao dịch:(cập nhật ở tài sản)</label>
                            <input type="text" name="doitac" class="form-control"  value="<%=objhs.getDoitac()%>" disabled/>
                        </div>     
                        <div class="col-lg-12">
                            <label>Cán bộ ngân hàng:(cập nhật ở tài sản)</label>
                            <input type="text" name="canbo" class="form-control"  value="<%=objhs.getCbthuchien()%>" disabled/>
                        </div>     
                        <div class="col-lg-6">
                            <label>Giá trị HĐ [Bằng tiền]:</label>
                            <input type="text" name="giatrihd" id="giatrihd" class="form-control" value="<%=fmVND.format(objhs.getGiatrihd())%>"/>
                        </div> 
                        <div class="col-lg-6">
                            <label>Giá trị HĐ [Bằng chữ]:</label>
                            <input type="text" name="giatrihdbangchu" id="giatrihd_bangchu" class="form-control" value="<%=objhs.getGiatrihdbangchu()%>" readonly="" />
                        </div>


                        <div class="col-lg-4">
                            <label>Nhân viên Lập HS:</label>
                            <input type="text" name="soct" class="form-control" value="<%=objhs.getTennvtao()%>" disabled="" />
                        </div>  
