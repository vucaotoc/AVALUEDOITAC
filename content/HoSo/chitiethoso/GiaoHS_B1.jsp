<%@page import="NhanVien.objNhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("hsedit_hs") != null) {
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
%>

<div class="row">   
    <div class="col-md-12">        
        <div class="col-md-12"> 
            <form  role="form"  method="post" id="frmgiaonhan" >    
                <div class="box box-success">
                    <div class="box-header with-border">           
                        <h4>Xác nhận hoàn thành in ấn hồ sơ ?</h4>                    
                    </div>
                    <div class="box-body">         

                        <div class="col-lg-12">
                            <label>Người nhận hồ sơ: <span class="badge bg-green"> Ngân Hàng </span> </label>  
                            <div id="signature-pad3" class="signature-pad" style="width: 100%;height: 300px;">
                                <div class="signature-pad--body">
                                    <canvas id="chuky1"></canvas>
                                </div>
                                <div class="signature-pad--footer">
                                    <div class="signature-pad--actions">
                                        <div> <button type="button" class="button clear3" data-action="clear3">Xóa</button>  
                                        </div>                           
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="chukynh" id="signature1" />
                        </div>
                        <div class="col-lg-12">
                            <label>Người nhận hồ sơ: <span class="badge bg-aqua">Khách Hàng </span> </label>                          


                            <div id="signature-pad2" class="signature-pad" style="width: 100%;height: 300px;">
                                <div class="signature-pad--body">
                                    <canvas id="chuky2"></canvas>
                                </div>
                                <div class="signature-pad--footer">
                                    <div class="signature-pad--actions">
                                        <div> <button type="button" class="button clear3" data-action="clear3">Xóa</button>  
                                        </div>                           
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="chukykh" id="signature2" />
                        </div> 
                    </div>
                    <div class="box-footer">  
                        <div id="tbloi"></div>
                        <a href="hoso?id=<%=objhs.getIdhs()%>" class="btn bg-navy pull-left">Đóng</a>                                               
                        <button type="button" class="btn bg-green-active pull-right" data-toggle="modal" dat-target="#xacnhancapnhat" id="btnthemmoi">Cập nhật</button> 

                        <div class="modal modal-default fade" id="xacnhancapnhat">
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
                    </div>
                </div>
                <!-- /.modal-content -->
            </form>
        </div>
        <!-- /.modal-dialog -->
    </div>       
</div>
<script src="dist/css/signature/signature_pad.umd.js" ></script>
<script src="dist/css/signature/app.js"></script>  
<script src="dist/css/signature/app_1.js"></script>
<script type="text/javascript">

                                            function canvasToString(canvas) {

                                                var dataString = canvas.toDataURL("image/png");
                                                var index = dataString.indexOf(",") + 1;
                                                dataString = dataString.substring(index);
                                                return dataString;
                                            }
                                            function xacnhandagiaohoso() {
                                                document.getElementById('tbloi').removeAttribute('h2');
                                                var signaturePad = document.getElementById("chuky1");
                                                document.getElementById("signature1").value = canvasToString(signaturePad);
                                                var signaturePad = document.getElementById("chuky2");
                                                document.getElementById("signature2").value = canvasToString(signaturePad);
                                                $.ajax({
                                                    type: "POST",
                                                    url: "hosogn?hoanthanhgiaonhan",
                                                    data: $("#frmgiaonhan").serialize(),
                                                    success: function (data) {
                                                        if (data === 'ok') {
                                                            document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">xác nhận thành công !!</h2>';
                                                            document.getElementById('themmoi').style.display = 'none';
                                                            $("#btnthemmoi").remove();
                                                            window.open("hoso?id=" +<%=objhs.getIdhs()%>, "_self");
                                                        } else {
                                                            document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                                        }
                                                    },
                                                    error: function () {
                                                        document.getElementById('tbloi').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                                    }
                                                });
                                                $("#themmoi").modal('hide');
                                            }
</script>
<%}%>