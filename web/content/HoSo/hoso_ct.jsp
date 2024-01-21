<%@page import="KhaoSat.objKhaoSat"%>
<%@page import="java.util.Date"%>
<%@page import="TinNhan.objTinNhan"%>
<%@page import="NhanVien.objNhanVien"%>
<%@page import="TraCuuHS.objTraCuuHS"%>
<%@page import="DoiTacNH.objDoiTacNH"%>
<%@page import="HoSo.objHAPhapLy"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("hsedit_hs") != null) {
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat dtf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");

        objTraCuuHS objtc =new objTraCuuHS();
        if (session.getAttribute("objtc") != null) {
            objtc = (objTraCuuHS) session.getAttribute("objtc");
        }

        String toadots = "10.817805417041262, 106.65885357427744";
        objKhaoSat objks = new objKhaoSat();
        if (session.getAttribute("hsedit_ks") != null) {
            objks = (objKhaoSat) session.getAttribute("hsedit_ks");
            toadots = objks.getToadomaps();
        }
%>
<style>
    .MsoNormalTable {
        width:800pt;
        margin-left:0.9pt;
        background:white;
        border-collapse:collapse;
        font-size:10.0pt;
        font-family:"Arial",
            sans-serif;color:#222222
    }
    .MsoNormalTable tr{
        height:25.15pt
    }
    .MsoNormalTable tr td{
        width:34.4pt;
        border:solid windowtext 1.0pt;
        border-top:none;
        padding:0in 5.4pt 0in 5.4pt;
        height:26.5pt;
        line-height:26.5pt;
    }
    .MsoNormalTable tr td:first-child{
        width: 20pt;
        text-align: center;
    }
    td.title_box{
        width:34.4pt;
        border:solid windowtext 1.0pt;
        background:#D9D9D9;
        padding:0in 5.4pt 0in 5.4pt;
        height:25.15pt
    }
    td.title_item{


    }
    span.text_title{
        font-size:10.0pt;color:#222222
    }
    span.text_box{
        font-size:10.0pt;color:#222222
    }
</style>
<div class="content-wrapper" style="height: auto;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">            
                <a href="hoso"  class="btn btn-warning" >Quay về</a>     


            </div>          
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">   
                <div class="col-md-12 ">  
                    <div class="row">   
                        <div class="col-md-9">  
                            <div class="card card-success card-outline-tabs">
                                <div class="card-header">
                                    <h3 class="card-title">TÌNH TRẠNG HỒ SƠ</h3> 
                                    <div class="card-tools">                     
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>                      
                                    </div>
                                </div>
                                <div class="card-body">  
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label>MÃ HỒ SƠ:</label>
                                                    <input type="text" name="tenkh" class="form-control" value="<%=objtc.getMahs()%>" />                                
                                                </div>  
                                                <div class="col-md-12">
                                                    <label>CHỨNG THƯ:</label>
                                                    <input type="text" name="tenkh" class="form-control" value="<%=objtc.getSoct()%>"  />                                
                                                </div>  
                                                <div class="col-md-12">
                                                    <label>TÀI SẢN:</label>
                                                    <textarea type="text" name="tenkh" class="form-control" cols="2" rows="4"><%=objtc.getTaisan()%></textarea>                                
                                                </div>  
                                            </div>
                                        </div>
                                        <div class="col-md-6">

                                            <div class="box-body table-responsive">
                                                <table id="example1" class="table table-striped">                   
                                                    <thead>
                                                        <tr>     
                                                            <th>STT</th>
                                                            <th>Mục</th>
                                                            <th>Tình Trạng</th>
                                                            <th>Thời gian</th>                                
                                                        </tr>
                                                    </thead>
                                                    <tbody> 
                                                        <tr>        
                                                            <th>1</th>
                                                            <th>KHẢO SÁT</th>                                                   
                                                            <th><%=objtc.getKs_tt()%></th>
                                                            <th><%=objtc.getKs_tg()%></th>                                
                                                        </tr>
                                                        <tr>        
                                                            <th>2</th>
                                                            <th>THẨM ĐỊNH</th>                                                   
                                                            <th><%=objtc.getTd_tt()%></th>
                                                            <th><%=objtc.getTd_tg()%></th>                               
                                                        </tr>
                                                        <tr>        
                                                            <th>3</th>
                                                            <th>CHỨNG THƯ</th>                                                   
                                                            <th><%=objtc.getCt_tt()%></th>
                                                            <th><%=objtc.getCt_tg()%></th>                               
                                                        </tr>
                                                        <tr>        
                                                            <th>4</th>
                                                            <th>GIAO CHỨNG THƯ</th>                                                   
                                                            <th><%=objtc.getGiaoct_tt()%></th>
                                                            <th><%=objtc.getGiaoct_tg()%></th>                             
                                                        </tr>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>                                                       
                        <div class="col-md-3">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-success card-outline-tabs">
                                        <div class="card-header">
                                            <h3 class="card-title">HỒ SƠ SCAN</h3> 

                                            <div class="card-tools">                     
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa-minus"></i>
                                                </button>                      
                                            </div>
                                        </div>
                                        <div class="card-body table-responsive">  
                                            <table  class="table table-striped">        
                                                <tbody> 
                                                    <%
                                                        if (session.getAttribute("hoso_scan") != null) {
                                                            ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("hoso_scan");
                                                            if (arrHA.size() > 0) {
                                                                for (objHAPhapLy obj : arrHA) {
                                                    %>

                                                    <tr>                             

                                                        <td><a href="data/<%=obj.getfullPath()%>" target="_blank"><%=obj.getTenha()%> </a><br/> </td>                  
                                                        <td> 
                                                            <a href="upfhoso?down=<%=obj.getIdha()%>" ><span class="badge bg-blue">Tải về</span></a>
                                                        </td>
                                                    </tr>

                                                    <%}
                                                            }
                                                        }%>

                                                    <%  if (session.getAttribute("hsedit_ks") != null) {
                                                            if (objks.getLoaits().startsWith("Chung Cư")
                                                                    || objks.getLoaits().startsWith("Nhà Phố")
                                                                    || objks.getLoaits().startsWith("Biệt Thự")
                                                                    || objks.getLoaits().startsWith("Văn Phòng")
                                                                    || objks.getLoaits().startsWith("Đất Trống")) {    %>
                                                    <tr>
                                                        <td>Thông tin khảo sát tài sản</td>
                                                        <td> <a herf="#" onclick="exportWord();" class="pointer-event" >
                                                                <span class="badge bg-blue">Tải về</span>
                                                            </a> </td>
                                                    </tr>
                                                    <%}
                                                        }%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="card card-success card-outline-tabs">
                                        <div class="card-header">
                                            <h3 class="card-title">SƠ BỘ</h3> 
                                            <div class="card-tools">                     
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa-minus"></i>
                                                </button>                      
                                            </div>
                                        </div>
                                        <div class="card-body ">  
                                            <% if (objhs.getHinhbaogia().length() > 0) {%>
                                            <img src="data/<%=objhs.getMahs()%>/<%=objhs.getHinhbaogia()%>" height="200px" data-toggle="modal" data-target="#showhinhbaogia"/>
                                            <div class="modal modal-default fade" id="showhinhbaogia">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">           
                                                        <img src="data/<%=objhs.getMahs()%>/<%=objhs.getHinhbaogia()%>" height="500px" />
                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                                <!-- /.modal-dialog -->
                                            </div> 
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card card-primary card-outline-tabs  collapsed-card">
                                <div class="card-header">
                                    <h4 class="card-title">Hình ảnh tài sản</h4>
                                    <div class="card-tools">     
                                        <a href="downall" class="btn btn-tool" alt="tải hình tài sản" >
                                            <i class="fas fa-download"></i>Tải Về
                                        </a>  
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-plus"></i>
                                        </button>                      
                                    </div>
                                </div>
                                <div class="card-body">                           
                                    <div class="row">                                
                                        <%
                                            if (session.getAttribute("hsedit_HATS") != null) {
                                                ArrayList<objHAPhapLy> arrHA = (ArrayList<objHAPhapLy>) session.getAttribute("hsedit_HATS");

                                                for (objHAPhapLy obj : arrHA) {
                                        %>

                                        <div class="col-sm-2">
                                            <a href="data/<%=obj.getfullPath()%>" data-toggle="lightbox" data-title=""  data-gallery="gallery">
                                                <img src="data/<%=obj.getfullPath()%>"  class="img-fluid mb-2" alt=""  />
                                            </a>
                                        </div>                                   


                                        <%}
                                            }%>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="row">


                                <div class="col-md-12">
                                    <!-- USERS LIST -->
                                    <div class="card card-purple card-outline-tabs  collapsed-card">
                                        <div class="card-header">
                                            <h3 class="card-title">Hồ sơ thực hiển bởi:</h3>

                                            <div class="card-tools">                              
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa-plus"></i>
                                                </button>                               
                                            </div>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body p-0">
                                            <ul class="users-list clearfix">
                                                <%
                                                    if (session.getAttribute("hsedit_arrNV") != null) {
                                                        ArrayList<objNhanVien> arrNV = (ArrayList<objNhanVien>) session.getAttribute("hsedit_arrNV");
                                                        for (objNhanVien objnv : arrNV) {
                                                %>
                                                <li>
                                                    <img src="<%=objnv.getFullPathAvata()%>" alt="<%=objnv.getTennv()%>">
                                                    <a class="users-list-name" href="#"><%=objnv.getTennv()%></a>
                                                    <span class="users-list-date"><%=objnv.getSodt()%></span>
                                                </li>                               
                                                <%}
                                                    }%>

                                            </ul>
                                            <!-- /.users-list -->
                                        </div>                      
                                    </div>
                                    <!--/.card -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <!-- DIRECT CHAT -->
                                    <div class="card card-warning card-outline-tabs  collapsed-card">
                                        <div class="card-header">
                                            <h3 class="card-title">Nhắn tin với cán bộ thực hiện:</h3>

                                            <div class="card-tools">                                
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa-plus"></i>
                                                </button>                               
                                            </div>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="direct-chat-messages" id="khungchat">
                                                <%
                                                    if (session.getAttribute("hsedit_arrTN") != null) {
                                                        ArrayList<objTinNhan> arrTN = (ArrayList<objTinNhan>) session.getAttribute("hsedit_arrTN");
                                                        for (objTinNhan obj : arrTN) {
                                                            if (obj.getIdcbsend() == avl_login.getIddtnh()) {%>
                                                <!-- Message to the right -->
                                                <div class="direct-chat-msg right">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-right"><%=obj.getTencbSend()%></span>
                                                        <span class="direct-chat-timestamp float-left"><%=obj.getTime()%></span>
                                                    </div>
                                                    <!-- /.direct-chat-infos -->
                                                    <img class="direct-chat-img" src="dist/img/avatar.png" alt="message user image">
                                                    <!-- /.direct-chat-img -->
                                                    <div class="direct-chat-text">
                                                        <%=obj.getMess()%>
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                                <!-- /.direct-chat-msg -->

                                                <%} else {%>
                                                <!-- Message. Default to the left -->
                                                <div class="direct-chat-msg">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-left"><%=obj.getTennvSend()%></span>
                                                        <span class="direct-chat-timestamp float-right"><%=obj.getTime()%></span>
                                                    </div>
                                                    <!-- /.direct-chat-infos -->
                                                    <img class="direct-chat-img" src="<%=obj.getFullPathAvataNV()%>" alt="message user image">
                                                    <!-- /.direct-chat-img -->
                                                    <div class="direct-chat-text">
                                                        <%=obj.getMess()%>
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                                <!-- /.direct-chat-msg -->

                                                <%}
                                                        }
                                                    }%>          
                                                <div id="noidungmess"></div>
                                            </div>                           
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer">
                                            <form action="#" method="post" id="frmTinnhan">
                                                <div class="input-group">
                                                    <input type="text" name="message" id="message" placeholder="Nhập tin nhắn ..." class="form-control">
                                                    <span class="input-group-append">
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modalsendmess" >Send</button>
                                                    </span>
                                                </div>
                                            </form>

                                            <div class="modal modal-default fade" id="Modalsendmess">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">

                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">×</span>
                                                            </button>                                           
                                                        </div>
                                                        <div class="modal-body">             
                                                            <label>Xác nhận gửi tin nhắn  này ?</label>
                                                            <label class="text-red" id="tbloisendmess"></label>                                            
                                                        </div>
                                                        <div class="modal-footer">                                   
                                                            <button type="button" class="btn bg-navy" data-dismiss="modal">Đóng</button>
                                                            <button type="button" class="btn bg-red float-right" onclick="sendmess();">Xác Nhận</button>
                                                        </div>
                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                                <!-- /.modal-dialog -->
                                            </div>   
                                            <script type type="text/javascript">
                                                function sendmess() {
                                                    document.getElementById('tbloisendmess').removeAttribute('h4');
                                                    var mess = document.getElementById('message').value;
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "sendMess",
                                                        data: $("#frmTinnhan").serialize(),
                                                        success: function (data) {
                                                            if (data === 'ok') {
                                                                $("#Modalsendmess").modal('hide');
                                                                var html = '';
                                                                html += '<div class="direct-chat-msg right">';
                                                                html += '<div class="direct-chat-infos clearfix">';
                                                                html += '<span class="direct-chat-name float-right"><%=avl_login.getTencanbo()%></span>';
                                                                html += '<span class="direct-chat-timestamp float-left"><%=dtf2.format(new Date())%></span>';
                                                                html += '</div>';
                                                                html += '<img class="direct-chat-img" src="dist/img/avatar.png" alt="message user image">';
                                                                html += '<div class="direct-chat-text">' + mess;
                                                                html += '</div>';
                                                                html += '</div>';
                                                                document.getElementById('noidungmess').insertAdjacentHTML('beforebegin', html);
                                                                document.getElementById('message').value = '';
                                                                var objDiv = document.getElementById("khungchat");
                                                                objDiv.scrollTop = objDiv.scrollHeight;

                                                            } else {
                                                                document.getElementById('tbloisendmess').innerHTML = '<h4 class="error text-danger"><em>' + data + '</em></h4>';
                                                            }
                                                        },
                                                        error: function () {
                                                            document.getElementById('tbloisendmess').innerHTML = '<h4 class="error text-danger"><em>Lỗi hệ thống</em></h4>';
                                                        }
                                                    });
                                                }
                                            </script>
                                        </div>
                                        <!-- /.card-footer-->
                                    </div>
                                    <!--/.direct-chat -->
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-md-8">
                            <!-- DIRECT CHAT -->
                            <div class="card card-danger card-outline-tabs collapsed-card">
                                <div class="card-header">
                                    <h3 class="card-title">Bản Đồ</h3>

                                    <div class="card-tools">                                
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-plus"></i>
                                        </button>                               
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <iframe src="https://avalueapp.com/AVLAPP/tracuuquyhoach?toado=<%=toadots%>" width="100%" height="530px">

                                    </iframe>

                                </div>
                            </div>
                        </div>

                        <!--end row  -->
                    </div>
                </div>
                </section>
            </div>

            <%  if (session.getAttribute("hsedit_ks") != null) {
                    if (objks.getLoaits().startsWith("Phương Tiện Vận Tải")) {
            %>

            <%} else if (objks.getLoaits().startsWith("Chung Cư")) {%>

            <%@include file="khaosat/fileword_CC.jsp" %>
            <%} else if (objks.getLoaits().startsWith("Nhà Phố") || objks.getLoaits().startsWith("Biệt Thự") || objks.getLoaits().startsWith("Văn Phòng")) {%>

            <%@include file="khaosat/fileword_NP.jsp" %>  
            <%} else if (objks.getLoaits().startsWith("Đất Trống")) {%>      

            <%@include file="khaosat/fileword_DT.jsp" %>
            <%} else if (objks.getLoaits().startsWith("Máy Móc")) {%>

            <%} else if (objks.getLoaits().startsWith("Nhà Xưởng")) {%>

            <%} else if (objks.getLoaits().startsWith("Khác")) {%>

            <%}
                }%>          
            <script src="dist/js/FileSaver.js" type="text/javascript"></script>
            <script src="dist/js/jquery.wordexport.js" type="text/javascript"></script>  
            <script>
                                                $(function () {
                                                    var objDiv = document.getElementById("khungchat");
                                                    objDiv.scrollTop = objDiv.scrollHeight;

                                                    $(document).on('click', '[data-toggle="lightbox"]', function (event) {
                                                        event.preventDefault();
                                                        $(this).ekkoLightbox({
                                                            alwaysShowClose: true
                                                        });
                                                    });

                                                    $('.filter-container').filterizr({gutterPixels: 3});
                                                    $('.btn[data-filter]').on('click', function () {
                                                        $('.btn[data-filter]').removeClass('active');
                                                        $(this).addClass('active');
                                                    });
                                                });
                                                function exportWord() {
                                                    $("#WordSection1").wordExport('<%=objks.getMahs()%>_KhaoSat_fileword');
                                                    //$("#xuatfileword").modal('hide');
                                                }

            </script>
            <%} else {%>
            <div class="content-wrapper" style="height: auto;">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-12">
                                <h2>KHÔNG TÌM THẤY HỒ SƠ</h2>
                                <a href="hoso"  class="btn btn-warning" >Vui lòng thử lại</a>
                            </div>          
                        </div>
                    </div><!-- /.container-fluid -->
                </section>
            </div>
            <%}%>
