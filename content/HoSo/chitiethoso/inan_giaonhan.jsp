
<%
    //HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
    //objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-3">
    <div class="box box-success">
        <div class="box-header with-border">           
            <h4>In Ấn</h4>                    
        </div>
        <div class="box-body">  
            <% if (objhs.getTinhtrang() == DATA.danhsachBIEN._hs_hoanThanhHS || objhs.getTinhtrang() == DATA.danhsachBIEN._hs_raChungThu) {  %>
            <% if (objhs.getIn_dain() == 1) { %>
            <div class="col-lg-12">
                <label>Hồ sơ chưa được in ấn.</label>
                <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_support) {%>
                <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#xacnhaninan" id="btnxacnhaninan">Xác Nhận In</button> 
                <div class="modal modal-default fade" id="xacnhaninan">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Cập nhật</h4>
                            </div>
                            <div class="modal-body">                                    
                                <p>Xác nhận hoàn thành in ấn hồ sơ ? 
                                    <span class="pull-right text-blue" ><input type="checkbox" id="editnvin" style="transform: scale(1.1);" />Thay đổi</span>
                                </p>
                                <form role="form"  method="post" id="frminan">
                                    <div class="form-group col-lg-6">
                                        <label id="lablediachi">Ngày in:</label>
                                        <input type="text" name="ngayinan" maxlength="10" class="form-control"  id="datengayin" disabled=""/>
                                    </div>  
                                    <div class="form-group col-lg-6">
                                        <label id="lablediachi">Nhân viên in:</label>
                                        <input type="text" name="nvinan" maxlength="40" value="<%=avl_login.getTennv()%>" id="nvin" class="form-control"  required="" disabled=""/>
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <label id="lablediachi">Ghi chú thông tin in:</label>
                                        <input type="text" name="notein" maxlength="500" placeholder="nhập thông tin cần ghi chú" id="notein" disabled=""  class="form-control"  />
                                    </div>
                                </form>
                                <div id="tbloiinan"></div>
                            </div>
                            <div class="modal-footer">     
                                <div></div>
                                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>    
                                <button type="button" class="btn btn-success pull-right" onclick="xacnhaninan();">Xác Nhận</button>                                    
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div> 
                <script type="text/javascript">
                    $("#datengayin").datepicker({
                        format: "dd/mm/yyyy"
                    });
                    var datengayin = new Date();
                    $("#datengayin").datepicker("setDate", datengayin);
                    var checkboxedit = document.getElementById('editnvin');

                    checkboxedit.addEventListener('change', (event) => {
                        if (event.currentTarget.checked) {
                            document.getElementById('nvin').disabled = false;
                            document.getElementById('datengayin').disabled = false;
                            document.getElementById('notein').disabled = false;
                        } else {
                            document.getElementById('nvin').disabled = true;
                            document.getElementById('datengayin').disabled = true;
                            document.getElementById('notein').disabled = true;
                        }
                    });
                    function xacnhaninan() {
                        document.getElementById('tbloiinan').removeAttribute('h2');
                        var nvin = document.getElementById('nvin').value;
                        var ngayin = document.getElementById('datengayin').value;
                        if (nvin.trim().length > 0 && ngayin.trim().length > 0) {
                            $.ajax({
                                type: "POST",
                                url: "hsinan?xacnhandain",
                                data: $("#frminan").serialize(),
                                success: function (data) {
                                    if (data === 'ok') {
                                        document.getElementById('tbloiinan').innerHTML = '<h2 class="success text-success">xác nhận thành công !!</h2>';
                                        document.getElementById('xacnhaninan').style.display = 'none';
                                        window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");
                                    } else {
                                        document.getElementById('tbloiinan').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                    }
                                },
                                error: function () {
                                    document.getElementById('tbloiinan').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                }
                            });
                        } else {
                            document.getElementById('tbloiinan').innerHTML = '<h2 class="error text-danger"><em>Vui lòng nhập đầy đủ thông tin.</em></h2>';
                        }
                    }
                </script>


                <%} %>

            </div> 
            <%} else {%>     
            <%  if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_support) {%>
            <div class="col-lg-12">
                <button type="button" class="btn bg-red-active pull-right" data-toggle="modal" data-target="#xacnhanhuyin" id="btnxnhuyin">Hủy In</button> 
                <div class="modal modal-default fade" id="xacnhanhuyin">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Cập Nhật</h4>
                            </div>
                            <div class="modal-body">                                    
                                <p>Xác nhận hủy in ấn hồ sơ  ?</p>
                                <div id="tbhuyin"></div>
                            </div>
                            <div class="modal-footer">                                   
                                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                 <button type="button" class="btn bg-green pull-right" onclick="xacnhanhuyin()">Xác Nhận</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->

                </div>    
                  <script type="text/javascript">
                    function xacnhanhuyin() {
                        document.getElementById('tbhuyin').removeAttribute('h2');
                        $.ajax({
                            type: "POST",
                            url: "hsinan?xacnhanhuyin",
                            success: function (data) {
                                if (data === 'ok') {
                                    document.getElementById('tbhuyin').innerHTML = '<h2 class="success text-success">xác nhận thành công !!</h2>';                                    
                                    $("#btnxnhuyin").remove();
                                    window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");
                                } else {
                                    document.getElementById('tbhuyin').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                }
                            },
                            error: function () {
                                document.getElementById('tbhuyin').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                            }
                        });
                        $("#xacnhanhuyin").modal('hide');
                    }
                </script>
            </div>
            <% }%>
            <div class="col-lg-12">
                <label>Ngày in ấn: </label>
                <input type="text" name="ngayina" class="form-control"  value="<%=dtf.format(objhs.getIn_thoigian())%>" id="datepicker"/>
            </div>     
            <div class="col-lg-12">
                <label>Nhân viên in :</label>
                <input type="text" name="tennvina" class="form-control" value="<%=objhs.getIn_tennv()%>" disabled />
            </div> 
            <div class="col-lg-12">
                <label> Ghi chú thông tin in:</label>
                <input type="text" name="noteina" class="form-control" value="<%=objhs.getIn_note()%>" disabled />                
            </div> 




            <%}%>
            <%}%>
        </div>
    </div>

