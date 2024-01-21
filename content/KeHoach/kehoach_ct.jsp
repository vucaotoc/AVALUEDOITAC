<%@page import="NhanVien.objNhanVien"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("kehedit") != null) {
        KeHoachPAK.objKeHoach objkeh = (KeHoachPAK.objKeHoach) session.getAttribute("kehedit");
        DecimalFormat fmVND = new DecimalFormat("###,###,###");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
        HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
        System.out.println(dtf.format(objkeh.getNgaylap()));
%>

<section class="content-header">
    <h1>
        <h2>THÔNG TIN KẾ HOẠCH HỒ SƠ [<%=objkeh.getMahs()%>]</h2>
        <a href="hoso?id=<%=objkeh.getIdhs()%>"  class="btn btn-warning" >Quay về</a>
    </h1>           
</section>

<div class="row">   
    <form  role="form"  method="post" id="frmkehadd" > 
        <div class="col-md-6">  
            <div class="col-md-12">  
                <div class="box box-success">     
                    <div class="box-header with-border">           
                        <h2>Thông Tin Kế Hoạch <a href="kehinphieu"  class="badge bg-aqua" target="_blank" >In Phiếu</a></h2>                        
                    </div>
                    <div class="box-body">   
                        <div class="col-lg-4">
                            <label>Mã hồ sơ: </label>
                            <input type="text" name="mahs" class="form-control" value="<%=objkeh.getMahs()%>" disabled/>
                        </div> 
                        <div class="col-lg-4">
                            <label>Số chứng thư:</label>
                            <input type="text" name="soct" class="form-control" value="<%=objkeh.getSoct()%>" disabled />
                        </div>      
                        <div class="col-lg-4">
                            <label>Ngày Lập <span class="text-red">(*)</span>: </label>
                            <input type="text" name="ngaylap" class="form-control"  value="<%=dtf.format(objkeh.getNgaylap())%>" id="datepicker"/>
                        </div>   
                        <div class="col-lg-12">
                            <label>Tên Khách Hàng:</label>
                            <input type="text" name="tenkh"  value="<%=objkeh.getTenkh()%>" class="form-control" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Địa Chỉ:</label>
                            <input type="text" name="diachikh" value="<%=objkeh.getDiachikh()%>" class="form-control" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Đối tác Ngân Hành/PGD:</label>
                            <input type="text" name="doitacpgd" class="form-control"  value="<%=objkeh.getDoitacpgd()%>" />
                        </div>     
                        <div class="col-lg-12">
                            <label>Tài sản thẩm định:</label>
                            <input type="text" name="taisantd" value="<%=objkeh.getTaisantd()%>" class="form-control" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Địa chỉ tài sản:</label>
                            <input type="text" name="diachits" value="<%=objkeh.getDiachits()%>"  class="form-control"  />
                        </div>

                        <div class="col-lg-12">
                            <label>Mục đích thẩm định:</label>
                            <input type="text" name="mucdich" value="<%=objkeh.getMucdich()%>" class="form-control" />
                        </div>                                
                    </div>
                </div>
            </div>
            <div class="col-md-12">  
                <div class="box box-success">    
                    <div class="box-header with-border">           
                        <h4>Hồ sơ do:</h4>                    
                    </div>
                    <div class="box-body">   
                        <div class="col-lg-12">
                            <label class="col-lg-2">Ông (bà):</label>
                            <input class="col-lg-6"type="text" name="phutrach" value="<%=objkeh.getPhutrach()%>" class="form-control" />
                            <label class="col-lg-4">Phụ trách</label>
                        </div>     
                        <div class="col-lg-12">
                            <label class="col-lg-2">Ông (bà):</label>
                            <input class="col-lg-6"type="text" name="phoihop1" value="<%=objkeh.getPhoihop1()%>"  class="form-control" />
                            <label class="col-lg-4">Phối hợp thực hiện</label>
                        </div>    
                        <div class="col-lg-12">
                            <label class="col-lg-2">Ông (bà):</label>
                            <input class="col-lg-6"type="text" name="phoihop2" value="<%=objkeh.getPhoihop2()%>" class="form-control" />
                            <label class="col-lg-4">Phối hợp thực hiện</label>
                        </div>    
                    </div>
                </div>
            </div>                   
        </div>
        <div class="col-md-6">  
            <div class="col-md-12">  
                <div class="box box-success">    
                    <div class="box-header with-border">           

                    </div>
                    <div class="box-body">   
                        <div class="col-lg-12">
                            <label>Thời gian ký hợp đồng:</label>
                            <input type="text" name="thoigiankyhd" value="<%=dtf.format(objkeh.getThoigiankyhd())%>" class="form-control" id="datepicker1" />    
                        </div>     
                        <div class="col-lg-12">
                            <label>Giá trị hợp đồng:</label>
                            <div class="col-sm-12">
                                <div class="col-sm-8">
                                    <input type="text" name="giatrihd" id="giatrihd" value="<%=fmVND.format(objkeh.getGiatrihd())%>" class="form-control" /> 
                                </div>
                                <div class="col-sm-4">                                    
                                    <select class="form-control" name="giatrivat">
                                        <option value="<%=objkeh.getGiatrivat()%>"><%=objkeh.getGiatrivat()%></option>
                                        <option value="Gồm VAT">Gồm VAT</option>
                                        <option value="Không VAT">Không VAT</option>
                                    </select>                                                                    
                                </div>
                            </div>  
                        </div>
                        <div class="col-lg-12">
                            <label >Tỷ lệ chiết khấu:</label>
                            <input type="text" name="chietkhau" value="<%=objkeh.getChietkhau()%>" class="form-control" />                              
                        </div>  
                        <div class="col-lg-12">
                            <label>Thời gian ký khảo sát hiện trạng:</label>
                            <input type="text" name="thoigianks" class="form-control" value="<%=dtf.format(objkeh.getThoigianks())%>" id="datepicker2" />                                
                        </div>    
                        <div class="col-lg-12">
                            <label>Thời gian dự kiến hoàn thành:</label>
                            <input type="text" name="thoigianht" class="form-control" value="<%=dtf.format(objkeh.getThoigianht())%>" id="datepicker3" />                                
                        </div>    

                    </div>
                </div>
            </div>
            <div class="col-md-12">  
                <div class="box box-success">
                    <div class="box-body">         
                        <div class="col-md-6">  
                            <label>Vị trí thửa đất:</label>
                            <div class="checkbox">
                                <label >
                                    Đã chọn:<span class="text-red"><%=DATA.function.xuly_hienthi_truongKS(objkeh.getVitri())%></span>
                                </label>
                                <div class="checkbox">
                                    <label >
                                        <input type="checkbox" name="vitri" value="Vị trí 1">Vị trí 1
                                    </label>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="vitri" value="Vị trí 2">Vị trí 2
                                    </label>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="vitri" value="Vị trí 3">Vị trí 3
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="vitri" value="Vị trí 4">Vị trí 4
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6"> 
                            <label>Giả thiết đặc biệt/loại đất:</label>
                            <div class="checkbox">
                                <label >
                                    Đã chọn:<span class="text-red"><%=DATA.function.xuly_hienthi_truongKS(objkeh.getGiathiet())%></span>
                                </label>
                                <div class="checkbox">
                                    <label >
                                        <input type="checkbox" name="giathiet" value="Hợp thửa">Hợp thửa
                                    </label>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="giathiet" value="Đất SXKD">Đất SXKD
                                    </label>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="giathiet" value="Đất TMDV">Đất TMDV
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="giathiet" value="Đất ở">Đất ở
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label >
                                        <input type="checkbox" name="giathiet" value="Đất ở VPLG">Đất ở VPLG
                                    </label>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="giathiet" value="Đất NN">Đất NN
                                    </label>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="giathiet" value="Đất NN (khung)">Đất NN (khung)
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>Khác</label>
                                    <input type="text" name="giathiet" class="form-control" value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12"> 
            <div class="col-md-6">  
                <div class="box box-success">    
                    <div class="box-header with-border">           

                    </div>
                    <div class="box-body">   
                        <div class="col-lg-12">
                            <label>Người liên hệ thu hồi công nợ: Ông (bà):</label>
                            <input type="text" name="cn_nguoi" class="form-control" value="<%=objkeh.getCn_nguoi()%>" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Điện thoại:</label>
                            <input type="text" name="cn_dienthoai"  class="form-control"  value="<%=objkeh.getCn_dienthoai()%>" />
                        </div> 
                        <div class="col-lg-12">
                            <label>Địa chỉ giao hồ sơ:</label>
                            <input type="text" name="cn_diachi" class="form-control" value="<%=objkeh.getCn_diachi()%>"  />
                        </div>     
                        <div class="col-lg-12">
                            <label>Email xuất hoá đơn:</label>
                            <input type="text" name="cn_email" class="form-control" value="<%=objkeh.getCn_email()%>" />
                        </div>                                 
                    </div>
                </div>
            </div>

            <div class="col-md-6">  
                <div class="box box-success">
                    <div class="box-body">  
                        <div class="col-lg-12">
                            <label>Người phụ trách:</label>
                        </div>
                        <img id="chukycu" src="data:image/png;base64,<%=objkeh.getChuky()%>" style="width: 100%;height: 300px;"/>
                        <% if (objhs.getIdnvgia() == avl_login.getIdnv() || avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager) {%>              
                        <div id="chukymoi">
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
                        </div>
                        <button type="button" class="btn bg-red-active btn-flat margin-r-5" data-toggle="modal" data-target="#m_editchuky" id="btnthaydoi">Xác Nhận</button>
                        <div class="modal modal-default fade" id="m_editchuky">
                            <div class="modal-dialog"> 
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title">Cập nhật chử ký</h4>
                                    </div>
                                    <div class="modal-body">        
                                        <label>Xác nhận thay đổi chử ký ?</label>                        
                                        <div id="tbloick"></div>
                                    </div>
                                    <div class="modal-footer">                                   
                                        <button type="button" class="btn bg-navy pull-left" data-dismiss="modal">Đóng</button>
                                        <button type="button" class="btn bg-green pull-right" onclick="thaydoichuky();">Cập Nhật</button>
                                    </div>
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

        <% if (objhs.getIdnvgia() == avl_login.getIdnv() || avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager) {%>              

        <div class="col-md-6">  

            <div id="tbloi">
            </div>
            <button type="button" class="btn bg-green-active btn-flat margin-r-5" data-toggle="modal" data-target="#themmoi" id="btnthemmoi">Cập Nhật</button>   
            <div class="modal modal-default fade" id="themmoi">
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
                            <button type="button" class="btn bg-green pull-right" onclick="themmoikeh()">Cập Nhật</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

            </div>
        </div>           
        <%}%>



        <input type="hidden" name="chuky" id="signature1" />
      
    </form>
</div>
<script src="dist/css/signature/signature_pad.umd.js" ></script>
<script src="dist/css/signature/app.js"></script>  
<script type="text/javascript">
                                $("#datepicker").datepicker({
                                    format: "dd/mm/yyyy"
                                });
                                $("#datepicker1").datepicker({
                                    format: "dd/mm/yyyy"
                                });
                                $("#datepicker2").datepicker({
                                    format: "dd/mm/yyyy"
                                });
                                $("#datepicker3").datepicker({
                                    format: "dd/mm/yyyy"
                                });
                                var currentDate = new Date();
                               
                             

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

                                    } else {                    // send xhr requests
                                        _timer = window.setTimeout(function () {
                                            _onInputChange();
                                        }, _timeOut);
                                    }
                                }).on('focusout', function (e) {

                                });

                                function formatCurrency(number) {
                                    var n = number.split('').reverse().join("");
                                    var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
                                    return  n2.split('').reverse().join('');
                                }
                                function canvasToString(canvas) {

                                    var dataString = canvas.toDataURL("image/png");
                                    var index = dataString.indexOf(",") + 1;
                                    dataString = dataString.substring(index);
                                    return dataString;
                                }

                                function themmoikeh() {
                                    document.getElementById('tbloi').removeAttribute('h2');
                                    $.ajax({
                                        type: "POST",
                                        url: "kehedit?save",
                                        data: $("#frmkehadd").serialize(),
                                        success: function (data) {
                                            if (data === 'ok') {
                                                document.getElementById('tbloi').innerHTML = '<h2 class="success text-success">Thêm mới thông tin thành công !!</h2>';
                                                document.getElementById('themmoi').style.display = 'none';
                                                $("#btnthemmoi").remove();
                                                window.open("hoso?id=" +<%=objkeh.getIdhs()%>, "_self");
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

                                function thaydoi() {
                                    document.getElementById('chukycu').style.display = 'none';
                                    document.getElementById('btnthaydoi').style.display = 'none';
                                    document.getElementById('chukymoi').style.display = 'block';
                                    document.getElementById('btnxacnhan').style.display = 'block';

                                }

                                function thaydoichuky() {
                                    document.getElementById('tbloick').removeAttribute('h2');
                                    var signaturePad = document.getElementById("chuky1");
                                    document.getElementById("signature1").value = canvasToString(signaturePad);
                                    $.ajax({
                                        type: "POST",
                                        url: "kehedit?thaydoichuky",
                                        data: $("#frmkehadd").serialize(),
                                        success: function (data) {
                                            if (data === 'ok') {
                                                document.getElementById('tbloick').innerHTML = '<h2 class="success text-success">cập nhật thành công !!</h2>';
                                                location.reload();
                                            } else {
                                                document.getElementById('tbloick').innerHTML = '<h2 class="error text-danger"><em>' + data + '</em></h2>';
                                            }
                                        },
                                        error: function () {
                                            document.getElementById('tbloick').innerHTML = '<h2 class="error text-danger"><em>Lỗi hệ thống</em></h2>';
                                        }
                                    });
                                    $("#m_editchuky").modal('hide');
                                }
</script>



<%}%>