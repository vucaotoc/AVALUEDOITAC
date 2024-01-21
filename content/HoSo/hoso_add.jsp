<%@page import="TaiSan.objTaiSan"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% DecimalFormat fmVND = new DecimalFormat("###,###,###"); %>
<section class="content-header">
    <h1>
        <h2>THÊM MỚI HỒ SƠ</h2>
        <a href="hoso"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">   
    <div class="col-md-12">   
        <div class="box box-success">

            <div class="box-header with-border">           
                <h2>Thông Tin Tài Sản Thẩm Định</h2>  

                <a href="taisan"  class="btn btn-success">Chọn Tài Sản</a>

            </div>
            <div class="box-body">  
                <%
                    TaiSan.objTaiSan objts = new TaiSan.objTaiSan();
                    if (session.getAttribute("arrTS") != null) {
                        ArrayList<TaiSan.objTaiSan> arrts = (ArrayList<TaiSan.objTaiSan>) session.getAttribute("arrTS");

                %>
                <div class="box-body table-responsive no-padding">
                    <table id="example1" class="table table-bordered table-striped">                   
                        <thead>
                            <tr>   
                                <th >ID</th>
                                <th >Loại Tài Sản</th>
                                <th >Địa Chỉ</th>
                                <th >Giá Sơ Bộ</th>    
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>  
                            <% for (int i = 0; i < arrts.size(); i++) {
                                    objts = arrts.get(i);%>                                  
                            <tr>
                                <td><%=arrts.get(i).getIdts()%></td>
                                <td><%=arrts.get(i).getLoaits()%></td>
                                <td><%=arrts.get(i).getFullDiaChi()%> </td>
                                <td><%=arrts.get(i).getNotegia()%></td>
                                <td><a href="hsadd?delts=<%=arrts.get(i).getIdts()%>" class="btn btn-warning">Xóa</a> </td>
                            </tr>
                            <% } %>
                        </tbody>                        
                    </table>
                </div>
                <%}%>


            </div>
            <div class="box-footer">              
            </div>


        </div>
    </div>

    <div class="col-md-12">   
        <div class="box box-primary">
            <div class="box-header with-border">           
                <h2>Thông Tin Khách Hàng</h2>
                <a href="khachhang"  class="btn btn-primary">Chọn Khách Hàng</a>
                <% if (session.getAttribute("kh_hs") != null) { %>
                <a  href = "hsadd?xoakh"  class="btn btn-warning">Xóa Khách Hàng</a >
                <%}%>
            </div>
            <% if (session.getAttribute("kh_hs") != null) {
                    KhachHang.objKhachhang objkh = (KhachHang.objKhachhang) session.getAttribute("kh_hs");
                    //System.out.println(objkh.getTenkh());
                    if (objkh.getNhomkh().equals("CN")) {
            %>
            <div class="box-body">  
                <div class="form-group">
                    <label>Mã KH:</label>
                    <input type="text" name="mahs" class="form-control" value="<%=objkh.getMakh()%>" disabled=""/>
                </div> 
                <div class="form-group">
                    <label>Tên KH:</label>
                    <input type="text" name="soct" class="form-control" value="<%=objkh.getTenkh()%>" disabled=""/>
                </div>     
                <div class="form-group">
                    <label>Địa chỉ:</label>
                    <input type="text" name="ngahd" class="form-control"  value="<%=objkh.getFullDiaChi()%>"disabled=""/>
                </div>  
            </div>            
            <%} else {%>
            <div class="box-body">  
                <div class="form-group">
                    <label>Mã KH:</label>
                    <input type="text" name="mahs" class="form-control"  value="<%=objkh.getMakh()%>" disabled=""/>
                </div> 
                <div class="form-group">
                    <label>Tên Công Ty:</label>
                    <input type="text" name="soct" class="form-control" value="<%=objkh.getTencongty()%>" disabled=""/>
                </div>                     
                <div class="form-group">
                    <label>Địa chỉ:</label>
                    <input type="text" name="ngahd" class="form-control" value="<%=objkh.getFullDiaChi()%>"disabled=""/>
                </div>  
            </div>            


            <%}
                }%>
            <div class="box-footer">              
            </div>
        </div>
    </div>
    <form  role="form"  method="post" id="frmtsedit" > 
        <div class="col-md-12">   
            <div class="box box-success">
                <div class="box-header with-border">           
                    <h2>Thông Tin Hồ Sơ</h2>
                </div>
                <div class="box-body">  
                    <div class="form-group">
                        <label>Mã Hồ Sơ <span class="text-red" >(*)</span>:</label>
                        <input type="text" name="mahs" class="form-control" required=""/>
                    </div> 

                    <div class="form-group">
                        <label>Đối tác ngân hàng/Phòng giao dịch<span class="text-red" >(*)</span>:</label>
                        <input type="text" name="doitac" class="form-control" value="<%=objts.getDoitacnh()%>" required=""/>
                    </div> 
                    <div class="form-group">
                        <label>Cán bộ ngân hàng:<span class="text-red" >(*)</span>:</label>
                        <input type="text" name="canbo" class="form-control" value="<%=objts.getCanbonh()%>" required="" />
                    </div>      
                    <div class="form-group">
                        <label>Ngày Khởi Tạo<span class="text-red" >(*)</span>: </label>
                        <input type="text" name="ngaytaohs" class="form-control" id="datepicker" />
                    </div>        

                </div>            
                <div class="box-footer">              
                </div>
            </div>
        </div>


        <div class="col-md-12">   
            <div class="box box-success">          
                <div class="box-body">  
                    <div id="tbloi">

                    </div>
                    <div class="modal modal-default fade" id="capnhat">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Thêm Mới</h4>
                                </div>
                                <div class="modal-body">                                    
                                    <p>Xác nhận tạo hồ sơ ?</p>
                                </div>
                                <div class="modal-footer">                                   
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn bg-green pull-right" onclick="capnhatkh()">Xác Nhận</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>                       
                    <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#capnhat" id="btnthemmoi">Tạo Hồ Sơ </button>
                    <a href="hsadd?removehs"  class="btn btn-warning pull-right"  id="btntaolai">Tạo Lại</a>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $("#datepicker").datepicker({
        format: "dd/mm/yyyy"
    });
    var currentDate = new Date();
    $("#datepicker").datepicker("setDate", currentDate);
    function capnhatkh() {
        document.getElementById('tbloi').removeAttribute('h2');
        $.ajax({
            type: "POST",
            url: "hsadd?taohs",
            data: $("#frmtsedit").serialize(),
            success: function (data) {
                if (data === 'ok') {
                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">tạo hồ sơ thành công !!</h2>';
                    document.getElementById('btnthemmoi').style.display = 'none';
                    document.getElementById('btntaolai').style.display = 'none';
                    window.open("hoso", "_self");
                } else {
                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                }
            },
            error: function () {
                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
            }
        });

        $("#capnhat").modal('hide');
    }
</script>