</div>
<div class="col-lg-9">
    <div class="box box-success">
        <div class="box-header with-border">           
            <h4>Giao Nhận </h4>                    
        </div>
        <div class="box-body">  
            <% if (objhs.getTinhtrang() == DATA.danhsachBIEN._hs_hoanThanhHS || objhs.getTinhtrang() == DATA.danhsachBIEN._hs_raChungThu) {  %>
            <% if (objhs.getGiao_dagiao() == 1) { %>
            <div class="col-lg-12">
                <label>Hồ sơ chưa được giao cho khách hàng.</label>
                <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_deliver) {%>

                <button type="button" class="btn bg-green-active pull-right" data-toggle="modal" data-target="#xacnhangiao" id="btnxngiao">Xác nhận giao hồ sơ</button> 
                <div class="modal modal-default fade" id="xacnhangiao">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Cập Nhật</h4>
                            </div>
                            <div class="modal-body">                                    
                                <p>Xác nhận cập nhật thông tin  ?</p>
                            </div>
                            <div class="modal-footer">                                   
                                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                <button type="button" class="btn bg-green pull-right" onclick="xacnhandagiaohoso()">Xác Nhận</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->

                </div>
                <script type="text/javascript">
                    function xacnhandagiaohoso() {
                        document.getElementById('tbloi').removeAttribute('h2');
                        $.ajax({
                            type: "POST",
                            url: "hosogn?hoanthanhgiaonhan",
                            data: $("#frmgiaonhan").serialize(),
                            success: function (data) {
                                if (data === 'ok') {
                                    document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">xác nhận thành công !!</h2>';
                                    document.getElementById('xacnhangiao').style.display = 'none';
                                    $("#btnxngiao").remove();
                                    window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");
                                } else {
                                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                }
                            },
                            error: function () {
                                document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                            }
                        });
                        $("#btnxngiao").modal('hide');
                    }
                </script>


                <%} %>

            </div> 
            <%} else {%>           
            <div class="col-lg-6">
                <label>
                    <p>
                        <span class="badge bg-green">Ngân Hàng </span>
                        <span class="badge bg-blue"><%=objhs.getGiao_tennh()%></span>
                        ký nhận <span class="badge bg-gray"><%=objhs.getGiao_thoigiannh()%> </span>
                    </p>
                    <a href="hosogn?cncknh"  ><span class="badge bg-red">Thay đổi chử ký</span> </a>
                </label>        
                <img src="data:image/png;base64,<%=objhs.getGiao_chukynh()%>" width="100%" height="300px" />
            </div> 
            <div class="col-lg-6">
                <label>
                    <p>  <span class="badge bg-aqua">Khách Hàng </span> 
                        <span class="badge bg-blue"><%=objhs.getGiao_tenkh()%></span>
                        ký nhận <span class="badge bg-gray"><%=objhs.getGiao_thoigiankh()%> </span>
                    </p>
                    <a href="hosogn?cnckkh" ><span class="badge bg-red">Thay đổi chử ký</span> </a>
                </label>        
                <img src="data:image/png;base64,<%=objhs.getGiao_chukykh()%>" width="100%" height="300px" />
            </div> 




            <%}%>
            <%}%>
        </div>
    </div>
</div>
