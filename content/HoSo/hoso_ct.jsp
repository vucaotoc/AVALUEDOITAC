<%@page import="HoSo.objHAPhapLy"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="NhanVien.objNhanVien"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("hsedit_hs") != null) {
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
        String qrcode = avl_login.getChinhanh() + objhs.getHscode();
%>
<section class="content-header">
    <h1>
        <h2>THÔNG TIN HỒ SƠ 
            [<%=objhs.getMahs()%>] 
            [<lable class="text-green" data-toggle="modal" data-target="#showqrcode" >QRCODE</lable>] 
            [<a href="#"><%=objhs.getTrangthaihs()%></a>] 
            <% if (objhs.getIn_dain() == 0) { %> [<span class="text-green">ĐÃ IN</span>]<%}%>
            <% if (objhs.getGiao_dagiao() == 0) { %> [<span class="text-yellow">ĐÃ GIAO</span>]<%}%>
        </h2>
        <% if (session.getAttribute("backhscn") != null) { %>
        <a href="hosocn"  class="btn btn-warning" >Quay về</a>
        <%} else {%>
         <a href="hoso"  class="btn btn-warning" >Quay về</a>
        <%}%>
    </h1>           
</section>

<div class="modal modal-default fade" id="showqrcode">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Mã QRCode hồ sơ [<%=objhs.getMahs()%>] : <%=qrcode%> 
                    <input type="hidden" id="macode" value="<%=qrcode%>" />
                    <input type="hidden" id="macode1" value="Quét và nhập mã để xem hồ sơ [<%=objhs.getMahs()%>]" /></h4>
            </div>
            <div class="modal-body">      
                <div id="hscode" style="width:300px;margin: 0px auto;"></div>
            </div>
            <div class="modal-footer">                                   
                <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>   
                <button type="button" class="btn bg-red-gradient pull-right" onclick="to_image();">Tải QRCode</button>   
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>            
<script>
    // Options
    var codehs = document.getElementById("macode").value;
    var codehs1 = document.getElementById("macode1").value;
    var options = {
        text: "http://avalueapp.com/AVLAPP/tracuuhs?mahs=" + codehs,
        width: 300,
        height: 300,
        title: codehs,
        titleHeight: 50,
        titleTop: 40,
        logo: "logo.png",
        titleColor: "#f01f1f",
        subTitleTop: 15,
        subTitle: codehs1,
        colorDark: "#000000",
        colorLight: "#ffffff",
        logoBackgroundColor: '#ffffff',
        logoBackgroundTransparent: false,
        correctLevel: QRCode.CorrectLevel.H
    };
    var qrcodehs = new QRCode(document.getElementById("hscode"), options);
    function to_image() {
        html2canvas(document.querySelector('#hscode')).then(function (canvas) {
            saveAs(canvas.toDataURL(), codehs + '.png');
        });
    }
    function saveAs(uri, filename) {

        var link = document.createElement('a');

        if (typeof link.download === 'string') {

            link.href = uri;
            link.download = filename;

            //Firefox requires the link to be in the body
            document.body.appendChild(link);

            //simulate click
            link.click();

            //remove the link when done
            document.body.removeChild(link);

        } else {

            window.open(uri);

        }
    }
</script>

<div class="row">   
    <div class="col-md-8 ">        
        <div class="col-md-12"> 
            <div class="box box-success">
                <div class="box-header with-border">           
                    <h4>Thông Tin Tài Sản Thẩm Định</h4>                    
                </div>
                <div class="box-body">  
                    <% if (session.getAttribute("hsedit_ts") != null) {
                            ArrayList<TaiSan.objTaiSan> arrts = (ArrayList<TaiSan.objTaiSan>) session.getAttribute("hsedit_ts");

                    %>
                    <%@include  file="chitiethoso/danhsach_taisan.jsp" %>
                    <%}%>
                </div>   
            </div>
        </div>
        <!-- /.col -->
        <div class="col-md-12">   
            <%@include  file="chitiethoso/nguoilienhe.jsp" %>
        </div>
        <div class="col-md-12">                   
            <form  role="form"  method="post" id="frmtsedit" >                
                <div class="box box-success">
                    <div class="box-header with-border">           
                        <h4>Thông Tin Hồ Sơ
                            <% if (objhs.getTinhtrang() == DATA.danhsachBIEN._hs_hoanThanhHS
                                        && avl_login.getQuyen() == DATA.phanquyen._nhom_per_user) {%>
                            <small class="text-red">(Hồ sơ đã hoàn thành, để thay đổi thông tin vui lòng liên hệ manager)</small>
                            <%}%>
                        </h4>                     
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                        </div>

                    </div>
                    <div class="box-body"> 
                        <%@include file="chitiethoso/thongtin_coban_hs.jsp" %>

                        <% if (objhs.getTinhtrang() < DATA.danhsachBIEN._hs_daKhaoSat && DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_ADDNV_KS_BG)) {%>
                        <div class="col-lg-4">
                            <label>Nhân viên khảo sát:</label>                            
                            <div class="input-group">
                                <input type="text" name="nvkhaosatname" id="nvkhaosatname" class="form-control" value="<%=objhs.getTennvks()%>" disabled="" />
                                <input type="hidden" name="nvkhaosatid" class="form-control" value="<%=objhs.getIdnvks()%>" disabled="" />
                                <div class="input-group-btn">
                                    <button type="button" class="btn bg-primary btn-flat pull-right" data-toggle="modal" data-target="#upnvkhaosat" id="btnnvks">Thay Đổi</button>  
                                </div>
                            </div>
                            <div class="modal modal-default fade" id="upnvkhaosat">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Cập nhật nv khảo sát cho hồ sơ.</h4>
                                        </div>
                                        <div class="modal-body">             
                                            <label>Chọn nhân viên khảo sát cho hồ sơ:</label>
                                            <div id="tbloinvks"></div>
                                            <select name= "nvkhaosatedit" id="nvkhaosatedit" class="form-control">                                
                                                <% if (session.getAttribute("hsedit_nv") != null) {
                                                        ArrayList<objNhanVien> arrnv = (ArrayList<objNhanVien>) session.getAttribute("hsedit_nv");
                                                        for (int i = 0; i < arrnv.size(); i++) {
                                                %>
                                                <option value="<%=arrnv.get(i).getIdnv()%>"><%=arrnv.get(i).getTennv()%></option>
                                                <%}
                                                    }%>
                                            </select>
                                        </div>
                                        <div class="modal-footer">                                   
                                            <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                            <button type="button" class="btn bg-red pull-right" onclick="upnvkhaosat();">Xác Nhận</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>     

                        </div>  
                        <%} else {%>

                        <div class="col-lg-4">
                            <label>Nhân viên khảo sát:</label>  
                            <input type="text" name="nvkhaosatname" id="nvkhaosatname" class="form-control" value="<%=objhs.getTennvks()%>" disabled="" />
                            <input type="hidden" name="nvkhaosatid" class="form-control" value="<%=objhs.getIdnvks()%>" disabled="" />                                
                        </div>
                        <%}%>


                        <% if (objhs.getTinhtrang() < DATA.danhsachBIEN._hs_daBaoGia && DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_ADDNV_KS_BG)) {%>
                        <div class="col-lg-4">
                            <label>Nhân viên báo giá:</label>
                            <div class="input-group">
                                <input type="text" name="nvbaogianame" id="nvbaogianame" class="form-control" value="<%=objhs.getTennvgia()%>" disabled="" />
                                <input type="hidden" name="nvbaogiaid" class="form-control" value="<%=objhs.getIdnvgia()%>" disabled="" />
                                <div class="input-group-btn">                                   
                                    <button type="button" class="btn bg-primary btn-flat pull-right" data-toggle="modal" data-target="#upnvbaogia" id="btnnvbg">Thay Đổi</button>

                                </div>
                            </div>

                            <div class="modal modal-default fade" id="upnvbaogia">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Cập nhật nv báo giá cho hồ sơ.</h4>
                                        </div>
                                        <div class="modal-body">             
                                            <label>Chọn nhân viên báo giá cho hồ sơ:</label>
                                            <label class="text-red" id="tbloinvbg"></label>
                                            <select name= "nvbaogiaedit" id="nvbaogiaedit" class="form-control">                                               
                                                <% if (session.getAttribute("hsedit_nv") != null) {
                                                        ArrayList<objNhanVien> arrnv = (ArrayList<objNhanVien>) session.getAttribute("hsedit_nv");
                                                        for (int i = 0; i < arrnv.size(); i++) {
                                                %>
                                                <option value="<%=arrnv.get(i).getIdnv()%>"><%=arrnv.get(i).getTennv()%></option>
                                                <%}
                                                    }%>
                                            </select>
                                        </div>
                                        <div class="modal-footer">                                   
                                            <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                            <button type="button" class="btn bg-red pull-right" onclick="upnvbaogia();">Xác Nhận</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>   
                        </div>    
                        <%} else {%>
                        <div class="col-lg-4">
                            <label>Nhân viên báo giá:</label>  
                            <input type="text" name="nvbaogianame" id="nvbaogianame" class="form-control" value="<%=objhs.getTennvgia()%>" disabled="" />
                            <input type="hidden" name="nvbaogiaid" class="form-control" value="<%=objhs.getIdnvgia()%>" disabled="" />                               
                        </div>
                        <%}%>


                    </div>            
                    <div class="box-footer">     
                        <div class="col-lg-3">                           
                            <input type="text" name="tinhtranghs" id="tinhtranghs" class="form-control" value="<%=objhs.getTrangthaihs()%>" disabled="" />   
                        </div>

                        <% if ((objhs.getTinhtrang() == DATA.danhsachBIEN._hs_dangBaoGia || (avl_login.getChinhanh().equals("NAN")
                                    && objhs.getTinhtrang() < DATA.danhsachBIEN._hs_daBaoGia)) && objhs.getIdnvgia() == avl_login.getIdnv()) {%>                                    
                        <div class="col-lg-3">
                            <button type="button" class="btn bg-green-active btn-flat pull-right" data-toggle="modal" data-target="#uphtbaogia" id="btnuphtbaogia">Đã Báo Giá</button>
                        </div>
                        <div class="modal modal-default fade" id="uphtbaogia">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title">Cập nhật báo giá</h4>
                                    </div>
                                    <div class="modal-body">             
                                        <label>Xác nhận đã báo giá cho khách hàng hồ sơ <%=objhs.getMahs()%> </label>
                                        <div id="tbloihtbg"></div>                                           
                                    </div>
                                    <div class="modal-footer">                                   
                                        <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                        <a href="hsedit?nvhtbg" class="btn bg-red pull-right" >Xác Nhận</a>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>   
                        <script type type="text/javascript">
                            function uphtbaogia() {
                                document.getElementById('tbloihtbg').removeAttribute('h4');
                                $.ajax({
                                    type: "POST",
                                    url: "hsedit?nvhtbg",
                                    data: $("#frmtsedit").serialize(),
                                    success: function (data) {
                                        if (data === 'ok') {
                                            document.getElementById('tbloihtbg').innerHTML = '<h4 class="success text-success">Cập nhật thành công !!</h4>';
                                            $("#upnvbaogia").modal('hide');
                                            document.getElementById('uphtbaogia').style.display = 'none';
                                            document.getElementById('tinhtranghs').value = "ĐÃ BÁO GIÁ";


                                        } else {
                                            document.getElementById('tbloihtbg').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                                        }
                                    },
                                    error: function () {
                                        document.getElementById('tbloihtbg').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
                                    }
                                });
                            }
                        </script>
                        <%}%>    

                        <% if (objhs.getTinhtrang() < DATA.danhsachBIEN._hs_hoanThanhHS && (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager || avl_login.getIdnv() == objhs.getIdnvgia())) {%>
                        <div class="col-lg-3">                           
                            <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#capnhat" id="btnthemmoi">Cập Nhật TT Hồ Sơ</button> 

                            <div class="modal modal-default fade" id="capnhat">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Cập nhật</h4>
                                        </div>
                                        <div class="modal-body">                                    
                                            <p>Xác nhận cập nhật thông tin hồ sơ ?</p>
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
                        </div>                    
                        <% if (DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_XoaHS)) {%>
                        <div class="col-lg-3">                          
                            <button type="button" class="btn bg-red-active btn-flat pull-right"  data-toggle="modal" data-target="#huyhoso" id="btnhuyhs">Hủy Hồ Sơ</button> 
                            <div class="modal modal-default fade" id="huyhoso">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Hủy Hồ Sơ</h4>
                                        </div>
                                        <div class="modal-body">                                    
                                            <p>Xác nhận hủy thông tin hồ sơ ?</p>
                                        </div>
                                        <div class="modal-footer">                                   
                                            <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                            <button type="button" class="btn bg-black pull-right" onclick="huyhoso();">Xác Nhận</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>           
                        </div>
                        <script type="text/javascript">
                            function huyhoso() {
                                document.getElementById('tbloi').removeAttribute('h2');
                                $.ajax({
                                    type: "POST",
                                    url: "hsedit?huyhs",
                                    data: $("#frmtsedit").serialize(),
                                    success: function (data) {
                                        if (data === 'ok') {
                                            document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Hủy hồ sơ thành công !!</h2>';
                                            document.getElementById('btnthemmoi').style.display = 'none';
                                            document.getElementById('btnhuyhs').style.display = 'none';
                                            window.open("hoso", "_self");
                                        } else {
                                            document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                        }
                                    },
                                    error: function () {
                                        document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                    }
                                });

                                $("#huyhoso").modal('hide');
                            }
                        </script>                   

                        <%}%>                   


                        <% if (DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_XoaHS) && objhs.getTinhtrang() == DATA.danhsachBIEN._hs_khoiTao) {%>
                        <div class="col-lg-2">                            
                            <button type="button" class="btn bg-black-active btn-flat pull-right" data-toggle="modal" data-target="#xoahoso" id="btnxoahs">Xóa HS</button>  
                        </div>
                        <div class="modal modal-default fade" id="xoahoso">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title">Xóa Hồ Sơ</h4>
                                    </div>
                                    <div class="modal-body">                                    
                                        <p>Nhập mật khẩu đăng nhập để xác nhận xóa thông tin hồ sơ ?</p>
                                        <input type="password" name="xoamatkhaudn" class="form-control" id="xoamatkhaudn"  />
                                        <div id="tbloixoahs"></div>  

                                    </div>
                                    <div class="modal-footer">                                   
                                        <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                        <button type="button" class="btn bg-black pull-right" onclick="xoahoso();">Xác Nhận</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>     

                        <script type="text/javascript">
                            function xoahoso() {
                                document.getElementById('tbloixoahs').removeAttribute('h2');
                                var mk = document.getElementById('xoamatkhaudn').value;
                                if (mk.length > 0) {
                                    $.ajax({
                                        type: "POST",
                                        url: "hsdel?xoamatkhaudn=" + mk,
                                        data: $("#frmtsedit").serialize(),
                                        success: function (data) {
                                            if (data === 'ok') {
                                                document.getElementById('tbloixoahs').innerHTML = '<h2 class="success text-success">Xóa hồ sơ thành công !!</h2>';
                                                $("#xoahoso").modal('hide');
                                                window.open("hoso", "_self");
                                            } else {
                                                document.getElementById('tbloixoahs').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                            }
                                        },
                                        error: function () {
                                            document.getElementById('tbloixoahs').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                        }
                                    });


                                }
                            }

                        </script>



                        <%}%>

                        <% if (objhs.getTinhtrang() == DATA.danhsachBIEN._hs_raChungThu) {%>
                        <div class="col-lg-2">                           
                            <a href="hsedit?hths=<%=objhs.getIdhs()%>" class="btn bg-green-active btn-flat margin-r-5"  id="btnhoanthanhhs">Hoàn Thành Hồ Sơ</a> 
                        </div> 
                        <%}%>

                        <%} else if (DATA.phanquyen.check_permission(avl_login.getQuyen(), DATA.phanquyen._Per_KhoiPhuc_HS) && objhs.getTinhtrang() == DATA.danhsachBIEN._hs_hsDaHuy) {%>
                        <div class="col-lg-2">                          
                            <button type="button" class="btn bg-red-active btn-flat pull-right"  data-toggle="modal" data-target="#khoiphuchs" id="btnkhoiphuchs">Khôi Phục Hồ Sơ</button> 
                            <div class="modal modal-default fade" id="khoiphuchs">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Khởi tạo lại hồ sơ</h4>
                                        </div>
                                        <div class="modal-body">                                    
                                            <p>Xác nhận khởi tạo lại thông tin hồ sơ ?</p>
                                            <p>Khi khởi tạo lại, hồ sơ sẽ trờ về trạng thái [KHỞI TẠO] !</p>
                                            <div id="tbloiktlhs"></div>    
                                        </div>
                                        <div class="modal-footer">                                   
                                            <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                            <button type="button" class="btn bg-success pull-right" onclick="khoitaolai();">Xác Nhận</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>          
                            <script type="text/javascript">
                                function khoitaolai() {
                                    document.getElementById('tbloiktlhs').removeAttribute('h4');
                                    $.ajax({
                                        type: "POST",
                                        url: "hsedit?ktlhs",
                                        data: $("#frmtsedit").serialize(),
                                        success: function (data) {
                                            if (data === 'ok') {
                                                document.getElementById('tbloiktlhs').innerHTML = '<h4 class="success text-success">Cập nhật thành công !!</h4>';
                                                $("#upnvbaogia").modal('hide');
                                                window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");

                                            } else {
                                                document.getElementById('tbloiktlhs').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                                            }
                                        },
                                        error: function () {
                                            document.getElementById('tbloiktlhs').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
                                        }
                                    });
                                }
                            </script>
                        </div>
                        <%} else if (objhs.getTinhtrang() == DATA.danhsachBIEN._hs_hoanThanhHS
                                && (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager)) {%>
                        <div class="col-lg-2">                           
                            <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#capnhat" id="btnthemmoi">Cập Nhật TT Hồ Sơ</button> 

                            <div class="modal modal-default fade" id="capnhat">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Cập nhật</h4>
                                        </div>
                                        <div class="modal-body">                                    
                                            <p>Xác nhận cập nhật thông tin hồ sơ ?</p>
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
                        </div>    
                        <%}%>
                        <div class="col-lg-8" id="tbloi">
                        </div>
                    </div>
                </div>


            </form>
        </div>  


    </div>                    
    <div class="col-md-4">    
        <div class="col-md-12"> 
            <%@include file="chitiethoso/thongtin_phaply.jsp" %>
        </div>
        <div class="col-md-12"> 
            <%@include file="chitiethoso/thumuc_hoso.jsp" %>
        </div>
        <div class="col-md-12">   
            <%@include file="chitiethoso/thongtin_khachhang.jsp" %>
        </div>
    </div>


    <div class="col-md-12">   
        <div class="col-md-12">
            <div class="box box-primary">        
                <% if (session.getAttribute("hsedit_ct") != null) {%>
                <div class="box-header with-border">           
                    <h4>Thông Tin Chứng Thư </h4>  
                    <div class="col-lg-12">
                        <a class="btn bg-green-active" href="hsedit?taifilect=<%=objhs.getMahs()%>" >Tải File Excel</a>

                        <% if (session.getAttribute("listfile_hs") != null) {%>
                        <a class="btn bg-red-active" href="upfhoso" >đã Upload Hồ Sơ</a>
                        <%} else {%>
                        <a class="btn bg-green-active" href="upfhoso" >Upload File Hồ Sơ</a>
                        <%}%>


                        <% if (avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager) { %>                    
                        <a class="btn bg-warning pull-right" href="ctdel" >Hoàn Tác Đã Báo Giá</a>                    
                        <%}%>
                    </div>  
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>            
                <div class="box-body">  
                    <%@include   file="chitiethoso/chungthu_ct.jsp" %>
                </div>
                <%} else { %>
                <div class="box-header with-border">           
                    <h4>Thông Tin Chứng Thư </h4> 
                    <% if (objhs.getTinhtrang() == DATA.danhsachBIEN._hs_daBaoGia && (objhs.getIdnvgia() == avl_login.getIdnv() || avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin)) {  %>           
                    <a href="ctadd"  class="btn btn-success" >Nhập Chứng Thư</a>    
                    <% }%>
                </div>
                <% }%>


            </div>
        </div>
    </div>




    <div class="col-md-12">  
        <div class="col-md-12">   

            <% if (session.getAttribute("hsedit_keh") != null) {%>
            <% KeHoachPAK.objKeHoach objkeh = (KeHoachPAK.objKeHoach) session.getAttribute("hsedit_keh");  %>
            <div class="box box-primary">
                <div class="box-header with-border">           
                    <h4>Thông Tin Kế Hoạch Thẩm Định Giá <a href="kehoach?id=<%=objkeh.getIdkh()%>" class="btn btn-flat bg-aqua-active">Chi Tiết</a></h4> 
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <div class="box-body">  
                    <%@include   file="chitiethoso/kehoach_ct.jsp" %>
                </div>
            </div>
            <%} else if (objhs.getIdnvgia() == avl_login.getIdnv() || avl_login.getQuyen()==DATA.phanquyen._nhom_per_admin ||  avl_login.getQuyen()==DATA.phanquyen._nhom_per_manager) {%> 
            <div class="box box-primary">
                <div class="box-header with-border">           
                    <h4>Thông Tin Kế Hoạch Thẩm Định Giá <a href="kehadd"  class="btn btn-success" >Thêm Mới</a></h4> 
                </div>           
                <div class="box-body">                
                </div>
            </div>
            <% } else {%>
            <div class="box box-primary">
                <div class="box-header with-border">           
                    <h4>Thông Tin Kế Hoạch Thẩm Định Giá</h4> 
                </div>           
                <div class="box-body">                
                </div>
            </div>

            <%}%>
        </div>
    </div>
    <div class="col-md-12"> 
        <%@include file="chitiethoso/inan_giaonhan.jsp" %>
    </div>      


