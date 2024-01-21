<%@page import="java.text.SimpleDateFormat"%>
<%@page import="NhanVien.objNhanVien"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("ksedit_ks") != null && session.getAttribute("hsedit_hs") != null) {
        KhaoSat.objKhaoSat objks = (KhaoSat.objKhaoSat) session.getAttribute("ksedit_ks");
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");

%>
<section class="content-header">
    <h1>
        <h2>CHI TIẾT PHIẾU KHẢO SÁT</h2>
        <a href="hoso?id=<%=objhs.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>
<div class="row">
    <form  role="form"  method="post" id="frmtsedit" > 
        <div class="col-md-12">   
            <div class="box box-success">
                <div class="box-header with-border">           
                    <h2>Thông Tin Tài Sản Khảo Sát <a href="inphieuks"  class="badge bg-aqua" target="_blank" >In Phiếu</a></h2>                        
                </div>
                <div class="box-body">  
                    <div class="form-group col-lg-4">
                        <label>Mã Hồ Sơ:</label>
                        <input type="text" name="mahs" class="form-control" value="<%=objks.getMahs()%>" disabled=""/>
                    </div> 

                    <div class="form-group col-lg-4">
                        <label>Nhân viên khảo sát:</label>
                        <input type="text" name="tennvks" class="form-control" value="<%=objks.getTennvks()%>" disabled=""/>
                    </div>   
                    <div class="form-group col-lg-3">
                        <label>Loại tài sản khảo sát:</label>
                        <input type="text" name="loaits" class="form-control" value="<%=objks.getLoaits()%>" disabled="" />
                    </div>
                    <div class="form-group col-lg-9">
                        <label>Địa chỉ tài sản:</label>
                        <input type="text" name="diachits" class="form-control" value="<%=objks.getDiachits()%>" disabled=""/>
                    </div> 
                    <div class="form-group col-lg-4">
                        <label>Thời gian khảo sát: </label>
                        <input type="text" name="ngayks" class="form-control" id="datepicker" value="<%=dtf.format(objks.getNgayks())%>"  disabled=""/>
                    </div> 



                    <div class="form-group col-lg-4">
                        <label>Tọa độ Goole Maps:</label>
                        <div class="input-group margin">
                            <input type="text" name="toadolocation" id="toadomaps" class="form-control" value="<%=objks.getLocation()%>" /> 
                            <div class="input-group-btn">
                                <a class="btn btn-primary pull-right" href="maps?toado=<%=objks.getLocation()%>" target="_blank">Xem bản đồ</a>  
                            </div>

                        </div>
                    </div> 


                    <div class="form-group col-lg-4">
                        <label>Chí phí khảo sát:</label>

                        <input type="text" name="chiphiks"  id="chiphiks" class="form-control" value="<%=fmVND.format(objks.getChiphiks())%>" />


                    </div>  
                    <div class="form-group col-lg-4">
                        <label>Phí tạm ứng:</label>

                        <input type="text" name="phitamung"  id="phitamung" class="form-control" value="<%=fmVND.format(objks.getChiphitamung())%>" />


                    </div> 
                </div> 
                <div class="box-footer">   

                    <% if (avl_login.getManv().equals(objks.getManvks()) && objhs.getTinhtrang() <= DATA.danhsachBIEN._hs_raChungThu) {%>

                    <button type="button" class="btn bg-green-active btn-flat pull-left" data-toggle="modal" data-target="#capnhat" id="btncapnhat">Cập Nhật</button>
                    <div class="modal modal-default fade" id="capnhat">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Cập nhật</h4>
                                </div>
                                <div class="modal-body">                                    
                                    <p>Xác nhận cập nhật thông tin  ?</p>
                                    <div id="tbloi1"></div>
                                </div>
                                <div class="modal-footer">                                   
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn bg-green pull-right" onclick="capnhat()">Cập nhật</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>          
                    <script>
                        function capnhat() {
                            $.ajax({
                                type: "POST",
                                url: "ksedit?capnhatks",
                                data: $("#frmtsedit").serialize(),
                                success: function (data) {
                                    if (data === 'ok') {
                                        document.getElementById('tbloi1').innerHTML = '<h2 class="success text-success">Cập nhật thông tin thành công !!</h2>';
                                        document.getElementById('capnhat').style.display = 'none';
                                        $("#btncapnhat").remove();
                                        window.open("khaosat?id=" +<%=objks.getIdks()%>, "_self");
                                        $("#capnhat").modal('hide');
                                    } else {
                                        document.getElementById('tbloi1').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                    }
                                },
                                error: function () {
                                    document.getElementById('tbloi1').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                }
                            });


                        }
                    </script>
                    <%}%>
                    <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager && objhs.getTinhtrang() <= DATA.danhsachBIEN._hs_raChungThu
                                || avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin && objhs.getTinhtrang() <= DATA.danhsachBIEN._hs_raChungThu) {%>
                    <button type="button" class="btn bg-red-gradient btn-flat pull-right" data-toggle="modal" data-target="#xoaphieuks" id="btnxoaks">Xóa Phiếu Khảo Sát</button>
                    <div class="modal modal-default fade" id="xoaphieuks">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span></button>
                                    <h4 class="modal-title">Cập nhật</h4>
                                </div>
                                <div class="modal-body">                                    
                                    <h1>Xác nhận xóa thông tin phiếu Khảo sát  ?</h1>
                                    <div id="tbloi"></div>
                                </div>
                                <div class="modal-footer">                                   
                                    <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn bg-red-gradient pull-right" onclick="xoaphieuks()">Xóa Phiếu Khảo Sát</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>          
                    <script>
                        function xoaphieuks() {
                            $.ajax({
                                type: "POST",
                                url: "ksedit?xoaphieuks",
                                data: $("#frmtsedit").serialize(),
                                success: function (data) {
                                    if (data === 'ok') {
                                        document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Cập nhật thông tin thành công !!</h2>';
                                        document.getElementById('xoaphieuks').style.display = 'none';
                                        $("#btnxoaks").remove();
                                        $("#xoaphieuks").modal('hide');
                                        window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");
                                    } else {
                                        document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                    }
                                },
                                error: function () {
                                    document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                }
                            });


                        }
                    </script>

                    <%}%>



                </div>
            </div>
        </div>

        <% if (objks.getLoaits().startsWith("Phương Tiện Vận Tải")) { %>
        <%@include  file="ksphuongtienvanchuyen_ct.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Chung Cư")) {%>
        <%@include  file="kschungcu_ct.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Nhà Phố") || objks.getLoaits().startsWith("Biệt Thự") || objks.getLoaits().startsWith("Văn Phòng")) {%>
        <%@include  file="ksnhapho_ct.jsp" %>
        <%} else if (objks.getLoaits().startsWith("Đất Trống")) {%>        
        <%@include  file="ksdattrong_ct.jsp" %>   
        <%} else if (objks.getLoaits().startsWith("Máy Móc")) {%>
        <%@include  file="ksmaymoc_ct.jsp" %>  
        <%} else if (objks.getLoaits().startsWith("Nhà Xưởng")) {%>
        <%@include  file="ksnhaxuong_ct.jsp" %>  
        <%}%>     



        <div class="col-md-12">   
            <div class="box box-primary">
                <div class="box-header with-border">    
                    <h2>Chử ký người hướng dẫn</h2>               
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <div id="signature-pad3" class="signature-pad">
                            <div class="signature-pad--body">
                                <img width="100%" min-height="100px" src="data:image/png;base64,<%=objks.getChukyhsks()%>" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">   
                </div>
            </div>   
        </div>
        <div class="col-md-12">   
            <div class="box box-primary">
                <div class="box-header with-border">    
                    <h2>Chử ký cán bộ thực hiện</h2>               
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <div  id="signature-pad2" class="signature-pad">
                            <div class="signature-pad--body">
                                <img width="100%" min-height="100px" src="data:image/png;base64,<%=objks.getChukynvks()%>" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">   
                </div>
            </div>   
        </div>
    </form>
</div>

<script>
    var _timer, _timeOut = 2000;
    $('#phitamung').on('input', function (e) {
        $(this).val(formatCurrency(this.value.replace(/[,]/g, '')));
    }).on('keypress', function (e) {
        if (!$.isNumeric(String.fromCharCode(e.which))) {
            e.preventDefault();
        }
    }).on('paste', function (e) {
        var cb = e.originalEvent.clipboardData || window.clipboardData;
        if (!$.isNumeric(cb.getData('text')))
            e.preventDefault();
    });
    $('#chiphiks').on('input', function (e) {
        $(this).val(formatCurrency(this.value.replace(/[,]/g, '')));
    }).on('keypress', function (e) {
        if (!$.isNumeric(String.fromCharCode(e.which))) {
            e.preventDefault();
        }
    }).on('paste', function (e) {
        var cb = e.originalEvent.clipboardData || window.clipboardData;
        if (!$.isNumeric(cb.getData('text')))
            e.preventDefault();
    });
    function formatCurrency(number) {
        var n = number.split('').reverse().join("");
        var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
        return  n2.split('').reverse().join('');
    }
</script>
<%}%>