</div>
<script src="dist/js/jsavl_currency.js" type="text/javascript"></script>
<script type="text/javascript">
                                                $("#datepicker").datepicker({
                                                    format: "dd/mm/yyyy"
                                                });

                                                var _timer, _timeOut = 2000;
                                                $('#giatrihd').on('input', function (e) {
                                                    $(this).val(formatCurrency(this.value.replace(/[,]/g, '')));
                                                }).on('keypress', function (e) {
                                                    if (!$.isNumeric(String.fromCharCode(e.which))) {
                                                        e.preventDefault();
                                                    }
                                                }).on('paste', function (e) {
                                                    var cb = e.originalEvent.clipboardData || window.clipboardData;
                                                    if (!$.isNumeric(cb.getData('text')))
                                                        e.preventDefault();
                                                }).on('keyup', function (e) {
                                                    clearTimeout(_timer);
                                                    if (e.keyCode === 13) {      // close on ENTER key
                                                        document.getElementById("giatrihd_bangchu").value = DocTienBangChu(this.value.replace(/[,]/g, ''));
                                                    } else {                    // send xhr requests
                                                        _timer = window.setTimeout(function () {
                                                            _onInputChange();
                                                        }, _timeOut);
                                                    }
                                                }).on('focusout', function (e) {
                                                    document.getElementById("giatrihd_bangchu").value = DocTienBangChu(this.value.replace(/[,]/g, ''));
                                                });

                                                function formatCurrency(number) {
                                                    var n = number.split('').reverse().join("");
                                                    var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
                                                    return  n2.split('').reverse().join('');
                                                }
                                                function capnhatkh() {
                                                    document.getElementById('tbloi').removeAttribute('h2');
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "hsedit?update",
                                                        data: $("#frmtsedit").serialize(),
                                                        success: function (data) {
                                                            if (data === 'ok') {
                                                                document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Cập nhật Hồ Sơ thành cồng !!</h2>';
                                                                document.getElementById('btnthemmoi').style.display = 'none';
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


                                                function upnvkhaosat() {
                                                    document.getElementById('tbloinvks').removeAttribute('h4');
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "hsedit?nvksup",
                                                        data: $("#frmtsedit").serialize(),
                                                        success: function (data) {
                                                            if (data === 'ok') {
                                                                document.getElementById('tbloinvks').innerHTML = '<h4 class="success text-success">Cập nhật thành công !!</h4>';
                                                                $("#upnvkhaosat").modal('hide');
                                                                document.getElementById('nvkhaosatname').value = $("#nvkhaosatedit option:selected").text();
                                                                document.getElementById('tinhtranghs').value = "ĐANG KHẢO SÁT";
                                                                window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");

                                                            } else {
                                                                document.getElementById('tbloinvks').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                                                            }
                                                        },
                                                        error: function () {
                                                            document.getElementById('tbloinvks').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
                                                        }
                                                    });
                                                }

                                                function upnvbaogia() {
                                                    document.getElementById('tbloinvbg').removeAttribute('h4');
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "hsedit?nvbgup",
                                                        data: $("#frmtsedit").serialize(),
                                                        success: function (data) {
                                                            if (data === 'ok') {
                                                                document.getElementById('tbloinvbg').innerHTML = '<h4 class="success text-success">Cập nhật thành công !!</h4>';
                                                                $("#upnvbaogia").modal('hide');
                                                                document.getElementById('nvbaogianame').value = $("#nvbaogiaedit option:selected").text();
                                                                document.getElementById('tinhtranghs').value = "ĐANG BÁO GIÁ";
                                                                window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");

                                                            } else {
                                                                document.getElementById('tbloinvbg').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                                                            }
                                                        },
                                                        error: function () {
                                                            document.getElementById('tbloinvbg').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
                                                        }
                                                    });
                                                }


</script>
</script>
<%} else {%>

<section class="content-header">
    <h1>
        <h2>KHÔNG TÌM THẤY HỒ SƠ</h2>
        <a href="hoso"  class="btn btn-warning" >Vui lòng thử lại</a>
    </h1>           
</section>
<%}%>